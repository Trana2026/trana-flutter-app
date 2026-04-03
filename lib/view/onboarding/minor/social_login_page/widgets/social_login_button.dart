import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SocialLoginButton extends HookConsumerWidget {
  final VoidCallback onTap;
  final Color backgroundColor;
  final Color foregroundColor;
  final String title;

  const SocialLoginButton({
    super.key,
    required this.onTap,
    required this.backgroundColor,
    required this.foregroundColor,
    required this.title,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      width: double.infinity,
      height: 54,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 17,
            fontFamily: "PretendardSemiBold",
          ),
        ),
      ),
    );
  }
}
