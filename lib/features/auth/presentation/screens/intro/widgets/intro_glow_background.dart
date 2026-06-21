import 'package:flutter/material.dart';

/// 인트로 배경의 블러 글로우 2개를 그리는 위젯
class IntroGlowBackground extends StatelessWidget {
  const IntroGlowBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox.expand(child: CustomPaint(painter: _GlowPainter()));
  }
}

/// 블러 원 2개를 가우시안 블러로 렌더
class _GlowPainter extends CustomPainter {
  const _GlowPainter();

  // 피그마 와이어프레임 width(375)로 좌표/반경/블러를 비례 스케일
  static const double _designWidth = 375;
  static const double _radius = 266; // 지름 532
  static const double _blur = 200; // 블러 반경

  @override
  void paint(Canvas canvas, Size size) {
    final s = size.width / _designWidth;

    // 좌측 중앙 글로우. #3AFF90. opacity 0.30
    _drawGlow(
      canvas,
      center: Offset(20 * s, 404 * s),
      color: const Color(0xFF3AFF90),
      opacity: 0.30,
      scale: s,
    );

    // 우상단 글로우. #40C572. opacity 0.20
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
