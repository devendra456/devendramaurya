import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../core/theme/app_colors.dart';

// ---------------------------------------------------------------------------
// Social Icon Button with Brand Accents & Micro-Animations
// ---------------------------------------------------------------------------
class SocialIconButton extends StatefulWidget {
  const SocialIconButton({
    super.key,
    this.faIcon,
    this.icon,
    required this.tooltip,
    required this.onTap,
    this.iconColor,
    this.brandColor,
    this.size = 38,
  }) : assert(faIcon != null || icon != null, 'Either faIcon or icon must be provided');

  final FaIconData? faIcon;
  final IconData? icon;
  final String tooltip;
  final VoidCallback onTap;
  final Color? iconColor;
  final Color? brandColor;
  final double size;

  @override
  State<SocialIconButton> createState() => _SocialIconButtonState();
}

class _SocialIconButtonState extends State<SocialIconButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final activeBrandColor = widget.brandColor ?? kCyan;
    final effectiveIconColor = _isHovered
        ? Colors.white
        : (widget.iconColor ?? Colors.white.withValues(alpha: 0.9));

    return Tooltip(
      message: widget.tooltip,
      waitDuration: const Duration(milliseconds: 300),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        onEnter: (_) => setState(() => _isHovered = true),
        onExit: (_) => setState(() => _isHovered = false),
        child: GestureDetector(
          onTap: widget.onTap,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeOutCubic,
            width: widget.size,
            height: widget.size,
            decoration: BoxDecoration(
              color: _isHovered
                  ? activeBrandColor.withValues(alpha: 0.28)
                  : kPanel.withValues(alpha: 0.8),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: _isHovered
                    ? activeBrandColor.withValues(alpha: 0.7)
                    : Colors.white.withValues(alpha: 0.15),
                width: 1.2,
              ),
              boxShadow: _isHovered
                  ? [
                      BoxShadow(
                        color: activeBrandColor.withValues(alpha: 0.45),
                        blurRadius: 14,
                        spreadRadius: 1,
                        offset: const Offset(0, 3),
                      ),
                    ]
                  : null,
            ),
            child: Center(
              child: AnimatedScale(
                scale: _isHovered ? 1.14 : 1.0,
                duration: const Duration(milliseconds: 180),
                curve: Curves.easeOutBack,
                child: widget.faIcon != null
                    ? FaIcon(
                        widget.faIcon,
                        size: widget.size * 0.46,
                        color: effectiveIconColor,
                      )
                    : Icon(
                        widget.icon,
                        size: widget.size * 0.46,
                        color: effectiveIconColor,
                      ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
