import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trana/core/theme/app_theme.dart';
import 'package:trana/core/utils/validation.dart';
import 'package:trana/core/widgets/contract_form_field.dart';
import 'package:trana/core/widgets/custom_app_bar.dart';
import 'package:trana/core/widgets/custom_toast.dart';
import 'package:trana/core/widgets/primary_button.dart';
import 'package:trana/features/contract/domain/utils/string_extensions.dart';
import 'package:trana/features/profile/presentation/screens/my_page/widgets/gender_dropdown.dart';
import 'package:trana/features/profile/presentation/viewmodels/edit_profile_view_model.dart';
import 'package:trana/features/profile/presentation/viewmodels/my_page_view_model.dart';

class EditProfilePage extends HookConsumerWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MyPageState(:name, :gender, :phone, :birthDate, :email) = ref.read(
      myPageViewModelProvider,
    );

    final nameCtr = useTextEditingController(text: name);
    final genderCtr = useTextEditingController(
      text: gender == null ? '미등록' : gender.label,
    );
    final phoneCtr = useTextEditingController(text: phone?.toPhoneFormat);
    final birthCtr = useTextEditingController(text: birthDate);
    final emailCtr = useTextEditingController(text: email);
    final emailError = useState<String?>(null);
    final isEditing = useState(false);

    useListenable(nameCtr);
    useListenable(genderCtr);
    useListenable(phoneCtr);
    useListenable(birthCtr);
    useListenable(emailCtr);

    ref.listen(editProfileViewModelProvider, (prev, next) {
      if (next.gender != prev?.gender) {
        genderCtr.text = next.gender?.label ?? "미등록";
      }
      if (next.email != prev?.email) {
        emailCtr.text = next.email ?? '';
      }
    });

    final isEnabled =
        nameCtr.text.trim().isNotEmpty &&
        genderCtr.text.trim().isNotEmpty &&
        phoneCtr.text.trim().isNotEmpty &&
        birthCtr.text.trim().isNotEmpty;

    return Scaffold(
      backgroundColor: vrc(context).background,
      appBar: CustomAppBar.leading(
        title: "개인정보 관리",
        onTapLeading: () => context.pop(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              ContractFormField(
                label: "이름",
                hintText: "",
                controller: nameCtr,
                readOnly: true,
              ),
              const SizedBox(height: 16),
              if (!isEditing.value)
                ContractFormField(
                  label: "성별",
                  hintText: "",
                  controller: genderCtr,
                  readOnly: true,
                )
              else
                const GenderDropdown(),
              const SizedBox(height: 16),
              ContractFormField(
                label: "휴대폰 번호",
                hintText: "",
                controller: phoneCtr,
                readOnly: true,
              ),
              const SizedBox(height: 16),
              ContractFormField(
                label: "생년월일",
                hintText: "",
                controller: birthCtr,
                readOnly: true,
              ),
              const SizedBox(height: 16),
              ContractFormField(
                label: "이메일",
                hintText: "",
                readOnly: !isEditing.value,
                keyboardType: TextInputType.emailAddress,
                controller: emailCtr,
                errorText: emailError.value,
                onChanged: (v) => emailError.value = null,
              ),
            ],
          ),
        ),
      ),

      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: PrimaryButton(
            text: isEditing.value ? "완료" : "수정하기",
            disabled: !isEnabled,
            onTap: () async {
              // 수정중 아닐 때
              if (!isEditing.value) {
                isEditing.value = true;
                // 수정중일 때
              } else {
                if (emailCtr.text.isNotEmpty &&
                    (ref.read(myPageViewModelProvider).email !=
                        emailCtr.text)) {
                  emailError.value = Validation.email(emailCtr.text);
                  if (emailError.value != null) return;
                }

                final editProfileVM = ref.read(
                  editProfileViewModelProvider.notifier,
                );
                editProfileVM.updateEmail(
                  emailCtr.text.isEmpty ? null : emailCtr.text,
                );

                // 본인 정보 수정
                final success = await editProfileVM.updateProfile();
                if (!context.mounted) return;
                if (!success) {
                  final state = ref.read(editProfileViewModelProvider);
                  showErrorToast(context, state.error!);
                  editProfileVM.clearError();
                  return;
                }

                isEditing.value = false;
              }
            },
            backgroundColor: isEditing.value
                ? fxc(context).brandColor!
                : fxc(context).unchangeableBlack!,
            foregroundColor: fxc(context).unchangeableWhite!,
          ),
        ),
      ),
    );
  }
}
