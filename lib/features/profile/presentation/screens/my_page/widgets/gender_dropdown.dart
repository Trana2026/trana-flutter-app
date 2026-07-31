import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trana/core/theme/app_text_style.dart';
import 'package:trana/core/theme/app_theme.dart';
import 'package:trana/core/theme/coolicons_icon.dart';
import 'package:trana/features/profile/domain/enums/gender.dart';
import 'package:trana/features/profile/presentation/viewmodels/edit_profile_view_model.dart';
import 'package:trana/features/profile/presentation/viewmodels/my_page_view_model.dart';

class GenderDropdown extends HookConsumerWidget {
  const GenderDropdown({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gender = ref.read(myPageViewModelProvider).gender;
    final selectedGender = useState(gender ?? Gender.none);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "성별",
          style: context.txt(color: vrc(context).textTertiary, fontSize: 12),
        ),
        const SizedBox(height: 4),
        DropdownButtonHideUnderline(
          child: DropdownButton2<Gender>(
            valueListenable: selectedGender,
            isExpanded: false,
            onChanged: (v) {
              selectedGender.value = v!;

              final editProfileVM = ref.read(
                editProfileViewModelProvider.notifier,
              );
              editProfileVM.updateGender(v);
            },
            items: [
              DropdownItem(
                value: Gender.male,
                height: 53,
                child: Text(
                  Gender.male.label,
                  style: context.txt(color: vrc(context).textPrimary),
                ),
              ),
              DropdownItem(
                value: Gender.female,
                height: 53,
                child: Text(
                  Gender.female.label,
                  style: context.txt(color: vrc(context).textPrimary),
                ),
              ),
              DropdownItem(
                value: Gender.none,
                height: 53,
                child: Text(
                  Gender.none.label,
                  style: context.txt(color: vrc(context).textPrimary),
                ),
              ),
            ],
            iconStyleData: IconStyleData(
              icon: Icon(
                CooliconsIcon.caretDownSm,
                size: 24,
                color: vrc(context).iconSecondary,
              ),
            ),

            buttonStyleData: ButtonStyleData(
              height: 50,
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: vrc(context).secondaryColor,
                borderRadius: BorderRadius.circular(16),
              ),
            ),

            dropdownStyleData: DropdownStyleData(
              offset: const Offset(0, -8),
              elevation: 2,
              padding: EdgeInsets.zero,
              decoration: BoxDecoration(
                color: vrc(context).secondaryColor,
                borderRadius: BorderRadius.circular(16),
              ),
              scrollbarTheme: const ScrollbarThemeData(
                thumbVisibility: WidgetStatePropertyAll(false),
                trackVisibility: WidgetStatePropertyAll(false),
                thickness: WidgetStatePropertyAll(0),
              ),
            ),

            menuItemStyleData: const MenuItemStyleData(
              padding: EdgeInsets.symmetric(horizontal: 20),
            ),

            dropdownSeparator: DropdownSeparator(
              height: 1,
              child: Divider(
                height: 1,
                thickness: 1,
                color: vrc(context).tertiaryColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
