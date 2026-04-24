import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart'; 

class ContractCtaButton extends HookConsumerWidget {
  final String text;
  final Color bg;
  final Color fg;
  final VoidCallback onTap;

  const ContractCtaButton({
    super.key,
    required this.text,
    required this.bg,
    required this.fg,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 60,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: fg,
            fontSize: 17,
            fontFamily: "PretendardSemiBold",
            letterSpacing: -0.2
          ),
        ),
      ),
    );
  }
}
