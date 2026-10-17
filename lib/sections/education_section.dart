import 'package:flutter/material.dart';
import '../core/constants/portfolio_links.dart';
import '../core/theme/app_colors.dart';
import '../widgets/education_card.dart';

// ---------------------------------------------------------------------------
// Education Section
// ---------------------------------------------------------------------------
class EducationSection extends StatelessWidget {
  const EducationSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section Pill Badge
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
            decoration: BoxDecoration(
              color: kPanel.withValues(alpha: 0.8),
              borderRadius: BorderRadius.circular(99),
              border: Border.all(
                color: kPurple.withValues(alpha: 0.4),
                width: 1,
              ),
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.school_rounded, color: kPurple, size: 14),
                SizedBox(width: 7),
                Text(
                  'ACADEMIC BACKGROUND',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 1.1,
                    color: Color(0xFFD6BCFA),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          // Heading
          Text.rich(
            TextSpan(
              children: [
                const TextSpan(text: 'Education & '),
                TextSpan(
                  text: 'Qualifications',
                  style: TextStyle(
                    foreground: Paint()
                      ..shader = const LinearGradient(
                        colors: [kPurple, kCyan],
                      ).createShader(const Rect.fromLTWH(0, 0, 240, 40)),
                  ),
                ),
              ],
            ),
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w900,
              letterSpacing: -0.6,
            ),
          ),
          const SizedBox(height: 6),
          const Text(
            'Formal computer science education and engineering credentials.',
            style: TextStyle(color: kMuted, fontSize: 13),
          ),
          const SizedBox(height: 24),
          // 2 Cards Grid
          LayoutBuilder(
            builder: (context, constraints) {
              final isNarrow = constraints.maxWidth < 920;

              final btechCard = EducationCard(
                degree: 'B.Tech in Computer Science & Engineering',
                institution: 'Babu Sunder Singh Institute Of Technology, Lucknow',
                affiliation: 'Dr. A. P. J. Abdul Kalam Technical University (AKTU)',
                dates: 'June 2022 – July 2025',
                score: '7.16 CGPA (68.02%)',
                logoAsset: 'assets/images/aktu_logo.png',
                accentColor: kCyan,
                subjects: const [
                  'Cloud Computing',
                  'Big Data',
                  'Python',
                  'Compiler Design',
                  'Discrete Math',
                ],
                websiteUrl: PortfolioLinks.bssitm,
                websiteLabel: 'bssitm.ac.in',
              );

              final diplomaCard = EducationCard(
                degree: 'Diploma in Computer Science & Engineering',
                institution: 'Rajkiya Polytechnic Premdhar Patti, Pratapgarh',
                affiliation: 'Board of Technical Education Uttar Pradesh (BTEUP)',
                dates: 'June 2017 – July 2020',
                score: '🏆 2nd Rank Award (78.49%)',
                logoAsset: 'assets/images/bte_logo.png',
                accentColor: kGold,
                subjects: const [
                  'Data Structures',
                  'Operating Systems',
                  'Java Programming',
                  'System Design',
                  'Electronics',
                ],
                websiteUrl: PortfolioLinks.gppPratapgarh,
                websiteLabel: 'gpppratapgarh.in',
              );

              if (isNarrow) {
                return Column(
                  children: [
                    btechCard,
                    const SizedBox(height: 18),
                    diplomaCard,
                  ],
                );
              }

              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: btechCard),
                  const SizedBox(width: 22),
                  Expanded(child: diplomaCard),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
