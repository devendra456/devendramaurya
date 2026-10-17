import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';

// ---------------------------------------------------------------------------
// Award Badge Card (Interactive Hover Lift + Icon Bloom)
// ---------------------------------------------------------------------------
class AwardBadgeCard extends StatefulWidget {
  const AwardBadgeCard({
    super.key,
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.detail,
  });

  final IconData icon;
  final Color iconColor;
  final String title;
  final String detail;

  @override
  State<AwardBadgeCard> createState() => _AwardBadgeCardState();
}

class _AwardBadgeCardState extends State<AwardBadgeCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 220),
        curve: Curves.easeOutCubic,
        transform: Matrix4.translationValues(_isHovered ? 4 : 0, _isHovered ? -2 : 0, 0),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: _isHovered ? kPanelAlt : kPanel,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: _isHovered
                ? widget.iconColor.withValues(alpha: 0.55)
                : Colors.white.withValues(alpha: 0.07),
            width: _isHovered ? 1.2 : 1.0,
          ),
          boxShadow: _isHovered
              ? [
                  BoxShadow(
                    color: widget.iconColor.withValues(alpha: 0.22),
                    blurRadius: 14,
                    offset: const Offset(0, 3),
                  ),
                ]
              : null,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 220),
              width: 42,
              height: 42,
              decoration: BoxDecoration(
                color: _isHovered
                    ? widget.iconColor.withValues(alpha: 0.28)
                    : widget.iconColor.withValues(alpha: 0.15),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: _isHovered
                      ? widget.iconColor.withValues(alpha: 0.5)
                      : Colors.transparent,
                  width: 1,
                ),
                boxShadow: _isHovered
                    ? [
                        BoxShadow(
                          color: widget.iconColor.withValues(alpha: 0.4),
                          blurRadius: 10,
                        ),
                      ]
                    : null,
              ),
              child: AnimatedScale(
                duration: const Duration(milliseconds: 200),
                scale: _isHovered ? 1.12 : 1.0,
                child: Icon(widget.icon, color: widget.iconColor, size: 22),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 12,
                      color: _isHovered ? widget.iconColor : kWhite,
                    ),
                  ),
                  const SizedBox(height: 3),
                  Text(
                    widget.detail,
                    style: const TextStyle(
                      color: kMuted,
                      fontSize: 10.5,
                      height: 1.35,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
