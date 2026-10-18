import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';

// ---------------------------------------------------------------------------
// Skill Chip (Interactive Scale & Brand Color Bloom on Hover)
// ---------------------------------------------------------------------------
class SkillChip extends StatefulWidget {
  const SkillChip({
    super.key,
    this.icon,
    this.imageAsset,
    this.imageUrl,
    required this.label,
    required this.color,
  });

  final IconData? icon;
  final String? imageAsset;
  final String? imageUrl;
  final String label;
  final Color color;

  @override
  State<SkillChip> createState() => _SkillChipState();
}

class _SkillChipState extends State<SkillChip> {
  bool _isHovered = false;

  Widget _buildLogo() {
    if (widget.imageAsset != null) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: Image.asset(
          widget.imageAsset!,
          width: 22,
          height: 22,
          fit: BoxFit.contain,
          errorBuilder: (_, __, ___) {
            if (widget.imageUrl != null) {
              return Image.network(
                widget.imageUrl!,
                width: 22,
                height: 22,
                fit: BoxFit.contain,
                errorBuilder: (_, __, ___) => _buildFallbackIcon(),
              );
            }
            return _buildFallbackIcon();
          },
        ),
      );
    } else if (widget.imageUrl != null) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: Image.network(
          widget.imageUrl!,
          width: 22,
          height: 22,
          fit: BoxFit.contain,
          errorBuilder: (_, __, ___) => _buildFallbackIcon(),
        ),
      );
    }
    return _buildFallbackIcon();
  }

  Widget _buildFallbackIcon() {
    return Icon(
      widget.icon ?? Icons.code_rounded,
      color: widget.color,
      size: 22,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.basic,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOutCubic,
        transform: Matrix4.translationValues(0.0, _isHovered ? -5.0 : 0.0, 0.0),
        transformAlignment: Alignment.center,
        width: 78,
        height: 68,
        padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 8),
        decoration: BoxDecoration(
          color: _isHovered
              ? widget.color.withValues(alpha: 0.14)
              : kPanel,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(
            color: _isHovered
                ? widget.color.withValues(alpha: 0.65)
                : Colors.white.withValues(alpha: 0.07),
            width: _isHovered ? 1.2 : 1.0,
          ),
          boxShadow: _isHovered
              ? [
                  BoxShadow(
                    color: widget.color.withValues(alpha: 0.35),
                    blurRadius: 16,
                    offset: const Offset(0, 4),
                  ),
                ]
              : [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.2),
                    blurRadius: 8,
                  ),
                ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedScale(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeOutBack,
              scale: _isHovered ? 1.15 : 1.0,
              child: _buildLogo(),
            ),
            const SizedBox(height: 6),
            Text(
              widget.label,
              textAlign: TextAlign.center,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                fontSize: 9.5,
                fontWeight: FontWeight.w700,
                color: _isHovered ? Colors.white : kWhite,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
