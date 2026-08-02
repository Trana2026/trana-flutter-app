import 'package:flutter/material.dart';
import 'package:trana/core/constants/app_dimens.dart';

/// 인트로 화면의 글로우 배경을 그리는 위젯
class IntroGlowBackground extends StatelessWidget {
  const IntroGlowBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox.expand(child: CustomPaint(painter: _GlowPainter()));
  }
}

/// 원 2개를 가우시안 블러로 렌더
class _GlowPainter extends CustomPainter {
  const _GlowPainter();

  static const double _radius = 266; // 지름 532
  static const double _blur = 200; // 블러 반경

  @override
  void paint(Canvas canvas, Size size) {
    final s = size.width / kDesignFrameWidth;

    // 좌측 중앙 글로우
    _drawGlow(
      canvas,
      center: Offset(20 * s, 404 * s),
      color: const Color(0xFF3AFF90),
      opacity: 0.30,
      scale: s,
    );

    // 우측 상단 글로우
    _drawGlow(
      canvas,
      center: Offset(size.width, 166 * s),
      color: const Color(0xFF40C572),
      opacity: 0.20,
      scale: s,
    );
  }

  void _drawGlow(
    Canvas canvas, {
    required Offset center,
    required Color color,
    required double opacity,
    required double scale,
  }) {
    final paint = Paint()
      ..color = color.withValues(alpha: opacity)
      // 블러 반경 ≈ 2σ
      // sigma = blur / 2
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, _blur * scale / 2);
    canvas.drawCircle(center, _radius * scale, paint);
  }

  @override
  bool shouldRepaint(_GlowPainter oldDelegate) => false;
}
