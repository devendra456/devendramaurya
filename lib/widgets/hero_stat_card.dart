import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';

// ---------------------------------------------------------------------------
// Hero Stat Card (Animated Count-Up + Interactive Hover Lift & Glow)
// ---------------------------------------------------------------------------
class HeroStatCard extends StatefulWidget {
  const HeroStatCard({
    super.key,
    required this.value,
    required this.label,
  });

  final String value;
  final String label;

  @override
  State<HeroStatCard> createState() => _HeroStatCardState();
}

class _HeroStatCardState extends State<HeroStatCard> {
  bool _isHovered = false;

  // Extract number and suffix from string like "5+", "30+", "1M+", "10+"
  (double, String) _parseTarget() {
    final raw = widget.value.trim();
    if (raw.contains('M+')) {
      final numStr = raw.replaceAll('M+', '');
      return (double.tryParse(numStr) ?? 1.0, 'M+');
    }
    if (raw.endsWith('+')) {
      final numStr = raw.replaceAll('+', '');
      return (double.tryParse(numStr) ?? 0.0, '+');
    }
    if (raw.endsWith('%')) {
      final numStr = raw.replaceAll('%', '');
      return (double.tryParse(numStr) ?? 100.0, '%');
    }
    return (double.tryParse(raw) ?? 0.0, '');
  }

  @override
  Widget build(BuildContext context) {
    final (targetNumber, suffix) = _parseTarget();

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        curve: Curves.easeOutCubic,
        transform: Matrix4.translationValues(0, _isHovered ? -5 : 0, 0),
        width: 128,
        height: 74,
        padding: const EdgeInsets.symmetric(horizontal: 13, vertical: 10),
        decoration: BoxDecoration(
          color: _isHovered ? kPanelAlt : kPanel.withValues(alpha: 0.85),
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: _isHovered
                ? kCyan.withValues(alpha: 0.6)
                : Colors.white.withValues(alpha: 0.08),
            width: _isHovered ? 1.2 : 1.0,
          ),
          boxShadow: _isHovered
              ? [
                  BoxShadow(
                    color: kCyan.withValues(alpha: 0.25),
                    blurRadius: 16,
                    offset: const Offset(0, 4),
                  ),
                ]
              : [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.2),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TweenAnimationBuilder<double>(
              tween: Tween<double>(begin: 0.0, end: targetNumber),
              duration: const Duration(milliseconds: 1600),
              curve: Curves.easeOutExpo,
              builder: (context, val, _) {
                final displayVal = (suffix == 'M+')
                    ? '${val.toStringAsFixed(val < 1 ? 1 : 0)}$suffix'
                    : '${val.toInt()}$suffix';

                return Text(
                  displayVal,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w900,
                    letterSpacing: -0.5,
                    color: _isHovered ? kCyan : kWhite,
                    height: 1.1,
                  ),
                );
              },
            ),
            const SizedBox(height: 4),
            Text(
              widget.label,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: _isHovered ? kMutedLight : kMuted,
                fontSize: 10,
                fontWeight: FontWeight.w500,
                height: 1.1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
