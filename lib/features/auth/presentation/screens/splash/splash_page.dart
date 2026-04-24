import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart'; 
import 'package:hooks_riverpod/hooks_riverpod.dart'; 
import 'package:trana/features/auth/presentation/screens/intro/intro_page.dart';

class SplashPage extends HookConsumerWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(() {
      Future.delayed(const Duration(seconds: 3), () {
        if (context.mounted) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (_) => const IntroPage(),
            ),
          );
        }
      });

      return null;
    }, const []); 

    return Scaffold(
      backgroundColor: const Color(0xFF111827),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                "assets/images/logo.webp",
                width: 140,
              ),
              const SizedBox(height: 12),
              const Text(
                "Trana",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 33,
                  fontWeight: FontWeight.w800,
                  letterSpacing: -0.2,
                ),
              ),
              const SizedBox(height: 6),
              const Text(
                "모든 거래에 신뢰를 더하다",
                style: TextStyle(
                  color: Color(0xFFA0A7B2),
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  letterSpacing: -0.2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}