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
    final mypageState = ref.watch(myPageViewModelProvider);
    final editProfileVM = ref.read(editProfileViewModelProvider.notifier);
    final isEditing = useState(false);

    final nameCtr = useTextEditingController(text: mypageState.name);
    final genderCtr = useTextEditingController(
      text: mypageState.gender == null ? '미등록' : mypageState.gender?.label,
    );
    final phoneCtr = useTextEditingController(
      text: mypageState.phone?.toPhoneFormat,
    );
    final birthCtr = useTextEditingController(text: mypageState.birthDate);
    final emailCtr = useTextEditingController(text: mypageState.email);
    final emailError = useState<String?>(null);

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
        emailCtr.text = next.email;
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
            onTap: () async {
              if (!isEditing.value) {
                if (!isEnabled) return;

                isEditing.value = true;
              } else {
                if (!isEnabled) return;

                if (emailCtr.text.isNotEmpty &&
                    (mypageState.email != emailCtr.text)) {
                  emailError.value = Validation.email(emailCtr.text);
                  if (emailError.value != null) return;

                  editProfileVM.updateEmail(emailCtr.text);
                }

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
            backgroundColor: !isEnabled
                ? vrc(context).disableColor!
                : isEditing.value
                ? fxc(context).brandColor!
                : fxc(context).unchangeableBlack!,
            foregroundColor: !isEnabled
                ? vrc(context).textDisable!
                : fxc(context).unchangeableWhite!,
          ),
        ),
      ),
    );
  }
}
