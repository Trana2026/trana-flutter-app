import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trana/core/router/app_router.dart';
import 'package:trana/core/theme/app_text_style.dart';
import 'package:trana/core/theme/app_theme.dart';
import 'package:trana/core/theme/coolicons_icon.dart';
import 'package:trana/core/widgets/contract_form_field.dart';
import 'package:trana/core/widgets/custom_toast.dart';
import 'package:trana/core/widgets/primary_button.dart';
import 'package:trana/features/contract/presentation/screens/share/widgets/contract_draft_preview_card.dart';
import 'package:trana/features/contract/presentation/viewmodels/share_contract_view_model.dart';

class ContractSharePage extends HookConsumerWidget {
  final String publicCode;

  const ContractSharePage({super.key, required this.publicCode});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final shareVM = ref.read(shareContractViewModelProvider.notifier);

    final nameController = useTextEditingController();
    final phoneController = useTextEditingController();
    final phoneError = useState<String?>(null);

    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        shareVM.loadPublicCode(publicCode);
      });
      return null;
    }, []);

    useListenable(nameController);
    useListenable(phoneController);

    final isEnabled =
        nameController.text.trim().isNotEmpty &&
        phoneController.text.trim().isNotEmpty;

    return Scaffold(
      backgroundColor: vrc(context).background,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: vrc(context).background,
        leading: InkWell(
          onTap: () => context.go(AppRoutes.home),
          child: Icon(
            CooliconsIcon.chevronLeft,
            color: vrc(context).iconPrimary,
            size: 24,
          ),
        ),
        title: Text(
          "계약서 공유하기",
          style: context.txt(
            color: vrc(context).textPrimary,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
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
                const ContractDraftPreviewCard(),
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
                      SvgPicture.asset(
                        'assets/icons/kakaotalk.svg',
                        height: 22,
                        width: 22,
                        fit: BoxFit.contain,
                        colorFilter: ColorFilter.mode(
                          vrc(context).textPrimary!,
                          BlendMode.srcIn,
                        ),
                      ),
                      const Icon(Icons.chat_bubble_rounded, size: 22),
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
                  controller: nameController,
                ),
                const SizedBox(height: 20),
                ContractFormField(
                  label: "연락처",
                  hintText: "010-0000-0000",
                  keyboardType: TextInputType.phone,
                  controller: phoneController,
                  errorText: phoneError.value,
                  onChanged: (v) {
                    phoneError.value = null;
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
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
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

                    phoneError.value = validatePhoneNumber(
                      phoneController.text,
                    );
                    if (phoneError.value != null) return;

                    shareVM.updateInput(
                      name: nameController.text.trim(),
                      phone: phoneController.text.trim(),
                    );

                    final success = await shareVM.share();
                    if (!context.mounted) return;
                    if (!success) {
                      showErrorToast(
                        context,
                        ref.read(shareContractViewModelProvider).error!,
                      );
                      shareVM.clearError();
                      return;
                    }

                    context.go(AppRoutes.contractDetail);
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

  String? validatePhoneNumber(String? v) {
    if (v == null || !RegExp(r'^010-\d{4}-\d{4}$').hasMatch(v)) {
      return '연락처를 올바른 형식으로 입력해주세요.';
    }
    return null;
  }
}
