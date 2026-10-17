import 'package:flutter/material.dart';

// ---------------------------------------------------------------------------
// Pulsing Status Dot (Live Radar Pulse Beacon)
// ---------------------------------------------------------------------------
class PulsingStatusDot extends StatefulWidget {
  const PulsingStatusDot({
    super.key,
    this.color = const Color(0xFF10B981),
    this.size = 8.0,
    this.pulseRadiusMultiplier = 2.8,
  });

  final Color color;
  final double size;
  final double pulseRadiusMultiplier;

  @override
  State<PulsingStatusDot> createState() => _PulsingStatusDotState();
}

class _PulsingStatusDotState extends State<PulsingStatusDot>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _scaleAnimation;
  late final Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1800),
    )..repeat();

    _scaleAnimation = Tween<double>(begin: 1.0, end: widget.pulseRadiusMultiplier).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic),
    );

    _opacityAnimation = Tween<double>(begin: 0.75, end: 0.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.size * widget.pulseRadiusMultiplier,
      height: widget.size * widget.pulseRadiusMultiplier,
      child: Stack(
        alignment: Alignment.center,
        children: [
          // Expanding radar pulse ring
          AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              return Transform.scale(
                scale: _scaleAnimation.value,
                child: Container(
                  width: widget.size,
                  height: widget.size,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: widget.color.withValues(alpha: _opacityAnimation.value),
                      width: 1.5,
                    ),
                  ),
                ),
              );
            },
          ),
          // Solid center glowing dot
          Container(
            width: widget.size,
            height: widget.size,
            decoration: BoxDecoration(
              color: widget.color,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: widget.color.withValues(alpha: 0.8),
                  blurRadius: 6,
                  spreadRadius: 1,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
