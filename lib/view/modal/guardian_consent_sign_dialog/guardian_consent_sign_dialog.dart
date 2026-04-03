import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart'; 
import 'package:hooks_riverpod/hooks_riverpod.dart'; 
import 'package:trana/core/theme/app_theme.dart';
import 'package:trana/view/modal/guardian_consent_sign_dialog/widgets/guardian_selection_card.dart';
import 'package:trana/widgets/primary_button.dart';

class GuardianConsentSignDialog extends HookConsumerWidget {
  const GuardianConsentSignDialog({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = useState<int?>(null);
    final bool isAnySelected = selectedIndex.value != null;

    return Dialog(
      backgroundColor: vrc(context).background,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      insetPadding: const EdgeInsets.symmetric(horizontal: 20),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(17, 20, 17, 17),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: fxc(context).subtitleBlue,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.shield_outlined,
                color: fxc(context).iconInfo,
                size: 22,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              "계약 방식을 선택해 주세요",
              style: TextStyle(
                color: vrc(context).textPrimary,
                fontSize: 18,
                fontFamily: "PretendardBold"
              ),
            ),
            const SizedBox(height: 12),

            GuardianSelectionCard(
              title: "법정대리인에게 동의 요청",
              subtitle: "완전한 법적 효력이 발생합니다(권장)",
              icon: Icons.check_circle_outline,
              isSelected: selectedIndex.value == 0,
              activeColor: fxc(context).brandColor!,
              activeBgColor: fxc(context).subtitleGreen!,
              activeTextColor: fxc(context).textBrand!,
              iconBgColor: fxc(context).subtitleGreen!,
              iconColor: fxc(context).iconBrand!,
              onTap: () => selectedIndex.value = 0,
            ),
            const SizedBox(height: 7),

            GuardianSelectionCard(
              title: "동의 없이 진행",
              subtitle: "효력이 제한되며 상대방에게 표시됩니다",
              icon: Icons.warning_amber_rounded,
              isSelected: selectedIndex.value == 1,
              activeColor: fxc(context).iconDanger!,
              activeBgColor: fxc(context).subtitleError!,
              activeTextColor: fxc(context).textDanger!,
              iconBgColor: fxc(context).subtitleError!,
              iconColor: fxc(context).iconDanger!,
              isWarning: true,
              onTap: () => selectedIndex.value = 1,
            ),

            const SizedBox(height: 15),

            PrimaryButton(
              text: "확인",
              onTap: isAnySelected ? () => Navigator.pop(context, true) : null,
              backgroundColor: isAnySelected
                  ? fxc(context).brandColor!
                  : vrc(context).disableColor!,
              foregroundColor: isAnySelected
                  ? fxc(context).textBrand!
                  : vrc(context).textDisable!,
            ),
            const SizedBox(height: 10),
            InkWell(
              onTap: () => Navigator.pop(context),
              child: Text(
                "취소하고 돌아가기",
                style: TextStyle(
                  color: vrc(context).textTertiary,
                  fontSize: 13,
                  fontFamily: "PretendardRegular"
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
