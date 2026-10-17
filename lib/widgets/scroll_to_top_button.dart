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
                  width: 52,
                  height: 52,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      // Circular Scroll Progress Ring
                      SizedBox(
                        width: 50,
                        height: 50,
                        child: CircularProgressIndicator(
                          value: _scrollProgress,
                          strokeWidth: 2.2,
                          backgroundColor: Colors.white.withValues(alpha: 0.12),
                          valueColor: AlwaysStoppedAnimation<Color>(
                            _isHovered ? kCyan : const Color(0xFF818CF8),
                          ),
                        ),
                      ),
                      // Glassmorphic Button Body
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        width: 42,
                        height: 42,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
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
                          border: Border.all(
                            color: Colors.white.withValues(alpha: _isHovered ? 0.45 : 0.25),
                            width: 1.1,
                          ),
                        ),
                        child: Center(
                          child: AnimatedSlide(
                            offset: _isHovered ? const Offset(0, -0.08) : Offset.zero,
                            duration: const Duration(milliseconds: 180),
                            child: const Icon(
                              Icons.keyboard_arrow_up_rounded,
                              color: Colors.white,
                              size: 24,
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
