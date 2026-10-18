import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';

/// A sleek, glassmorphic floating action button that appears when the user
/// has scrolled down, displays a circular scroll-progress ring, and smoothly returns to top on tap.
class ScrollToTopButton extends StatefulWidget {
  final ScrollController scrollController;
  final double threshold;

  const ScrollToTopButton({
    super.key,
    required this.scrollController,
    this.threshold = 320.0,
  });

  @override
  State<ScrollToTopButton> createState() => _ScrollToTopButtonState();
}

class _ScrollToTopButtonState extends State<ScrollToTopButton> {
  bool _isVisible = false;
  bool _isHovered = false;
  double _scrollProgress = 0.0;

  @override
  void initState() {
    super.initState();
    widget.scrollController.addListener(_onScroll);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) _onScroll();
    });
  }

  @override
  void didUpdateWidget(covariant ScrollToTopButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.scrollController != widget.scrollController) {
      oldWidget.scrollController.removeListener(_onScroll);
      widget.scrollController.addListener(_onScroll);
    }
  }

  @override
  void dispose() {
    widget.scrollController.removeListener(_onScroll);
    super.dispose();
  }

  void _onScroll() {
    if (!widget.scrollController.hasClients) return;
    final maxScroll = widget.scrollController.position.maxScrollExtent;
    final currentScroll = widget.scrollController.offset;
    final progress = maxScroll > 0 ? (currentScroll / maxScroll).clamp(0.0, 1.0) : 0.0;
    final isScrolledPast = currentScroll > widget.threshold;
    if (isScrolledPast != _isVisible || (progress - _scrollProgress).abs() > 0.015) {
      setState(() {
        _isVisible = isScrolledPast;
        _scrollProgress = progress;
      });
    }
  }

  void _scrollToTop() {
    if (!widget.scrollController.hasClients) return;
    widget.scrollController.animateTo(
      0,
      duration: const Duration(milliseconds: 750),
      curve: Curves.easeInOutCubic,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      scale: _isVisible ? 1.0 : 0.0,
      duration: const Duration(milliseconds: 260),
      curve: Curves.easeOutBack,
      child: AnimatedOpacity(
        opacity: _isVisible ? 1.0 : 0.0,
        duration: const Duration(milliseconds: 220),
        child: IgnorePointer(
          ignoring: !_isVisible,
          child: Tooltip(
            message: 'Back to top (${(_scrollProgress * 100).toInt()}%)',
            waitDuration: const Duration(milliseconds: 300),
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              onEnter: (_) => setState(() => _isHovered = true),
              onExit: (_) => setState(() => _isHovered = false),
              child: GestureDetector(
                onTap: _scrollToTop,
                child: SizedBox(
                  width: 46,
                  height: 46,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      // Glassmorphic Button Body
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        width: 46,
                        height: 46,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(13),
                          gradient: LinearGradient(
                            colors: _isHovered
                                ? const [Color(0xFF818CF8), Color(0xFF22D3EE)]
                                : const [Color(0xFF6366F1), Color(0xFF06B6D4)],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: (_isHovered ? kCyan : kPurple)
                                  .withValues(alpha: _isHovered ? 0.6 : 0.35),
                              blurRadius: _isHovered ? 18 : 10,
                              spreadRadius: _isHovered ? 1.2 : 0,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Center(
                          child: AnimatedSlide(
                            offset: _isHovered ? const Offset(0, -0.08) : Offset.zero,
                            duration: const Duration(milliseconds: 180),
                            child: const Icon(
                              Icons.keyboard_arrow_up_rounded,
                              color: Colors.white,
                              size: 26,
                            ),
                          ),
                        ),
                      ),
                      // Progress indicator drawn directly on the button's rounded rectangular border
                      Positioned.fill(
                        child: IgnorePointer(
                          child: CustomPaint(
                            painter: _RoundedBorderProgressPainter(
                              progress: _scrollProgress,
                              strokeWidth: 2.6,
                              radius: 13,
                              trackColor: Colors.white.withValues(alpha: _isHovered ? 0.35 : 0.22),
                              progressColor: Colors.white,
                              progressGradient: LinearGradient(
                                colors: _isHovered
                                    ? const [Colors.white, Color(0xFFE0F2FE)]
                                    : const [Colors.white, Color(0xFF67E8F9)],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

/// Custom painter that draws a progress indicator along the perimeter of a rounded rectangle.
class _RoundedBorderProgressPainter extends CustomPainter {
  final double progress;
  final double strokeWidth;
  final double radius;
  final Color trackColor;
  final Color progressColor;
  final Gradient? progressGradient;

  _RoundedBorderProgressPainter({
    required this.progress,
    required this.strokeWidth,
    required this.radius,
    required this.trackColor,
    required this.progressColor,
    this.progressGradient,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final strokeOffset = strokeWidth / 2;
    final rect = Rect.fromLTWH(
      strokeOffset,
      strokeOffset,
      size.width - strokeWidth,
      size.height - strokeWidth,
    );
    final r = (radius - strokeOffset > 0) ? radius - strokeOffset : radius;
    final rrect = RRect.fromRectAndRadius(rect, Radius.circular(r));

    // 1. Draw resting background track border
    final trackPaint = Paint()
      ..color = trackColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;
    canvas.drawRRect(rrect, trackPaint);

    if (progress <= 0.001) return;

    // 2. Prepare progress paint
    final progressPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round
      ..strokeWidth = strokeWidth;

    if (progressGradient != null) {
      progressPaint.shader = progressGradient!.createShader(rect);
    } else {
      progressPaint.color = progressColor;
    }

    if (progress >= 0.995) {
      canvas.drawRRect(rrect, progressPaint);
      return;
    }

    // 3. Construct clockwise path starting from top-center
    final path = Path();
    final top = rect.top;
    final bottom = rect.bottom;
    final left = rect.left;
    final right = rect.right;
    final midX = (left + right) / 2;

    path.moveTo(midX, top);
    path.lineTo(right - r, top);
    path.arcToPoint(Offset(right, top + r), radius: Radius.circular(r));
    path.lineTo(right, bottom - r);
    path.arcToPoint(Offset(right - r, bottom), radius: Radius.circular(r));
    path.lineTo(left + r, bottom);
    path.arcToPoint(Offset(left, bottom - r), radius: Radius.circular(r));
    path.lineTo(left, top + r);
    path.arcToPoint(Offset(left + r, top), radius: Radius.circular(r));
    path.lineTo(midX, top);

    final metrics = path.computeMetrics().toList();
    if (metrics.isEmpty) return;

    final metric = metrics.first;
    final sweepDistance = metric.length * progress.clamp(0.0, 1.0);
    final progressPath = metric.extractPath(0.0, sweepDistance);
    canvas.drawPath(progressPath, progressPaint);
  }

  @override
  bool shouldRepaint(covariant _RoundedBorderProgressPainter oldDelegate) {
    return oldDelegate.progress != progress ||
        oldDelegate.strokeWidth != strokeWidth ||
        oldDelegate.radius != radius ||
        oldDelegate.trackColor != trackColor ||
        oldDelegate.progressColor != progressColor;
  }
}

