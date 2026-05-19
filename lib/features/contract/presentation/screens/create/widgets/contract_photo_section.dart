import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trana/core/theme/app_theme.dart';
import 'package:trana/core/widgets/custom_snackbar.dart';
import 'package:trana/core/widgets/primary_button.dart';
import 'package:trana/features/contract/presentation/screens/create/widgets/contract_photo_chip.dart';
import 'package:trana/features/contract/presentation/viewmodels/ai_auto_fill_view_model.dart';
import 'package:trana/features/contract/presentation/viewmodels/create_contract_view_model.dart';
import 'package:trana/features/contract/presentation/widgets/modals/ai_autofill_notice_dialog.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

class ContractPhotoSection extends HookConsumerWidget {
  final Color iconColor;

  const ContractPhotoSection({super.key, required this.iconColor});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final aiState = ref.watch(aiAutoFillViewModelProvider);
    final vm = ref.read(createContractViewModelProvider.notifier);
    final selectedImages = useState<List<AssetEntity>>([]);

    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        vm.updateImages(selectedImages.value);
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

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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
        const SizedBox(height: 6),
        SizedBox(
          height: 70,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              // 사진 선택 영역
              ContractPhotoChip(
                child: Icon(
                  Icons.photo_camera_outlined,
                  color: iconColor,
                  size: 32,
                ),
                onTap: () {
                  if (aiState.completed) {
                    return;
                  }
                  pickFromGallery();
                },
              ),

              // 선택된 사진 표시 영역
              if (selectedImages.value.isNotEmpty)
                ...selectedImages.value.map(
                  (image) => Padding(
                    padding: const EdgeInsets.only(left: 8),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(18),
                      child: AssetEntityImage(
                        image,
                        width: 70,
                        height: 70,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
        const SizedBox(height: 6),

        // 분석하기 버튼
        PrimaryButton(
          text: aiState.completed ? "분석 완료" : "이미지 분석하기",
          onTap: () {
            if (aiState.completed) {
              return;
            }

            if (selectedImages.value.isEmpty) {
              showErrorSnackBar(context, '분석할 이미지를 선택해주세요');
              return;
            }

            showDialog(
              context: context,
              barrierColor: Colors.black.withValues(alpha: 0.75),
              builder: (context) => const AiAutofillNoticeDialog(),
            );
          },
          backgroundColor: !aiState.completed
              ? fxc(context).brandColor!
              : vrc(context).disableColor!,
          foregroundColor: !aiState.completed
              ? fxc(context).textBrand!
              : vrc(context).textDisable!,
        ),
      ],
    );
  }
}
