import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';

// ---------------------------------------------------------------------------
// Featured Project Card (Hoverable with Inset Phone Mockup / Themed Badge)
// ---------------------------------------------------------------------------
class FeaturedProjectCard extends StatefulWidget {
  const FeaturedProjectCard({
    super.key,
    required this.title,
    required this.badge,
    required this.badgeColor,
    required this.description,
    this.imageAsset,
    this.logoAsset,
    this.fallbackIcon,
    required this.accentColor,
    required this.onCaseStudy,
  });

  final String title;
  final String badge;
  final Color badgeColor;
  final String description;
  final String? imageAsset;
  final String? logoAsset;
  final IconData? fallbackIcon;
  final Color accentColor;
  final VoidCallback onCaseStudy;

  @override
  State<FeaturedProjectCard> createState() => _FeaturedProjectCardState();
}

class _FeaturedProjectCardState extends State<FeaturedProjectCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onCaseStudy,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 240),
          curve: Curves.easeOutCubic,
          transform: Matrix4.translationValues(0, _isHovered ? -6 : 0, 0),
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: _isHovered ? kPanelAlt : kPanelCard,
            borderRadius: BorderRadius.circular(18),
            border: Border.all(
              color: _isHovered
                  ? widget.accentColor.withValues(alpha: 0.6)
                  : Colors.white.withValues(alpha: 0.08),
              width: 1.2,
            ),
            boxShadow: _isHovered
                ? [
                    BoxShadow(
                      color: widget.accentColor.withValues(alpha: 0.25),
                      blurRadius: 16,
                      offset: const Offset(0, 4),
                    ),
                  ]
                : [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.2),
                      blurRadius: 6,
                      offset: const Offset(0, 2),
                    ),
                  ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top row: Phone thumbnail + Badge & Title
              Expanded(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    AnimatedScale(
                      duration: const Duration(milliseconds: 220),
                      scale: _isHovered ? 1.04 : 1.0,
                      child: Container(
                        width: 82,
                        decoration: BoxDecoration(
                          color: widget.accentColor.withValues(alpha: 0.08),
                          borderRadius: BorderRadius.circular(13),
                          border: Border.all(
                            color: _isHovered
                                ? widget.accentColor.withValues(alpha: 0.65)
                                : widget.accentColor.withValues(alpha: 0.35),
                            width: 1.2,
                          ),
                          boxShadow: _isHovered
                              ? [
                                  BoxShadow(
                                    color: widget.accentColor.withValues(alpha: 0.3),
                                    blurRadius: 10,
                                  ),
                                ]
                              : null,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              (widget.imageAsset != null && widget.imageAsset!.isNotEmpty)
                                  ? Image.asset(
                                      widget.imageAsset!,
                                      fit: BoxFit.contain,
                                      alignment: Alignment.center,
                                      cacheWidth: 200,
                                      filterQuality: FilterQuality.low,
                                      errorBuilder: (context, error, stackTrace) => Center(
                                        child: Container(
                                          padding: const EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                            color: widget.accentColor.withValues(alpha: 0.16),
                                            shape: BoxShape.circle,
                                          ),
                                          child: Icon(
                                            widget.fallbackIcon ?? Icons.apps_rounded,
                                            size: 26,
                                            color: widget.accentColor,
                                          ),
                                        ),
                                      ),
                                    )
                                  : Center(
                                      child: Container(
                                        padding: const EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          color: widget.accentColor.withValues(alpha: 0.16),
                                          shape: BoxShape.circle,
                                        ),
                                        child: Icon(
                                          widget.fallbackIcon ?? Icons.apps_rounded,
                                          size: 26,
                                          color: widget.accentColor,
                                        ),
                                      ),
                                    ),
                              // Diagonal Glass Shimmer Sweep
                              AnimatedOpacity(
                                duration: const Duration(milliseconds: 280),
                                opacity: _isHovered ? 1.0 : 0.0,
                                child: IgnorePointer(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                        stops: const [0.0, 0.42, 0.58, 1.0],
                                        colors: [
                                          Colors.transparent,
                                          Colors.white.withValues(alpha: 0.12),
                                          Colors.white.withValues(alpha: 0.28),
                                          Colors.transparent,
                                        ],
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
                    const SizedBox(width: 14),
                    // Details
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Badge Pill & Logo
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              if (widget.logoAsset != null && widget.logoAsset!.isNotEmpty) ...[
                                Container(
                                  width: 18,
                                  height: 18,
                                  margin: const EdgeInsets.only(right: 6),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(color: Colors.white.withValues(alpha: 0.15)),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(4),
                                    child: Image.asset(
                                      widget.logoAsset!,
                                      fit: BoxFit.cover,
                                      cacheWidth: 40,
                                      cacheHeight: 40,
                                      filterQuality: FilterQuality.low,
                                    ),
                                  ),
                                ),
                              ],
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2.5),
                                decoration: BoxDecoration(
                                  color: widget.badgeColor.withValues(alpha: 0.16),
                                  borderRadius: BorderRadius.circular(99),
                                ),
                                child: Text(
                                  widget.badge,
                                  style: TextStyle(
                                    color: widget.badgeColor,
                                    fontSize: 8.5,
                                    fontWeight: FontWeight.w800,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          Text(
                            widget.title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 14.5,
                              fontWeight: FontWeight.w800,
                              letterSpacing: -0.3,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Flexible(
                            child: Text(
                              widget.description,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                color: kMuted,
                                fontSize: 10.5,
                                height: 1.35,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 6),
              // Bottom Action: View Case Study ->
              InkWell(
                onTap: widget.onCaseStudy,
                borderRadius: BorderRadius.circular(6),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 2),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'View Case Study',
                        style: TextStyle(
                          color: widget.accentColor,
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      AnimatedSlide(
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.easeOutCubic,
                        offset: _isHovered ? const Offset(0.35, 0) : Offset.zero,
                        child: Icon(
                          Icons.arrow_forward_rounded,
                          size: 13,
                          color: widget.accentColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 4),
              AnimatedContainer(
                duration: const Duration(milliseconds: 240),
                curve: Curves.easeOutCubic,
                height: 2.5,
                width: _isHovered ? 120.0 : 36.0,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [widget.accentColor, kBlue],
                  ),
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
