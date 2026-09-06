import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:trana/core/analytics/analytics_service.dart';
import 'package:trana/core/theme/app_text_style.dart';
import 'package:trana/core/theme/app_theme.dart';
import 'package:trana/core/theme/coolicons_icon.dart';
import 'package:trana/core/widgets/custom_loading_bar.dart';
import 'package:trana/core/widgets/custom_toast.dart';
import 'package:trana/features/contract/presentation/viewmodels/ai_auto_fill_view_model.dart';
import 'package:trana/features/contract/presentation/viewmodels/create_contract_view_model.dart';
import 'package:trana/features/contract/presentation/widgets/modals/ai_autofill_notice_dialog.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

/// 거래 사진 최대 등록 개수
const _maxImageCount = 7;

class ContractPhotoSection extends HookConsumerWidget {
  const ContractPhotoSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final aiIsCompleted = ref.watch(
      aiAutoFillViewModelProvider.select((s) => s.isCompleted),
    );
    final (existingAttachmentUrls, isLoadingUpload) = ref.watch(
      createContractViewModelProvider.select(
        (s) => (s.existingAttachmentUrls, s.isLoadingUpload),
      ),
    );
    final selectedImages = useState<List<XFile>>([]);
    // iOS 커스텀 갤러리의 선택 상태 유지용
    final selectedAssets = useState<List<AssetEntity>>([]);
    final isEditMode = existingAttachmentUrls.isNotEmpty;
    final count = isEditMode
        ? existingAttachmentUrls.length
        : selectedImages.value.length;
    final previousImageCount = useRef<int>(0);

    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        if (isEditMode) return;

        final createVM = ref.read(createContractViewModelProvider.notifier);
        createVM.updateImages(selectedImages.value);

        final newCount = selectedImages.value.length;
        if (newCount > previousImageCount.value) {
          // EVT-016: contract_image_added
          AnalyticsService.track(
            'contract_image_added',
            properties: {'image_count': newCount, 'source_type': 'gallery'},
            ga4: false,
          );
        } else if (newCount < previousImageCount.value) {
          // EVT-017: contract_image_removed
          AnalyticsService.track(
            'contract_image_removed',
            properties: {'image_count': newCount, 'source_type': 'gallery'},
            ga4: false,
          );
        }
        previousImageCount.value = newCount;

