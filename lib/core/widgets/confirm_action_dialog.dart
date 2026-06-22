import 'package:flutter/material.dart';
import 'package:trana/core/theme/app_theme.dart';

/// 취소 / 액션 2버튼 확인 다이얼로그 (로그아웃·회원탈퇴 등)
/// 확인 시 `Navigator.pop(context, true)`, 취소 시 `false` 반환
class ConfirmActionDialog extends StatelessWidget {
  final String title;
  final String message;
  final String confirmText;

  const ConfirmActionDialog({
    super.key,
    required this.title,
    required this.message,
    required this.confirmText,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: vrc(context).background,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      insetPadding: const EdgeInsets.symmetric(horizontal: 30),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 24, 20, 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: vrc(context).textPrimary,
                fontSize: 18,
                fontFamily: "PretendardBold",
              ),
            ),
            const SizedBox(height: 10),
            Text(
              message,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: vrc(context).textSecondary,
                fontSize: 13.5,
                fontFamily: "PretendardMedium",
                height: 1.35,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: _Button(
                    text: "취소",
                    background: vrc(context).secondaryColor!,
                    foreground: vrc(context).textPrimary!,
                    onTap: () => Navigator.pop(context, false),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: _Button(
                    text: confirmText,
                    background: fxc(context).brandColor!,
                    foreground: fxc(context).textBrand!,
                    onTap: () => Navigator.pop(context, true),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _Button extends StatelessWidget {
  final String text;
  final Color background;
  final Color foreground;
  final VoidCallback onTap;

  const _Button({
    required this.text,
    required this.background,
    required this.foreground,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: background,
      borderRadius: BorderRadius.circular(14),
      child: InkWell(
        borderRadius: BorderRadius.circular(14),
        onTap: onTap,
        child: Container(
          height: 52,
          alignment: Alignment.center,
          child: Text(
            text,
            style: TextStyle(
              color: foreground,
              fontSize: 15,
              fontFamily: "PretendardBold",
            ),
          ),
        ),
      ),
    );
  }
}
