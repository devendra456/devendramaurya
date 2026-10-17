import 'package:flutter/material.dart';
import '../core/constants/portfolio_links.dart';
import '../core/theme/app_colors.dart';

// ---------------------------------------------------------------------------
// Education Card
// ---------------------------------------------------------------------------
class EducationCard extends StatefulWidget {
  const EducationCard({
    super.key,
    required this.degree,
    required this.institution,
    required this.affiliation,
    required this.dates,
    required this.score,
    required this.logoAsset,
    required this.accentColor,
    required this.subjects,
    required this.websiteUrl,
    required this.websiteLabel,
  });

  final String degree;
  final String institution;
  final String affiliation;
  final String dates;
  final String score;
  final String logoAsset;
  final Color accentColor;
  final List<String> subjects;
  final Uri websiteUrl;
  final String websiteLabel;

  @override
  State<EducationCard> createState() => _EducationCardState();
}

class _EducationCardState extends State<EducationCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 240),
        curve: Curves.easeOutCubic,
        transform: Matrix4.translationValues(0, _isHovered ? -5 : 0, 0),
        constraints: const BoxConstraints(minHeight: 280),
        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 20),
        decoration: BoxDecoration(
          color: _isHovered ? kPanelAlt : kPanelCard,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: _isHovered
                ? widget.accentColor.withValues(alpha: 0.55)
                : Colors.white.withValues(alpha: 0.08),
            width: 1.2,
          ),
          boxShadow: _isHovered
              ? [
                  BoxShadow(
                    color: widget.accentColor.withValues(alpha: 0.2),
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
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Top Row: Logo + Degree Title & Institution
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Institution Logo in clean border container
                    Container(
                      width: 52,
                      height: 52,
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.95),
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(
                          color: widget.accentColor.withValues(alpha: 0.35),
                          width: 1.2,
                        ),
                      ),
                      child: Image.asset(
                        widget.logoAsset,
                        fit: BoxFit.contain,
                        cacheWidth: 104,
                        filterQuality: FilterQuality.low,
                      ),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.degree,
                            style: const TextStyle(
                              fontSize: 15.5,
                              fontWeight: FontWeight.w800,
                              color: kWhite,
                              letterSpacing: -0.3,
                            ),
                          ),
                          const SizedBox(height: 3),
                          Text(
                            widget.institution,
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: kMutedLight,
                              height: 1.3,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            widget.affiliation,
                            style: const TextStyle(
                              fontSize: 10.5,
                              color: kMuted,
                              height: 1.25,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 14),
                // Badges Row: Dates + Score
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    // Dates Pill
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        color: Colors.white.withValues(alpha: 0.05),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: Colors.white.withValues(alpha: 0.1),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.calendar_today_rounded, size: 12, color: kMutedLight),
                          const SizedBox(width: 6),
                          Text(
                            widget.dates,
                            style: const TextStyle(
                              fontSize: 11,
                              color: kMutedLight,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Score Pill
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        color: widget.accentColor.withValues(alpha: 0.12),
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: widget.accentColor.withValues(alpha: 0.4),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.workspace_premium_rounded, size: 13, color: widget.accentColor),
                          const SizedBox(width: 5),
                          Text(
                            widget.score,
                            style: TextStyle(
                              fontSize: 11,
                              color: widget.accentColor,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 14),
                const Divider(color: Colors.white10, height: 1),
                const SizedBox(height: 12),
                // Coursework
                const Text(
                  'Key Coursework & Domains:',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    color: kMuted,
                    letterSpacing: 0.5,
                  ),
                ),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 6,
                  runSpacing: 6,
                  children: widget.subjects.map((subj) {
                    return Container(
                      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 4.5),
                      decoration: BoxDecoration(
                        color: kPanel.withValues(alpha: 0.8),
                        borderRadius: BorderRadius.circular(7),
                        border: Border.all(
                          color: Colors.white.withValues(alpha: 0.06),
                        ),
                      ),
                      child: Text(
                        subj,
                        style: const TextStyle(
                          fontSize: 10.5,
                          color: kMutedLight,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
            const SizedBox(height: 14),
            // Link to institution
            Align(
              alignment: Alignment.centerRight,
              child: TextButton.icon(
                onPressed: () => PortfolioLinks.open(widget.websiteUrl),
                icon: const Icon(Icons.open_in_new_rounded, size: 13, color: kCyan),
                label: Text(
                  widget.websiteLabel,
                  style: const TextStyle(
                    fontSize: 11.5,
                    color: kCyan,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                  backgroundColor: kCyan.withValues(alpha: 0.08),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
