import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:trana/core/theme/app_text_style.dart';
import 'package:trana/core/theme/app_theme.dart';
import 'package:trana/core/theme/coolicons_icon.dart';

class TrailingLanguageDropdown extends StatelessWidget {
  const TrailingLanguageDropdown({super.key});

  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2<String>(
        valueListenable: ValueNotifier('한국어'),
        isExpanded: false,
        items: [
          DropdownItem(
            value: '한국어',
            child: Text('한국어', style: context.txt(fontWeight: FontWeight.w400)),
          ),
        ],
        onChanged: (value) {},
        iconStyleData: IconStyleData(
          icon: Icon(
            CooliconsIcon.caretDownSm,
            size: 26,
            color: vrc(context).iconSecondary,
          ),
        ),
        buttonStyleData: const ButtonStyleData(height: 24),
        dropdownStyleData: DropdownStyleData(
          maxHeight: 40,
          elevation: 2,
          decoration: BoxDecoration(
            color: vrc(context).background,
            borderRadius: BorderRadius.circular(8),
          ),
          scrollbarTheme: const ScrollbarThemeData(
            thumbVisibility: WidgetStatePropertyAll(false),
            trackVisibility: WidgetStatePropertyAll(false),
            thickness: WidgetStatePropertyAll(0),
          ),
        ),
        menuItemStyleData: const MenuItemStyleData(
          padding: EdgeInsets.only(left: 10),
        ),
      ),
    );
  }
}
