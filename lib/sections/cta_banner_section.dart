import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../core/constants/portfolio_links.dart';
import '../core/theme/app_colors.dart';
import '../widgets/social_icon_button.dart';

// ---------------------------------------------------------------------------
// Bottom Call To Action Banner
// ---------------------------------------------------------------------------
class CtaBannerSection extends StatelessWidget {
  const CtaBannerSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFF231464), Color(0xFF13204E), Color(0xFF09142A)],
        ),
        border: Border.all(color: Colors.white.withValues(alpha: 0.12), width: 1.2),
        boxShadow: [
          BoxShadow(
            color: kPurple.withValues(alpha: 0.2),
            blurRadius: 34,
            spreadRadius: 2,
          ),
        ],
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isNarrow = constraints.maxWidth < 860;

          final left = Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                'Let\'s Build Something Amazing',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w900,
                  letterSpacing: -0.5,
                ),
              ),
              SizedBox(height: 6),
              Text(
                'Open to full-time opportunities, freelance projects, and collaborations.',
                style: TextStyle(color: Color(0xFFCAD6F1), fontSize: 13),
              ),
            ],
          );

          final right = Wrap(
            spacing: 12,
            runSpacing: 12,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              // Download Resume Button
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(999),
                  gradient: const LinearGradient(
                    colors: [Color(0xFF386CF8), Color(0xFF1F46D0)],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: kBlue.withValues(alpha: 0.35),
                      blurRadius: 18,
                    ),
                  ],
                ),
                child: ElevatedButton.icon(
                  onPressed: () => PortfolioLinks.open(PortfolioLinks.resume),
                  icon: const Icon(Icons.download_rounded, size: 16),
                  label: const Text('Download Resume'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    shadowColor: Colors.transparent,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 13),
                    textStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              // Contact Me Button
              OutlinedButton.icon(
                onPressed: () => PortfolioLinks.open(PortfolioLinks.email),
                icon: const Icon(Icons.send_rounded, size: 15, color: kCyan),
                label: const Text('Contact Me'),
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: kPanel.withValues(alpha: 0.6),
                  side: BorderSide(color: Colors.white.withValues(alpha: 0.18)),
                  padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 13),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(999)),
                  textStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
                ),
              ),
              // Call Button on Android Browser
              if (defaultTargetPlatform == TargetPlatform.android)
                OutlinedButton.icon(
                  onPressed: () => PortfolioLinks.open(PortfolioLinks.phone),
                  icon: const Icon(Icons.phone_in_talk_rounded, size: 15, color: Color(0xFF10B981)),
                  label: const Text('Call Devendra'),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: const Color(0xFF10B981).withValues(alpha: 0.16),
                    side: const BorderSide(color: Color(0xFF10B981), width: 1.2),
                    padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 13),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(999)),
                    textStyle: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
                  ),
                ),
              const SizedBox(width: 4),
              // Social Links row with real brand icons
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SocialIconButton(
                    faIcon: FontAwesomeIcons.linkedinIn,
                    brandColor: const Color(0xFF0A66C2),
                    tooltip: 'LinkedIn Profile',
                    onTap: () => PortfolioLinks.open(PortfolioLinks.linkedin),
                  ),
                  const SizedBox(width: 8),
                  SocialIconButton(
                    faIcon: FontAwesomeIcons.github,
                    brandColor: const Color(0xFFE2E8F0),
                    tooltip: 'GitHub Profile',
                    onTap: () => PortfolioLinks.open(PortfolioLinks.github),
                  ),
                  const SizedBox(width: 8),
                  SocialIconButton(
                    faIcon: FontAwesomeIcons.envelope,
                    brandColor: const Color(0xFFEA4335),
                    tooltip: 'Email (devendramaurya456@gmail.com)',
                    onTap: () => PortfolioLinks.open(PortfolioLinks.email),
                  ),
                  const SizedBox(width: 8),
                  SocialIconButton(
                    faIcon: FontAwesomeIcons.whatsapp,
                    brandColor: const Color(0xFF25D366),
                    tooltip: 'WhatsApp Chat',
                    onTap: () => PortfolioLinks.open(PortfolioLinks.whatsapp),
                  ),
                  if (defaultTargetPlatform == TargetPlatform.android) ...[
                    const SizedBox(width: 8),
                    SocialIconButton(
                      faIcon: FontAwesomeIcons.phone,
                      iconColor: const Color(0xFF10B981),
                      brandColor: const Color(0xFF10B981),
                      tooltip: 'Call (+91 78974 30432)',
                      onTap: () => PortfolioLinks.open(PortfolioLinks.phone),
                    ),
                  ],
                ],
              ),
            ],
          );

          if (isNarrow) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                left,
                const SizedBox(height: 22),
                right,
              ],
            );
          }

          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(child: left),
              const SizedBox(width: 16),
              right,
            ],
          );
        },
      ),
    );
  }
}
