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
    final aiState = ref.watch(aiAutoFillViewModelProvider);
    final createState = ref.watch(createContractViewModelProvider);
    final createVM = ref.read(createContractViewModelProvider.notifier);

    final selectedImages = useState<List<AssetEntity>>([]);
    final existingUrls = createState.existingAttachmentUrls;

    final isEditMode = existingUrls.isNotEmpty;
    final length = isEditMode
        ? existingUrls.length
        : selectedImages.value.length;

    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        if (isEditMode) return;

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
                    if (aiState.isCompleted) return;

                    if (isEditMode) {
                      showErrorToast(context, "거래 사진은 수정할 수 없습니다");
                      return;
                    }

                    // 갤러리에서 사진 선택
                    // 선택 시에만 개수 제한 위해 wechat_assets_picker 적용 (type: AssetEntity)
                    final images = await AssetPicker.pickAssets(
                      context,
                      pickerConfig: AssetPickerConfig(
                        selectedAssets: selectedImages.value,
                        maxAssets: 7,
                        requestType: RequestType.image,
                      ),
                    );
                    if (images != null) selectedImages.value = images;
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

                if (isEditMode)
                  ...existingUrls.map(
                    (url) => Expanded(
                      child: Padding(
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
                                child: const CustomLoadingBar(),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ),

                if (!isEditMode)
                  ...selectedImages.value.map(
                    (image) => Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 4),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: AssetEntityImage(
                            image,
                            width: 68,
                            height: 68,
                            fit: BoxFit.cover,
                            loadingBuilder: (_, child, loadingProgress) {
                              if (loadingProgress == null &&
                                  !createState.isLoadingUpload) {
                                return child;
                              }
                              return Container(
                                width: 68,
                                height: 68,
                                color: vrc(context).tertiaryColor,
                                child: const CustomLoadingBar(),
                              );
                            },
                          ),
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
                      '$length개의 이미지 추가됨',
                      style: context.txt(color: vrc(context).textPrimary),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      '($length/7)',
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
                  if (aiState.isCompleted ||
                      isEditMode ||
                      createState.isLoadingUpload) {
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
                    color: (aiState.isCompleted || isEditMode)
                        ? vrc(context).tertiaryColor
                        : fxc(context).brandColor!,
                  ),
                  child: Text(
                    aiState.isCompleted ? "분석완료" : "분석하기",
                    style: context.txt(
                      color: (aiState.isCompleted || isEditMode)
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
