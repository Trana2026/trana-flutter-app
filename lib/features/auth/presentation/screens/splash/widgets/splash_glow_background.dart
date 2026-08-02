import 'package:flutter/material.dart';
import 'package:trana/core/constants/app_dimens.dart';

/// 스플래시 화면의 글로우 배경을 그리는 위젯
class SplashGlowBackground extends StatelessWidget {
  const SplashGlowBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox.expand(child: CustomPaint(painter: _GlowPainter()));
  }
}

/// 원형 2개를 가우시안 블러로 렌더
class _GlowPainter extends CustomPainter {
  const _GlowPainter();

  static const double _radius = 266;
  static const double _opacity = 0.15;
  static const double _blur = 200;

  @override
  void paint(Canvas canvas, Size size) {
    final s = size.width / kDesignFrameWidth;

    _drawGlow(
      canvas,
      center: Offset(20 * s, size.height - 37 * s),
      color: const Color(0xFF3AFF90),
      scale: s,
    );

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
