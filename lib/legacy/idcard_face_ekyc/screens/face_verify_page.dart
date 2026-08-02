import 'dart:async';
import 'dart:io';

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
import 'package:trana/legacy/idcard_face_ekyc/ekyc/data/utils/image_orientation.dart';
import 'package:trana/legacy/idcard_face_ekyc/ekyc/domain/entities/detection_event.dart';
import 'package:trana/legacy/idcard_face_ekyc/ekyc/presentation/viewmodels/adult_kyc_view_model.dart';

/// 전면 카메라 얼굴 인증 화면. Liveness 감지 + 자동 완료 수행
class FaceVerifyPage extends HookConsumerWidget {
  const FaceVerifyPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 테마 색상
    final brandColor = fxc(context).brandColor!;

    // 상태 값들
    final controller = useState<CameraController?>(null);
    final isInitialized = useState(false);
    final isUploading = useState(false);
    final isRestarting = useState(false);
    final livenessCompleted = useState(false);
    final borderColor = useState<Color>(brandColor);
    final motionInstruction = useState<String>("정면을 응시해주세요");
    final errorMessage = useState<String?>(null);

    // 카메라 초기화 + SDK 감지 구독을 하나의 effect로 통합
    useEffect(() {
      bool disposed = false;
      StreamSubscription<FaceDetectionEvent>? sub;
      EkycDetectionService? service;

      Future<void> init() async {
        try {
          final cameras = await availableCameras();
          if (disposed) return;

          final front = cameras.firstWhere(
            (c) => c.lensDirection == CameraLensDirection.front,
          );
          final cam = CameraController(
            front,
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

          // iOS: 전면 카메라 촬영 시 화면이 하얗게 번쩍이는 Retina Flash(스크린 플래시) 끄기
          if (Platform.isIOS) {
            try {
              await cam.setFlashMode(FlashMode.off);
            } catch (_) {}
          }

          controller.value = cam;
          isInitialized.value = true;

          // EventChannel 구독. 이후 onListen 콜백으로 faceEventSink 확보
          service = ref.read(ekycDetectionServiceProvider);

          // 얼굴 감지 도메인 라이선스 검증 (id-card와 별도 키, 별도 API Group)
          final isFaceVerified = await service!.verifyLicense(
            invokeUrl: dotenv.env['NCP_CLOVA_FACE_INVOKE_URL'] ?? '',
            secretKey: dotenv.env['NCP_CLOVA_FACE_SECRET_KEY'] ?? '',
          );
          debugPrint('[eKYC] 얼굴 라이선스 검증: $isFaceVerified');
          if (!isFaceVerified || disposed) return;

          sub = service!.faceStream.listen((event) {
            if (disposed) return;
            switch (event) {
              case FaceLivenessComplete():
                // 모션 완료 후 캡처 게이트 진입 (정면+눈뜸 대기). 아직 촬영하지 않음
                livenessCompleted.value = true;
                motionInstruction.value = "정면을 바라보고 움직이지 마세요";
                borderColor.value = brandColor;
                errorMessage.value = null;
              case FaceReadyToCapture():
                // 정면+양눈 OPEN 연속 통과 하면 촬영 수행
                if (!isUploading.value) {
                  _captureAndCompare(
                    context,
                    ref,
                    cam,
                    isUploading,
                    isRestarting,
                    service!,
                  );
                }
              case FaceDetecting(:final instruction):
                motionInstruction.value = instruction;
                borderColor.value = brandColor;
                errorMessage.value = null;
              case FaceError():
                if (!isRestarting.value) {
                  borderColor.value = Colors.red;
                  errorMessage.value = "인식에 실패했어요. 다시 진행해주세요";
                }
            }
          });

          // EventChannel onListen 후 감지 시작 (faceEventSink 보장된 상태)
          await service!.startFaceDetection();
          if (disposed) return;

          cam.startImageStream((image) {
            if (!disposed) {
              service?.analyzeFrame(
                image,
                isFrontCamera: true,
                sensorOrientation: cam.description.sensorOrientation,
              );
            }
          });
        } catch (e) {
          debugPrint('카메라 초기화 실패: $e');
        }
      }

      init();

      return () {
        disposed = true;
        sub?.cancel();
        final cam = controller.value;
        if (cam != null && cam.value.isStreamingImages) {
          cam.stopImageStream().catchError((_) {});
        }
        service?.stopDetection().catchError((_) {});
        cam?.dispose();
      };
    }, const []);

    const currentStep = 4;
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
              "실물 인증",
              style: TextStyle(
                color: vrc(context).textPrimary,
                fontSize: 20 * s,
                fontFamily: "PretendardBold",
                letterSpacing: -0.20 * s,
              ),
            ),
            SizedBox(height: 6 * s),
            Text(
              "본인 여부를 확인합니다. 화면을 응시해 주세요.",
              style: TextStyle(
                color: vrc(context).textSecondary,
                fontSize: 14 * s,
                fontFamily: "PretendardMedium",
                letterSpacing: -0.14 * s,
              ),
            ),
            SizedBox(height: 73 * s),

