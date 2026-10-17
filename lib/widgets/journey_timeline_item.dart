import 'package:flutter/material.dart';
import '../core/constants/portfolio_links.dart';
import '../core/theme/app_colors.dart';
import 'pulsing_status_dot.dart';

// ---------------------------------------------------------------------------
// Journey Timeline Item (Responsive Mobile & Desktop + Integrated Date Pill)
// ---------------------------------------------------------------------------
class JourneyTimelineItem extends StatefulWidget {
  const JourneyTimelineItem({
    super.key,
    required this.dates,
    required this.role,
    required this.company,
    required this.detail,
    this.companyUrl,
    this.companyUrlLabel,
    this.isActive = false,
    this.isLast = false,
  });

  final String dates;
  final String role;
  final String company;
  final String detail;
  final Uri? companyUrl;
  final String? companyUrlLabel;
  final bool isActive;
  final bool isLast;

  @override
  State<JourneyTimelineItem> createState() => _JourneyTimelineItemState();
}

class _JourneyTimelineItemState extends State<JourneyTimelineItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final activeColor = widget.isActive ? kCyan : kPurple;

    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeOutCubic,
        transform: Matrix4.translationValues(_isHovered ? 4 : 0, 0, 0),
        padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
        decoration: BoxDecoration(
          color: _isHovered ? Colors.white.withValues(alpha: 0.03) : Colors.transparent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 1. Timeline Dot + Adaptive Vertical Connecting Line
              SizedBox(
                width: 24,
                child: Column(
                  children: [
                    // Dot
                    if (widget.isActive)
                      const PulsingStatusDot(
                        color: kCyan,
                        size: 11,
                        pulseRadiusMultiplier: 2.2,
                      )
                    else
                      Container(
                        width: 11,
                        height: 11,
                        margin: const EdgeInsets.symmetric(vertical: 5),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: kPurple,
                          boxShadow: [
                            BoxShadow(
                              color: kPurple.withValues(alpha: 0.5),
                              blurRadius: 8,
                              spreadRadius: 1,
                            ),
                          ],
                        ),
                      ),
                    // Vertical line expanding to match content height dynamically
                    if (!widget.isLast)
                      Expanded(
                        child: Container(
                          width: 2,
                          margin: const EdgeInsets.symmetric(vertical: 4),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                activeColor.withValues(alpha: 0.7),
                                kPurple.withValues(alpha: 0.2),
                              ],
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              const SizedBox(width: 14),

              // 2. Main Content Column (Full remaining width!)
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Top Row: Role + Date Pill Badge
                      Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        spacing: 8,
                        runSpacing: 4,
                        children: [
                          Text(
                            widget.role,
                            style: TextStyle(
                              fontWeight: FontWeight.w800,
                              fontSize: 14.5,
                              letterSpacing: -0.2,
                              color: _isHovered ? kCyan : kWhite,
                            ),
                          ),
                          // Date Badge
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2.5),
                            decoration: BoxDecoration(
                              color: widget.isActive
                                  ? kCyan.withValues(alpha: 0.12)
                                  : Colors.white.withValues(alpha: 0.06),
                              borderRadius: BorderRadius.circular(6),
                              border: Border.all(
                                color: widget.isActive
                                    ? kCyan.withValues(alpha: 0.35)
                                    : Colors.white.withValues(alpha: 0.12),
                                width: 0.8,
                              ),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.calendar_today_rounded,
                                  size: 10,
                                  color: widget.isActive ? kCyan : kMutedLight,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  widget.dates,
                                  style: TextStyle(
                                    color: widget.isActive ? kCyan : kMutedLight,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w600,
                                    letterSpacing: 0.2,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),

                      // Company + Website Link Pill
                      Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        spacing: 8,
                        runSpacing: 4,
                        children: [
                          Text(
                            widget.company,
                            style: const TextStyle(
                              color: Color(0xFFD3C5FF),
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          if (widget.companyUrl != null)
                            InkWell(
                              onTap: () => PortfolioLinks.open(widget.companyUrl!),
                              borderRadius: BorderRadius.circular(6),
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 180),
                                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2.5),
                                decoration: BoxDecoration(
                                  color: _isHovered
                                      ? kCyan.withValues(alpha: 0.22)
                                      : kCyan.withValues(alpha: 0.12),
                                  borderRadius: BorderRadius.circular(6),
                                  border: Border.all(
                                    color: _isHovered
                                        ? kCyan.withValues(alpha: 0.6)
                                        : kCyan.withValues(alpha: 0.35),
                                    width: 0.8,
                                  ),
                                  boxShadow: _isHovered
                                      ? [
                                          BoxShadow(
                                            color: kCyan.withValues(alpha: 0.2),
                                            blurRadius: 8,
                                          ),
                                        ]
                                      : null,
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Text(
                                      widget.companyUrlLabel ?? 'Website',
                                      style: const TextStyle(
                                        color: kCyan,
                                        fontSize: 10,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                    const SizedBox(width: 4),
                                    const Icon(
                                      Icons.open_in_new_rounded,
                                      size: 10.5,
                                      color: kCyan,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                        ],
                      ),
                      const SizedBox(height: 5),

                      // Detail description
                      Text(
                        widget.detail,
                        style: const TextStyle(
                          color: kMuted,
                          fontSize: 11.5,
                          height: 1.45,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
