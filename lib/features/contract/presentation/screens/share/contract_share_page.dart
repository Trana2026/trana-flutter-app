import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trana/core/router/app_router.dart';
import 'package:trana/core/theme/app_text_style.dart';
import 'package:trana/core/theme/app_theme.dart';
import 'package:trana/core/utils/validation.dart';
import 'package:trana/core/widgets/app_icon.dart';
import 'package:trana/core/widgets/contract_form_field.dart';
import 'package:trana/core/widgets/custom_app_bar.dart';
import 'package:trana/core/widgets/custom_toast.dart';
import 'package:trana/core/widgets/primary_button.dart';
import 'package:trana/features/contract/domain/utils/string_extensions.dart';
import 'package:trana/features/contract/presentation/screens/share/widgets/contract_draft_preview_card.dart';
import 'package:trana/features/contract/presentation/viewmodels/share_contract_view_model.dart';

class ContractSharePage extends HookConsumerWidget {
  final String publicCode;

  const ContractSharePage({super.key, required this.publicCode});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final shareVM = ref.read(shareContractViewModelProvider.notifier);

    final nameCtr = useTextEditingController();
    final phoneCtr = useTextEditingController();
    final phoneError = useState<String?>(null);
    final isPending = useRef(false);

    useListenable(nameCtr);
    useListenable(phoneCtr);

    final isEnabled =
        nameCtr.text.trim().isNotEmpty && phoneCtr.text.trim().isNotEmpty;

    return Scaffold(
      backgroundColor: vrc(context).background,
      resizeToAvoidBottomInset: true,
      appBar: CustomAppBar.leading(
        title: "계약서 공유하기",
        onTapLeading: () => context.go(AppRoutes.home),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "계약서 초안 생성 완료",
                  style: context.txt(
                    color: vrc(context).textPrimary,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 6),
                Text("초안에서 계약의 핵심 조건을 확인해주세요.", style: context.txt()),
                const SizedBox(height: 20),
                ContractDraftPreviewCard(publicCode: publicCode),
                const SizedBox(height: 20),
                Text("전송 채널", style: context.txt()),
                const SizedBox(height: 4),
                Container(
                  width: double.infinity,
                  height: 53,
                  decoration: BoxDecoration(
                    color: fxc(context).subtitleKakao,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: fxc(context).borderKakao!),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppIcon.svg(
                        asset: 'assets/icons/kakaotalk.svg',
                        size: 22,
                        color: vrc(context).textPrimary!,
                      ),
                      const SizedBox(width: 10),
                      Text(
                        "카카오톡",
                        style: context.txt(color: vrc(context).textPrimary),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                ContractFormField(
                  label: "이름",
                  hintText: "이름을 입력해주세요",
                  controller: nameCtr,
                ),
                const SizedBox(height: 20),
                ContractFormField(
                  label: "연락처",
                  hintText: "010-0000-0000",
                  keyboardType: TextInputType.phone,
                  controller: phoneCtr,
                  errorText: phoneError.value,
                  onChanged: (v) {
                    phoneError.value = null;
                    final formatted = v.toPhoneFormat;
                    phoneCtr.value = TextEditingValue(
                      text: formatted,
                      selection: TextSelection.collapsed(
                        offset: formatted.length,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            children: [
              Expanded(
                flex: 3,
                child: PrimaryButton(
                  text: "취소",
                  onTap: () => context.go(AppRoutes.home),
                  backgroundColor: vrc(context).secondaryColor!,
                  foregroundColor: vrc(context).textPrimary!,
                ),
              ),
              const SizedBox(width: 9),
              Expanded(
                flex: 7,
                child: PrimaryButton(
                  text: "카카오톡으로 요청하기",
                  onTap: () async {
                    if (!isEnabled) return;
                    if (isPending.value) return;
                    isPending.value = true;
                    try {
                      phoneError.value = Validation.phone(phoneCtr.text);
                      if (phoneError.value != null) return;

                      shareVM.updateInput(
                        name: nameCtr.text.trim(),
                        phone: phoneCtr.text.trim(),
                      );

                      final success = await shareVM.share(publicCode);
                      if (!context.mounted) return;
                      if (!success) {
                        final state = ref.read(shareContractViewModelProvider);
                        showErrorToast(context, state.error!);
                        shareVM.clearError();
                        return;
                      }

                      context.go(AppRoutes.contractDetail);
                    } finally {
                      isPending.value = false;
                    }
                  },
                  backgroundColor: isEnabled
                      ? fxc(context).brandColor!
                      : vrc(context).disableColor!,
                  foregroundColor: isEnabled
                      ? fxc(context).textBrand!
                      : vrc(context).textDisable!,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
