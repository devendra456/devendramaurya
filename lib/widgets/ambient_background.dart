import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';

// ---------------------------------------------------------------------------
// Ambient Background Painter
// ---------------------------------------------------------------------------
class AmbientBackgroundPainter extends CustomPainter {
  AmbientBackgroundPainter(this.t);
  final double t;

  @override
  void paint(Canvas canvas, Size size) {
    // Top right cosmic purple/blue aura
    final p1 = Paint()
      ..shader = RadialGradient(
        colors: [
          kPurple.withValues(alpha: 0.16 + t * 0.05),
          kBlue.withValues(alpha: 0.08),
          Colors.transparent,
        ],
      ).createShader(
        Rect.fromCircle(
          center: Offset(size.width * 0.72, size.height * 0.14),
          radius: size.width * 0.45,
        ),
      );

    // Left cyan/indigo subtle aura
    final p2 = Paint()
      ..shader = RadialGradient(
        colors: [
          kBlue.withValues(alpha: 0.09 + (1 - t) * 0.04),
          Colors.transparent,
        ],
      ).createShader(
        Rect.fromCircle(
          center: Offset(size.width * 0.12, size.height * 0.38),
          radius: size.width * 0.35,
        ),
      );

    canvas.drawRect(Offset.zero & size, p1);
    canvas.drawRect(Offset.zero & size, p2);
  }

  @override
  bool shouldRepaint(covariant AmbientBackgroundPainter oldDelegate) =>
      oldDelegate.t != t;
}
