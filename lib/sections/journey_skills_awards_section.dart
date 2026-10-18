import 'package:flutter/material.dart';
import '../core/constants/portfolio_links.dart';
import '../core/theme/app_colors.dart';
import '../widgets/award_badge_card.dart';
import '../widgets/journey_timeline_item.dart';
import '../widgets/skill_chip.dart';

// ---------------------------------------------------------------------------
// 3-Column Section: Journey, Skills & Awards
// ---------------------------------------------------------------------------
class JourneySkillsAwardsSection extends StatelessWidget {
  const JourneySkillsAwardsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isMobile = constraints.maxWidth < 768;
          final isTablet = constraints.maxWidth >= 768 && constraints.maxWidth < 1140;

          final journeyCol = Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'My Journey',
                style: TextStyle(fontSize: 21, fontWeight: FontWeight.w900),
              ),
              const SizedBox(height: 4),
              const Text(
                'From learning to building products that millions use.',
                style: TextStyle(color: kMuted, fontSize: 12),
              ),
              const SizedBox(height: 22),
              JourneyTimelineItem(
                dates: '2025 – Present',
                role: 'SDE 2',
                company: 'The Card Company',
                detail: 'Fintech, wallets, UPI, cards, performance & security.',
                companyUrl: PortfolioLinks.theCardCompany,
                companyUrlLabel: 'thecardcompany.in',
                isActive: true,
              ),
              JourneyTimelineItem(
                dates: '2023 – 2025',
                role: 'SDE 1',
                company: 'RV Solutions Pvt. Ltd.',
                detail: 'Mera Ration, UPYOG, MAUSAM, government apps.',
                companyUrl: PortfolioLinks.rvSolutions,
                companyUrlLabel: 'rvsolutions.in',
              ),
              JourneyTimelineItem(
                dates: '2021 – 2023',
                role: 'Mobile App Developer',
                company: 'Skyview Smart Solutions',
                detail: '10+ apps across e-commerce, dating, POS and more.',
                companyUrl: PortfolioLinks.skyviewAds,
                companyUrlLabel: 'skyviewads.com',
                isLast: true,
              ),
            ],
          );

          final skillsCol = Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Skills & Tech Stack',
                style: TextStyle(fontSize: 21, fontWeight: FontWeight.w900),
              ),
              const SizedBox(height: 4),
              const Text(
                'Technologies I work with to build modern mobile apps.',
                style: TextStyle(color: kMuted, fontSize: 12),
              ),
              const SizedBox(height: 22),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: const [
                  SkillChip(
                    imageAsset: 'assets/images/skill_flutter.png',
                    imageUrl: 'https://docs.flutter.dev/assets/images/flutter-logo-sharing.png',
                    icon: Icons.flutter_dash,
                    label: 'Flutter',
                    color: kCyan,
                  ),
                  SkillChip(
                    imageAsset: 'assets/images/skill_dart.png',
                    imageUrl: 'https://avatars.githubusercontent.com/u/1609975?s=280&v=4',
                    icon: Icons.code_rounded,
                    label: 'Dart',
                    color: kBlue,
                  ),
                  SkillChip(icon: Icons.android_rounded, label: 'Android', color: kGreen),
                  SkillChip(icon: Icons.apple_rounded, label: 'iOS', color: Colors.white),
                  SkillChip(
                    imageAsset: 'assets/images/skill_kotlin.png',
                    imageUrl:
                        'https://upload.wikimedia.org/wikipedia/commons/7/74/Kotlin_Icon.png?utm_source=commons.wikimedia.org&utm_campaign=index&utm_content=original',
                    icon: Icons.code_rounded,
                    label: 'Kotlin',
                    color: kPurple,
                  ),
                  SkillChip(
                    icon: Icons.local_fire_department_rounded,
                    label: 'Firebase',
                    color: Color(0xFFFF9E2A),
                  ),
                  SkillChip(
                    imageAsset: 'assets/images/skill_bloc.png',
                    imageUrl:
                        'https://downloads.marketplace.jetbrains.com/files/12129/1178142/icon/default.png',
                    icon: Icons.layers_rounded,
                    label: 'BLOC',
                    color: kBlue,
                  ),
                  SkillChip(
                    imageAsset: 'assets/images/skill_getx.png',
                    imageUrl: 'https://res.cloudinary.com/strapi/image/upload/v1621261454/logo_vgoldp.png',
                    icon: Icons.close_rounded,
                    label: 'GetX',
                    color: kCyan,
                  ),
                  SkillChip(icon: Icons.api_rounded, label: 'REST APIs', color: kCyan),
                  SkillChip(
                    imageAsset: 'assets/images/skill_graphql.png',
                    imageUrl: 'https://avatars.githubusercontent.com/u/12972006?s=280&v=4',
                    icon: Icons.grain_rounded,
                    label: 'GraphQL',
                    color: kPink,
                  ),
                  SkillChip(
                    icon: Icons.cloud_circle_rounded,
                    label: 'Cloud Functions',
                    color: kBlue,
                  ),
                  SkillChip(icon: Icons.account_balance_rounded, label: 'UPI', color: kGold),
                  SkillChip(
                    icon: Icons.credit_card_rounded,
                    label: 'Payments',
                    color: Color(0xFFF39C12),
                  ),
                  SkillChip(icon: Icons.map_rounded, label: 'Maps & GIS', color: kGreen),
                  SkillChip(icon: Icons.sync_rounded, label: 'CI/CD', color: kBlue),
                  SkillChip(icon: Icons.radar_rounded, label: 'Testing', color: kGreen),
                ],
              ),
            ],
          );

          final awardsCol = Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Awards & Achievements',
                style: TextStyle(fontSize: 21, fontWeight: FontWeight.w900),
              ),
              const SizedBox(height: 4),
              const Text(
                'Recognition for consistent delivery and impact.',
                style: TextStyle(color: kMuted, fontSize: 12),
              ),
              const SizedBox(height: 22),
              const AwardBadgeCard(
                icon: Icons.emoji_events_rounded,
                iconColor: kGold,
                title: 'Employee of the Month',
                detail: 'For delivering critical fintech features within project timelines.',
              ),
              const SizedBox(height: 12),
              const AwardBadgeCard(
                icon: Icons.workspace_premium_rounded,
                iconColor: Color(0xFFFF7E67),
                title: 'Best Performer Award (2024)',
                detail: 'For technical excellence and project delivery.',
              ),
              const SizedBox(height: 12),
              const AwardBadgeCard(
                icon: Icons.school_rounded,
                iconColor: Color(0xFF808BFF),
                title: 'Second Rank',
                detail: 'In Computer Science and Engineering diploma branch.',
              ),
            ],
          );

          if (isMobile) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                journeyCol,
                const SizedBox(height: 36),
                skillsCol,
                const SizedBox(height: 36),
                awardsCol,
              ],
            );
          }

          if (isTablet) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                journeyCol,
                const SizedBox(height: 40),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(flex: 5, child: skillsCol),
                    const SizedBox(width: 28),
                    Expanded(flex: 4, child: awardsCol),
                  ],
                ),
              ],
            );
          }

          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(flex: 9, child: journeyCol),
              const SizedBox(width: 32),
              Expanded(flex: 8, child: skillsCol),
              const SizedBox(width: 32),
              Expanded(flex: 7, child: awardsCol),
            ],
          );
        },
      ),
    );
  }
}
