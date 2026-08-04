import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trana/core/constants/app_durations.dart';
import 'package:trana/core/constants/app_dimens.dart';
import 'package:trana/core/di/provider.dart';
import 'package:trana/core/error/failure.dart';
import 'package:trana/core/error/result.dart';
import 'package:trana/core/router/app_router.dart';
import 'package:trana/core/theme/app_theme.dart';
import 'package:trana/legacy/idcard_face_ekyc/ekyc/data/datasources/ekyc_detection_service.dart';
import 'package:trana/legacy/idcard_face_ekyc/ekyc/domain/entities/detection_event.dart';
import 'package:trana/legacy/idcard_face_ekyc/ekyc/presentation/viewmodels/adult_kyc_view_model.dart';

/// 신분증 촬영 화면
class IdCardCameraPage extends HookConsumerWidget {
  const IdCardCameraPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final brandColor = fxc(context).brandColor!;

    ref.watch(adultKycViewModelProvider); // auto-dispose 방지

    final controller = useState<CameraController?>(null);
    final isInitialized = useState(false);
    final isUploading = useState(false);
    final borderColor = useState<Color>(brandColor);
    final errorMessage = useState<String?>(null);
    final errorClearTimer = useState<Timer?>(null);
    // SDK 크롭 결과(자동) / takePicture 캡처 결과(수동) 경로
    final capturedImagePath = useState<String?>(null);

    useEffect(() {
      bool disposed = false;
      StreamSubscription<IdCardDetectionEvent>? sub;
      EkycDetectionService? service;

      Future<void> init() async {
        try {
          final cameras = await availableCameras();
          if (disposed) return;

          final backs = cameras
              .where((c) => c.lensDirection == CameraLensDirection.back)
              .toList();

          // iOS 프로 기종에서 메인 광각(backs[0])은 최소 초점거리로 인해 신분증 초점 안맞는 현상
          // 초광각(backs[2]=video:5)으로 근거리에서 자동 초점 맞출수있도록 함
          // 안드로이드는 기존 광각 유지
          final back = (Platform.isIOS && backs.length >= 3)
              ? backs[2]
              : backs.first;

          final cam = CameraController(
            back,
            ResolutionPreset.high,
            enableAudio: false,
            imageFormatGroup: Platform.isIOS
                ? ImageFormatGroup.bgra8888
                : ImageFormatGroup.yuv420,
          );
          await cam.initialize();
          if (disposed) {
            cam.dispose();
            return;
          }

          controller.value = cam;
          isInitialized.value = true;

          service = ref.read(ekycDetectionServiceProvider);

          // NCP 라이선스 검증
          final isVerified = await service!.verifyLicense(
            invokeUrl: dotenv.env['NCP_CLOVA_INVOKE_URL'] ?? '',
            secretKey: dotenv.env['NCP_CLOVA_SECRET_KEY'] ?? '',
          );
          debugPrint('[eKYC] 라이선스 검증: $isVerified');
          if (!isVerified || disposed) return;

          // EventChannel 구독 이후 onListen 콜백으로 idCardEventSink 확보
          sub = service!.idCardStream.listen((event) {
            if (disposed) return;
            debugPrint(
              '[IdCard] event: $event, isUploading=${isUploading.value}',
            );
            switch (event) {
              case IdCardReadyToCapture(:final croppedImageBytes):
                errorClearTimer.value?.cancel();
                errorClearTimer.value = null;
                errorMessage.value = null;
                borderColor.value = brandColor;

                if (!context.mounted) return;

                if (!isUploading.value) {
                  if (croppedImageBytes != null) {
                    // SDK 크롭 이미지 사용
                    _uploadCroppedBytes(
                      context,
                      ref,
                      croppedImageBytes,
                      cam,
                      capturedImagePath,
                      isUploading,
                      borderColor,
                      errorMessage,
                      service!,
                    );
                  } else {
                    // 크롭 실패 시 takePicture 폴백
                    _captureAndUpload(
                      context,
                      ref,
                      cam,
                      capturedImagePath,
                      borderColor,
                      errorMessage,
                      isUploading,
                      service!,
                    );
                  }
                }
              case IdCardError(:final message):
                errorClearTimer.value?.cancel();
                errorClearTimer.value = null;
                borderColor.value = Colors.red;
                errorMessage.value = message;
              case IdCardDetecting():
                // 오류 상태일 때만 타이머 시작
                // 타이머가 이미 실행 중이면 재시작하지 않음 (무한루프 방지)
                if (errorClearTimer.value == null &&
                    (errorMessage.value != null ||
                        borderColor.value == Colors.red)) {
                  errorClearTimer.value = Timer(
                    const Duration(milliseconds: 1500),
                    () {
                      if (!disposed) {
                        borderColor.value = brandColor;
                        errorMessage.value = null;
                        errorClearTimer.value = null;
                      }
                    },
                  );
                }
            }
          });

          // EventChannel onListen 후 감지 시작
          await service!.startIdCardDetection();
          if (disposed) return;

          cam.startImageStream((image) {
            if (!disposed) {
              service?.analyzeFrame(
                image,
                isFrontCamera: false,
                sensorOrientation: cam.description.sensorOrientation,
              );
            }
          });
        } catch (e) {
          debugPrint('신분증 카메라 초기화 실패: $e');
        }
      }

      init();

      return () {
        disposed = true;
        errorClearTimer.value?.cancel();
        sub?.cancel();
        final cam = controller.value;
        if (cam != null && cam.value.isStreamingImages) {
          cam.stopImageStream().catchError((_) {});
        }
        service?.stopDetection().catchError((_) {});
        cam?.dispose();
      };
    }, const []);