        // 계약 첨부 사진 업로드
        final success = await createVM.updateAttachments();
        if (!context.mounted) return;
        if (!success) {
          final state = ref.read(createContractViewModelProvider);
          showErrorToast(context, state.error!);
          createVM.clearError();
        }
      });
      return null;
    }, [selectedImages.value]);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: vrc(context).secondaryColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 1.5),
                child: Text(
                  "거래 사진",
                  style: context.txt(color: vrc(context).textPrimary),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          SizedBox(
            height: 68,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                GestureDetector(
                  onTap: () async {
                    if (aiIsCompleted) return;

                    if (isEditMode) {
                      showErrorToast(context, "거래 사진은 수정할 수 없습니다");
                      return;
                    }

                    if (Platform.isIOS) {
                      // 갤러리에서 사진 선택
                      // 선택 시에만 개수 제한 위해 wechat_assets_picker 적용 (type: AssetEntity)
                      try {
                        final assets = await AssetPicker.pickAssets(
                          context,
                          pickerConfig: AssetPickerConfig(
                            selectedAssets: selectedAssets.value,
                            maxAssets: _maxImageCount,
                            requestType: RequestType.image,
                            textDelegate: const KoreanAssetPickerTextDelegate(),
                          ),
                        );
                        if (assets == null) return;
                        selectedAssets.value = assets;
                        selectedImages.value = await _toFiles(assets);
                      } on StateError catch (_) {
                        if (!context.mounted) return;
                        showErrorToast(
                          context,
                          "사진첩 접근 권한이 필요해요",
                          detail: "거래 사진을 등록하려면 설정에서 권한을 허용해주세요.",
                          onTap: PhotoManager.openSetting,
                        );
                      }
                      return;
                    }

                    // Android: 시스템 사진 선택 도구 사용
                    // Google Play 사진/동영상 권한 정책 대응
                    final remaining =
                        _maxImageCount - selectedImages.value.length;
                    if (remaining <= 0) {
                      showErrorToast(
                        context,
                        "사진은 최대 $_maxImageCount장까지 등록할 수 있어요",
                      );
                      return;
                    }

                    try {
                      final picked = await _pickImages(remaining);
                      if (picked.isEmpty) return;
                      selectedImages.value = [
                        ...selectedImages.value,
                        ...picked,
                      ].take(_maxImageCount).toList();
                    } on PlatformException catch (_) {
                      if (!context.mounted) return;
                      showErrorToast(
                        context,
                        "사진을 불러오지 못했어요",
                        detail: "잠시 후 다시 시도해주세요.",
                      );
                    }
                  },
                  child: Container(
                    width: 68,
                    height: 68,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: vrc(context).tertiaryColor,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Icon(
                      CooliconsIcon.camera,
                      color: vrc(context).iconSecondary!,
                      size: 32,
                    ),
                  ),
                ),

                // 1. 수정 시 > url 로 이미지 렌더링
                if (isEditMode)
                  ...existingAttachmentUrls.map(
                    (url) => Padding(
                      padding: const EdgeInsets.only(left: 4),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.network(
                          url,
                          width: 68,
                          height: 68,
                          fit: BoxFit.cover,
                          loadingBuilder: (_, child, loadingProgress) {
                            if (loadingProgress == null) return child;
                            return Container(
                              width: 68,
                              height: 68,
                              color: vrc(context).secondaryColor,
                              child: const CustomLoadingBar(size: 20),
                            );
                          },
                        ),
                      ),
                    ),
                  ),

                // 2-1. 첫 생성 시 (iOS) > AssetEntity 로 이미지 렌더링
                if (!isEditMode && Platform.isIOS)
                  ...selectedAssets.value.map(
                    (image) => Padding(
                      padding: const EdgeInsets.only(left: 4),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: AssetEntityImage(
                          image,
                          width: 68,
                          height: 68,
                          fit: BoxFit.cover,
                          loadingBuilder: (_, child, loadingProgress) {
                            if (loadingProgress == null && !isLoadingUpload) {
                              return child;
                            }
                            return Container(
                              width: 68,
                              height: 68,
                              color: vrc(context).tertiaryColor,
                              child: const CustomLoadingBar(size: 20),
                            );
                          },
                        ),
                      ),
                    ),
                  ),

                // 2-2. 첫 생성 시 (Android) > 선택한 파일로 이미지 렌더링
                if (!isEditMode && !Platform.isIOS)
                  ...selectedImages.value.map(
                    (image) => Padding(
                      padding: const EdgeInsets.only(left: 4),
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: isLoadingUpload
                                ? Container(
                                    width: 68,
                                    height: 68,
                                    color: vrc(context).tertiaryColor,
                                    child: const CustomLoadingBar(size: 20),
                                  )
                                : Image.file(
                                    File(image.path),
                                    width: 68,
                                    height: 68,
                                    fit: BoxFit.cover,
                                  ),
                          ),
                          // 선택 해제
                          // 시스템 선택 도구는 기존 선택을 기억하지 못함
                          if (!aiIsCompleted && !isLoadingUpload)
                            Positioned(
                              top: 2,
                              right: 2,
                              child: GestureDetector(
                                onTap: () => selectedImages.value = [
                                  ...selectedImages.value,
                                ]..remove(image),
                                child: Container(
                                  padding: const EdgeInsets.all(2),
                                  decoration: BoxDecoration(
                                    color: Colors.black.withValues(alpha: 0.5),
                                    shape: BoxShape.circle,
                                  ),
                                  child: const Icon(
                                    CooliconsIcon.closeSm,
                                    color: Colors.white,
                                    size: 12,
                                  ),
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '$count개의 이미지 추가됨',
                      style: context.txt(color: vrc(context).textPrimary),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      '($count/7)',
                      style: context.txt(
                        color: vrc(context).textTertiary,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  if (aiIsCompleted || isEditMode || isLoadingUpload) {
                    return;
                  }

                  if (selectedImages.value.isEmpty) {
                    showErrorToast(context, '분석할 이미지를 선택해주세요');
                    return;
                  }

                  showDialog(
                    context: context,
                    barrierColor: Colors.black.withValues(alpha: 0.75),
                    builder: (context) => const AiAutofillNoticeDialog(),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 7,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: (aiIsCompleted || isEditMode)
                        ? vrc(context).tertiaryColor
                        : fxc(context).brandColor!,
                  ),
                  child: Text(
                    aiIsCompleted ? "분석완료" : "분석하기",
                    style: context.txt(
                      color: (aiIsCompleted || isEditMode)
                          ? vrc(context).iconSecondary
                          : fxc(context).textBrand!,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/// 선택한 AssetEntity 를 업로드용 파일로 변환
Future<List<XFile>> _toFiles(List<AssetEntity> assets) async {
  final files = <XFile>[];
  for (final asset in assets) {
    final file = await asset.file;
    if (file != null) files.add(XFile(file.path));
  }
  return files;
}

/// 시스템 사진 선택 도구로 남은 개수만큼 사진 선택 (Android)
Future<List<XFile>> _pickImages(int remaining) async {
  final picker = ImagePicker();

  // pickMultiImage 의 limit 은 2 이상만 허용
  if (remaining == 1) {
    final image = await picker.pickImage(source: ImageSource.gallery);
    return image == null ? const [] : [image];
  }

  return picker.pickMultiImage(limit: remaining);
}
