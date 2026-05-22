import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trana/core/theme/app_theme.dart';
import 'package:trana/core/widgets/custom_toast.dart';
import 'package:trana/features/contract/presentation/screens/create/widgets/contract_photo_chip.dart';
import 'package:trana/features/contract/presentation/viewmodels/ai_auto_fill_view_model.dart';
import 'package:trana/features/contract/presentation/viewmodels/create_contract_view_model.dart';
import 'package:trana/features/contract/presentation/widgets/modals/ai_autofill_notice_dialog.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

class ContractPhotoSection extends HookConsumerWidget {
  const ContractPhotoSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final aiState = ref.watch(aiAutoFillViewModelProvider);
    final createVM = ref.read(createContractViewModelProvider.notifier);
    final selectedImages = useState<List<AssetEntity>>([]);

    final length = selectedImages.value.length;

    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        createVM.updateImages(selectedImages.value);
      });
      return null;
    }, [selectedImages.value]);

    /// 갤러리에서 사진 선택
    Future<void> pickFromGallery() async {
      // 선택 시에만 개수 제한 위해 wechat_assets_picker 적용 (type: AssetEntity)
      final images = await AssetPicker.pickAssets(
        context,
        pickerConfig: AssetPickerConfig(
          selectedAssets: selectedImages.value,
          maxAssets: 7,
          requestType: RequestType.image,
        ),
      );
      selectedImages.value = images ?? [];
    }

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
                  style: TextStyle(
                    color: vrc(context).textTertiary,
                    fontSize: 15,
                    fontFamily: "PretendardMedium",
                  ),
                ),
              ),
              const SizedBox(width: 6),
              Icon(
                Icons.info_outline_rounded,
                size: 14,
                color: vrc(context).iconDisable,
              ),
            ],
          ),
          const SizedBox(height: 20),

          SizedBox(
            height: 70,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                ContractPhotoChip(
                  child: Icon(
                    Icons.photo_camera_outlined,
                    color: vrc(context).iconSecondary!,
                    size: 32,
                  ),
                  onTap: () {
                    if (aiState.completed) return;
                    pickFromGallery();
                  },
                ),

                if (selectedImages.value.isNotEmpty)
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
                      style: TextStyle(
                        color: vrc(context).textPrimary,
                        fontFamily: 'PretendardMedium',
                        height: 1.5,
                        letterSpacing: 0.16,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      '($length/7)',
                      style: TextStyle(
                        fontSize: 12,
                        color: vrc(context).textTertiary,
                        fontFamily: 'PretendardMedium',
                        height: 1.5,
                        letterSpacing: 0.16,
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  if (aiState.completed) return;
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
                    color: !aiState.completed
                        ? fxc(context).brandColor!
                        : vrc(context).tertiaryColor,
                  ),
                  child: Text(
                    aiState.completed ? "분석완료" : "분석하기",
                    style: TextStyle(
                      color: !aiState.completed
                          ? fxc(context).textBrand!
                          : vrc(context).iconSecondary,
                      fontFamily: 'PretendardSemiBold',
                      height: 1.5,
                      letterSpacing: 0.16,
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