            // 전면 카메라 원형 프리뷰
            // 테두리 기본은 초록색. 오류 시 빨강색
            Center(
              child: AnimatedContainer(
                duration: AppDurations.toggle,
                width: 260 * s,
                height: 260 * s,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: borderColor.value, width: 7 * s),
                ),
                child: ClipOval(
                  child: isInitialized.value && controller.value != null
                      ? FittedBox(
                          fit: BoxFit.cover,
                          child: SizedBox(
                            width: controller.value!.value.previewSize!.height,
                            height: controller.value!.value.previewSize!.width,
                            child: CameraPreview(controller.value!),
                          ),
                        )
                      : const Center(child: CircularProgressIndicator()),
                ),
              ),
            ),
            SizedBox(height: 22 * s),

            // 안내 pill. 오류 시 빨간 메시지로 전환
            Center(
              child: _GuidePill(
                scale: s,
                text: errorMessage.value ?? motionInstruction.value,
                isError: hasError,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        minimum: EdgeInsets.fromLTRB(20 * s, 0, 20 * s, 16 * s),
        child: _FaceButton(
          scale: s,
          enabled: !isUploading.value && livenessCompleted.value,
          text: isUploading.value
              ? "인증 중..."
              : livenessCompleted.value
              ? "인증 완료"
              : "인증을 진행해주세요",
          onTap: () async {
            final cam = controller.value;
            if (cam == null || !cam.value.isInitialized) return;
            final svc = ref.read(ekycDetectionServiceProvider);
            await _captureAndCompare(
              context,
              ref,
              cam,
              isUploading,
              isRestarting,
              svc,
            );
          },
        ),
      ),
    );
  }
}

/// 얼굴 인증 안내 pill (얼굴 스캔 아이콘 + 안내/오류 메시지)
class _GuidePill extends StatelessWidget {
  const _GuidePill({
    required this.scale,
    required this.text,
    required this.isError,
  });

  final double scale;
  final String text;
  final bool isError;

  @override
  Widget build(BuildContext context) {
    final s = scale;
    final color = isError ? Colors.red : vrc(context).textPrimary!;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20 * s, vertical: 14 * s),
      decoration: BoxDecoration(
        color: isError
            ? Colors.red.withValues(alpha: 0.1)
            : vrc(context).secondaryColor,
        borderRadius: BorderRadius.circular(16 * s),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (isError)
            Icon(Icons.error_outline, size: 22 * s, color: color)
          else
            // 얼굴 스캔 아이콘
            SizedBox(
              width: 22 * s,
              height: 22 * s,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // 코너 프레임 + 얼굴 조합해서 만듬
                  Icon(Icons.crop_free, size: 22 * s, color: color),
                  Icon(Icons.sentiment_satisfied, size: 12 * s, color: color),
                ],
              ),
            ),
          SizedBox(width: 10 * s),
          Flexible(
            child: Text(
              text,
              style: TextStyle(
                color: color,
                fontSize: 16 * s,
                fontFamily: "PretendardSemiBold",
                letterSpacing: -0.16 * s,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/// 직접 인증 버튼 (모션 완료 전/업로드 중 비활성)
class _FaceButton extends StatelessWidget {
  const _FaceButton({
    required this.scale,
    required this.enabled,
    required this.text,
    required this.onTap,
  });

  final double scale;
  final bool enabled;
  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final s = scale;
    return Material(
      color: enabled ? fxc(context).brandColor : vrc(context).disableColor,
      borderRadius: BorderRadius.circular(16 * s),
      child: InkWell(
        borderRadius: BorderRadius.circular(16 * s),
        onTap: enabled ? onTap : null,
        child: SizedBox(
          width: double.infinity,
          height: 52 * s,
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                color: enabled
                    ? fxc(context).textBrand
                    : vrc(context).textDisable,
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

Future<void> _captureAndCompare(
  BuildContext context,
  WidgetRef ref,
  CameraController cam,
  ValueNotifier<bool> isUploading,
  ValueNotifier<bool> isRestarting,
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
    // EXIF 회전을 픽셀에 적용하고 EXIF 제거 함. 서버가 EXIF정보를 무시해도 정방향 보장하기 위함
    final file = await bakeOrientationAndStripExif(File(xfile.path));

    final result = await ref
        .read(adultKycViewModelProvider.notifier)
        .compareFace(file);

    isUploading.value = false;
    if (!context.mounted) return;

    switch (result) {
      case Success(:final data):
        ref.read(authTokenStoreProvider).accessToken = data.accessToken;
        ref.read(authTokenStoreProvider).refreshToken = data.refreshToken;
        context.go(AppRoutes.authComplete);
      case Failure(:final failure):
        _showFaceError(context, failure);
        if (cam.value.isInitialized && !cam.value.isStreamingImages) {
          isRestarting.value = true;
          service.startFaceDetection().catchError((_) {});
          cam.startImageStream((image) {
            service.analyzeFrame(
              image,
              isFrontCamera: true,
              sensorOrientation: cam.description.sensorOrientation,
            );
          });
          // 모델 reset 후 안정화 대기. 이 시간동안 에러 이벤트 무시
          await Future.delayed(const Duration(milliseconds: 1500));
          if (context.mounted) isRestarting.value = false;
        }
    }
  } catch (e) {
    isUploading.value = false;
    debugPrint('얼굴 캡처 오류: $e');
  }
}

void _showFaceError(BuildContext context, AppFailure failure) {
  final message = switch (failure) {
    FaceCompareFailure() => '얼굴 인증에 실패했습니다. 다시 촬영해주세요.',
    SessionExpiredFailure() => 'OCR 세션이 만료되었습니다. 신분증을 다시 촬영해주세요.',
    _ => '오류가 발생했습니다. 다시 시도해주세요.',
  };
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));

  if (failure is SessionExpiredFailure) {
    context.go(AppRoutes.idCardCamera);
  }
}