    const currentStep = 2;
    const totalStep = 5;
    final s = context.designScale;
    final hasError = errorMessage.value != null;

    return Scaffold(
      backgroundColor: vrc(context).background,
      appBar: AppBar(
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: vrc(context).background,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_new,
            size: 20 * s,
            color: vrc(context).iconPrimary,
          ),
          onPressed: () => context.pop(),
        ),
        title: Text(
          "본인 인증",
          style: TextStyle(
            color: vrc(context).textPrimary,
            fontSize: 16 * s,
            fontFamily: "PretendardBold",
            letterSpacing: -0.16 * s,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(4 * s),
          child: Align(
            alignment: Alignment.centerLeft,
            child: AnimatedContainer(
              duration: AppDurations.expand,
              height: 4 * s,
              width:
                  MediaQuery.sizeOf(context).width * (currentStep / totalStep),
              color: brandColor,
            ),
          ),
        ),
      ),

      body: Padding(
        padding: EdgeInsets.fromLTRB(20 * s, 24 * s, 20 * s, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "신분증 촬영",
              style: TextStyle(
                color: vrc(context).textPrimary,
                fontSize: 20 * s,
                fontFamily: "PretendardBold",
                letterSpacing: -0.20 * s,
              ),
            ),
            SizedBox(height: 6 * s),
            Text(
              "신원 확인을 위해 신분증 촬영이 필요해요.",
              style: TextStyle(
                color: vrc(context).textSecondary,
                fontSize: 14 * s,
                fontFamily: "PretendardMedium",
                letterSpacing: -0.14 * s,
              ),
            ),
            SizedBox(height: 75 * s),

            // 신분증 촬영 영역
            AnimatedContainer(
              duration: AppDurations.toggle,
              width: double.infinity,
              height: 212 * s,
              decoration: BoxDecoration(
                color: vrc(context).secondaryColor,
                border: Border.all(color: borderColor.value, width: 2),
                borderRadius: BorderRadius.circular(20 * s),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(18 * s),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    _buildPreview(
                      isInitialized: isInitialized.value,
                      controller: controller.value,
                      capturedImagePath: capturedImagePath.value,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 20 * s),

            // 하단 안내
            Center(
              child: _Pill(
                scale: s,
                color: hasError
                    ? Colors.red.withValues(alpha: 0.1)
                    : vrc(context).secondaryColor!,
                text: hasError
                    ? errorMessage.value!
                    : "빛 반사가 없는 밝은 곳에서 촬영해 주세요",
                textColor: hasError ? Colors.red : vrc(context).textSecondary!,
                icon: hasError ? Icons.error_outline : null,
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: SafeArea(
        minimum: EdgeInsets.fromLTRB(20 * s, 0, 20 * s, 16 * s),
        child: _CaptureButton(
          scale: s,
          loading: isUploading.value,
          onTap: () async {
            final cam = controller.value;
            if (cam == null || !cam.value.isInitialized) return;
            final svc = ref.read(ekycDetectionServiceProvider);
            await _captureAndUpload(
              context,
              ref,
              cam,
              capturedImagePath,
              borderColor,
              errorMessage,
              isUploading,
              svc,
            );
          },
        ),
      ),
    );
  }

  Widget _buildPreview({
    required bool isInitialized,
    required CameraController? controller,
    required String? capturedImagePath,
  }) {
    // 캡처 완료 후 업로드 중일때는 정지 화면 표시
    if (capturedImagePath != null) {
      return SizedBox.expand(
        child: Image.file(File(capturedImagePath), fit: BoxFit.cover),
      );
    }
    // 촬영 프리뷰
    if (isInitialized && controller != null) {
      return SizedBox.expand(
        child: FittedBox(
          fit: BoxFit.cover,
          child: SizedBox(
            width: controller.value.previewSize!.height,
            height: controller.value.previewSize!.width,
            child: CameraPreview(controller),
          ),
        ),
      );
    }
    return const Center(child: CircularProgressIndicator());
  }
}

/// 하단 안내 및 에러 메세지
class _Pill extends StatelessWidget {
  const _Pill({
    required this.scale,
    required this.color,
    required this.text,
    required this.textColor,
    this.icon,
  });

  final double scale;
  final Color color;
  final String text;
  final Color textColor;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    final s = scale;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14 * s, vertical: 8 * s),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16 * s),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[
            Icon(icon, size: 14 * s, color: textColor),
            SizedBox(width: 6 * s),
          ],
          Flexible(
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: textColor,
                fontSize: 12 * s,
                fontFamily: "PretendardMedium",
                letterSpacing: -0.12 * s,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// 직접 촬영 버튼
class _CaptureButton extends StatelessWidget {
  const _CaptureButton({
    required this.scale,
    required this.loading,
    required this.onTap,
  });

  final double scale;
  final bool loading;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final s = scale;
    return Material(
      color: loading ? vrc(context).disableColor : fxc(context).brandColor,
      borderRadius: BorderRadius.circular(16 * s),
      child: InkWell(
        borderRadius: BorderRadius.circular(16 * s),
        // 업로드 중 비활성화
        onTap: loading ? null : onTap,
        child: SizedBox(
          height: 52 * s,
          child: Center(
            child: Text(
              loading ? "업로드 중..." : "촬영하기",
              style: TextStyle(
                color: loading
                    ? vrc(context).textDisable
                    : fxc(context).textBrand,
                fontSize: 16 * s,
                fontFamily: "PretendardSemiBold",
                letterSpacing: -0.16 * s,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// SDK 크롭 이미지(Uint8List)를 임시 파일로 저장 후 OCR 업로드
Future<void> _uploadCroppedBytes(
  BuildContext context,
  WidgetRef ref,
  Uint8List croppedBytes,
  CameraController cam,
  ValueNotifier<String?> capturedImagePath,
  ValueNotifier<bool> isUploading,
  ValueNotifier<Color> borderColor,
  ValueNotifier<String?> errorMessage,
  EkycDetectionService service,
) async {
  if (isUploading.value) return;
  isUploading.value = true;

  try {
    if (cam.value.isStreamingImages) await cam.stopImageStream();

    // 크롭 바이트를 임시 파일로 저장 (정지 화면 출력과 OCR 업로드 시 사용)
    final tempFile = File(
      '${Directory.systemTemp.path}/id_card_${DateTime.now().millisecondsSinceEpoch}.jpg',
    );
    await tempFile.writeAsBytes(croppedBytes);
    capturedImagePath.value = tempFile.path;

    if (!context.mounted) {
      isUploading.value = false;
      return;
    }

    final result = await ref
        .read(adultKycViewModelProvider.notifier)
        .ocrIdCard(tempFile);

    isUploading.value = false;
    if (!context.mounted) return;

    switch (result) {
      case Success():
        context.push(AppRoutes.idCardConfirm);
      case Failure(:final failure):
        capturedImagePath.value = null; // 오류 시 활영 프리뷰 복귀
        _handleUploadError(
          context,
          ref,
          cam,
          borderColor,
          errorMessage,
          service,
          failure,
        );
    }
  } catch (e) {
    isUploading.value = false;
    capturedImagePath.value = null;
    debugPrint('크롭 업로드 오류: $e');
  }
}

/// takePicture 기반 수동 촬영 후 OCR 업로드
Future<void> _captureAndUpload(
  BuildContext context,
  WidgetRef ref,
  CameraController cam,
  ValueNotifier<String?> capturedImagePath,
  ValueNotifier<Color> borderColor,
  ValueNotifier<String?> errorMessage,
  ValueNotifier<bool> isUploading,
  EkycDetectionService service,
) async {
  if (isUploading.value) return;
  isUploading.value = true;

  try {
    if (cam.value.isStreamingImages) await cam.stopImageStream();
    await Future.delayed(const Duration(milliseconds: 300));
    if (!context.mounted) {
      isUploading.value = false;
      return;
    }

    final xfile = await cam.takePicture();
    capturedImagePath.value = xfile.path; // 캡처 즉시 정지 화면 전환

    final result = await ref
        .read(adultKycViewModelProvider.notifier)
        .ocrIdCard(File(xfile.path));

    isUploading.value = false;
    if (!context.mounted) return;

    switch (result) {
      case Success():
        context.push(AppRoutes.idCardConfirm);
      case Failure(:final failure):
        capturedImagePath.value = null; // 오류 시 촬영 프리뷰 복귀
        _handleUploadError(
          context,
          ref,
          cam,
          borderColor,
          errorMessage,
          service,
          failure,
        );
    }
  } catch (e) {
    isUploading.value = false;
    capturedImagePath.value = null;
    debugPrint('캡처 오류: $e');
  }
}

/// 업로드 실패 공통 처리
void _handleUploadError(
  BuildContext context,
  WidgetRef ref,
  CameraController cam,
  ValueNotifier<Color> borderColor,
  ValueNotifier<String?> errorMessage,
  EkycDetectionService service,
  AppFailure failure,
) {
  if (failure case SessionExpiredFailure(:final isSignupSession)) {
    final message = isSignupSession
        ? '인증 세션이 만료되었습니다. 처음부터 다시 시작해주세요.'
        : 'OCR 세션이 만료되었습니다. 다시 촬영해주세요.';
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text(message)));
    // 세션 만료 시 스낵바 출력 후 화면 이동
    if (isSignupSession) context.go(AppRoutes.terms);
    return;
  }

  if (failure case DuplicateIdentityFailure()) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('이미 인증된 신분증입니다. 로그인을 시도해주세요.')),
    );
    return;
  }

  // OCR 실패했거나 기타 오류 시 빨간 테두리
  borderColor.value = Colors.red;
  errorMessage.value = switch (failure) {
    OcrFailure() => '신분증을 인식하지 못했습니다. 다시 촬영해주세요.',
    _ => '오류가 발생했습니다. 다시 시도해주세요.',
  };

  // 카메라 스트림 재시작
  if (cam.value.isInitialized && !cam.value.isStreamingImages) {
    service.startIdCardDetection().catchError((_) {});
    cam.startImageStream((image) {
      service.analyzeFrame(
        image,
        isFrontCamera: false,
        sensorOrientation: cam.description.sensorOrientation,
      );
    });
  }
}
