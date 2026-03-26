import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trana/core/theme/app_theme.dart';

class TermsAgreementPage extends HookConsumerWidget { 
  const TermsAgreementPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) { 
    const int currentStep = 1;
    const int totalStep = 5;

    final double progress = currentStep / totalStep;
    final double screenWidth = MediaQuery.of(context).size.width;
    final double barWidth = screenWidth * progress;

    return Scaffold(
      appBar: AppBar(
        elevation: 0, 
        title: const Text(
          "본인 인증",
          style: TextStyle(
            color: Color(0xFFFFFFFF),
            fontSize: 17,
            fontWeight: FontWeight.w800,
          ),
        ),
        backgroundColor: const Color(0xFF161616),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              height: 4,
              width: barWidth,
              color: const Color(0xFF40C572),
            ),
          ),
        ),
      ),
      backgroundColor: vrc(context).background,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 30, 20, 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "서비스 이용약관",
              style: TextStyle(
                color: Color(0xFFFFFFFF),
                fontSize: 20,
                fontWeight: FontWeight.w800,
              ),
            ),
            const SizedBox(height: 5),
            const Text(
              "원활한 서비스 이용을 위해 약관에 동의해주세요.",
              style: TextStyle(
                color: Color(0xFF999999),
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}