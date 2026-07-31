import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trana/core/theme/app_text_style.dart';
import 'package:trana/core/theme/app_theme.dart';
import 'package:trana/core/theme/coolicons_icon.dart';
import 'package:trana/core/widgets/custom_loading_bar.dart';
import 'package:trana/core/widgets/custom_toast.dart';
import 'package:trana/features/contract/presentation/viewmodels/ai_auto_fill_view_model.dart';
import 'package:trana/features/contract/presentation/viewmodels/create_contract_view_model.dart';
import 'package:trana/features/contract/presentation/widgets/modals/ai_autofill_notice_dialog.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

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
    final selectedImages = useState<List<AssetEntity>>([]);
    final isEditMode = existingAttachmentUrls.isNotEmpty;
    final count = isEditMode
        ? existingAttachmentUrls.length
        : selectedImages.value.length;

    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        if (isEditMode) return;

        final createVM = ref.read(createContractViewModelProvider.notifier);
        createVM.updateImages(selectedImages.value);

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

                    // 갤러리에서 사진 선택
                    // 선택 시에만 개수 제한 위해 wechat_assets_picker 적용 (type: AssetEntity)
                    try {
                      final images = await AssetPicker.pickAssets(
                        context,
                        pickerConfig: AssetPickerConfig(
                          selectedAssets: selectedImages.value,
                          maxAssets: 7,
                          requestType: RequestType.image,
                          textDelegate: const KoreanAssetPickerTextDelegate(),
                        ),
                      );
                      if (images != null) selectedImages.value = images;
                    } on StateError catch (_) {
                      if (!context.mounted) return;
                      showErrorToast(
                        context,
                        "사진첩 접근 권한이 필요해요",
                        detail: "거래 사진을 등록하려면 설정에서 권한을 허용해주세요.",
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

                // 2. 첫 생성 시 > AssetEntity 로 이미지 렌더링
                if (!isEditMode)
                  ...selectedImages.value.map(
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
