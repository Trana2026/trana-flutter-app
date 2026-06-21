import 'package:flutter/material.dart';

/// 스플래시 배경의 2개의 코너 글로우(블러처리된 원형 에셋)를 그리는 위젯
class SplashGlowBackground extends StatelessWidget {
  const SplashGlowBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox.expand(child: CustomPaint(painter: _GlowPainter()));
  }
}

/// 블러 원 2개를 가우시안 블러로 렌더
class _GlowPainter extends CustomPainter {
  const _GlowPainter();

  // 피그마 프레임 width(375)로 좌표/반경/블러를 비례 스케일
  static const double _designWidth = 375;

  // 글로우 원 값
  static const double _radius = 266;
  static const double _opacity = 0.15;
  static const double _blur = 200;

  @override
  void paint(Canvas canvas, Size size) {
    final s = size.width / _designWidth;

    // 좌하단, #3AFF90
    _drawGlow(
      canvas,
      center: Offset(20 * s, size.height - 37 * s),
      color: const Color(0xFF3AFF90),
      scale: s,
    );

    // 우상단, #A0F15E
    _drawGlow(
      canvas,
      center: Offset(size.width, 0),
      color: const Color(0xFFA0F15E),
      scale: s,
    );
  }

  void _drawGlow(
    Canvas canvas, {
    required Offset center,
    required Color color,
    required double scale,
  }) {
    final paint = Paint()
      ..color = color.withValues(alpha: _opacity)
      ..maskFilter = MaskFilter.blur(BlurStyle.normal, _blur * scale / 2);
    canvas.drawCircle(center, _radius * scale, paint);
  }

  @override
  bool shouldRepaint(_GlowPainter oldDelegate) => false;
}
