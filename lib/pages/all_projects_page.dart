import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';
import '../data/projects_data.dart';
import '../sections/footer_section.dart';
import '../widgets/ambient_background.dart';
import '../widgets/case_study_modal.dart';
import '../widgets/featured_project_card.dart';
import '../widgets/scroll_to_top_button.dart';

// ---------------------------------------------------------------------------
// All Projects Page (Full 15+ Application Archive)
// ---------------------------------------------------------------------------
class AllProjectsPage extends StatefulWidget {
  const AllProjectsPage({super.key});

  @override
  State<AllProjectsPage> createState() => _AllProjectsPageState();
}

class _AllProjectsPageState extends State<AllProjectsPage>
    with SingleTickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();
  String _selectedCategory = 'All';
  late final AnimationController _glowAnim;

  @override
  void initState() {
    super.initState();
    _glowAnim = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 8),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _glowAnim.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final allProjects = portfolioProjects;
    final displayedProjects = _selectedCategory == 'All'
        ? allProjects
        : allProjects.where((p) => p.categoryGroup == _selectedCategory).toList();

    final fintechGovCount =
        allProjects.where((p) => p.categoryGroup == 'Fintech & Gov').length;
    final posCount =
        allProjects.where((p) => p.categoryGroup == 'Enterprise & POS').length;
    final consumerCount =
        allProjects.where((p) => p.categoryGroup == 'Consumer & Lifestyle').length;

    return Scaffold(
      backgroundColor: kBg,
      floatingActionButton: ScrollToTopButton(
        scrollController: _scrollController,
      ),
      body: Stack(
        children: [
          // Background ambient gradient glow
          Positioned.fill(
            child: AnimatedBuilder(
              animation: _glowAnim,
              builder: (context, _) => CustomPaint(
                painter: AmbientBackgroundPainter(_glowAnim.value),
              ),
            ),
          ),

          // Main scrollable content
          CustomScrollView(
            controller: _scrollController,
            slivers: [
              SliverToBoxAdapter(
                child: Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 1360),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // Top Navigation Bar
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 20,
                          ),
                          child: Row(
                            children: [
                              // Back Button
                              InkWell(
                                onTap: () => Navigator.of(context).pop(),
                                borderRadius: BorderRadius.circular(12),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 14,
                                    vertical: 8,
                                  ),
                                  decoration: BoxDecoration(
                                    color: kPanel.withValues(alpha: 0.8),
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                      color: Colors.white.withValues(alpha: 0.1),
                                    ),
                                  ),
                                  child: const Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        Icons.arrow_back_rounded,
                                        size: 16,
                                        color: kWhite,
                                      ),
                                      SizedBox(width: 8),
                                      Text(
                                        'Back to Home',
                                        style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.w700,
                                          color: kWhite,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const Spacer(),
                              // App Count Badge
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                  vertical: 6,
                                ),
                                decoration: BoxDecoration(
                                  color: kPurple.withValues(alpha: 0.15),
                                  borderRadius: BorderRadius.circular(99),
                                  border: Border.all(
                                    color: kPurple.withValues(alpha: 0.35),
                                  ),
                                ),
                                child: Text(
                                  '${allProjects.length} Production Apps',
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                    color: Color(0xFFCBB6FF),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        // Archive Header
                        Padding(
                          padding: const EdgeInsets.fromLTRB(24, 16, 24, 24),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Eyebrow
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 10,
                                  vertical: 5,
                                ),
                                decoration: BoxDecoration(
                                  color: kPurple.withValues(alpha: 0.15),
                                  borderRadius: BorderRadius.circular(99),
                                ),
                                child: const Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      Icons.auto_awesome_rounded,
                                      size: 12,
                                      color: kPurple,
                                    ),
                                    SizedBox(width: 6),
                                    Text(
                                      'COMPLETE ARCHIVE',
                                      style: TextStyle(
                                        fontSize: 9,
                                        letterSpacing: 1.3,
                                        fontWeight: FontWeight.w800,
                                        color: Color(0xFFCBB6FF),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 12),
                              // Title
                              Text.rich(
                                TextSpan(
                                  children: [
                                    const TextSpan(text: 'All Mobile '),
                                    TextSpan(
                                      text: 'Applications',
                                      style: TextStyle(
                                        foreground: Paint()
                                          ..shader = const LinearGradient(
                                            colors: [kPurple, kCyan],
                                          ).createShader(
                                            const Rect.fromLTWH(0, 0, 300, 40),
                                          ),
                                      ),
                                    ),
                                  ],
                                ),
                                style: const TextStyle(
                                  fontSize: 32,
                                  fontWeight: FontWeight.w900,
                                  letterSpacing: -0.8,
                                ),
                              ),
                              const SizedBox(height: 8),
                              const Text(
                                'A comprehensive showcase of 15+ production mobile applications shipped across fintech, government services, enterprise POS, and consumer platforms.',
                                style: TextStyle(
                                  color: kMuted,
                                  fontSize: 14,
                                  height: 1.5,
                                ),
                              ),
                              const SizedBox(height: 22),

                              // Interactive Filter Chips
                              Wrap(
                                spacing: 8,
                                runSpacing: 8,
                                children: [
                                  _buildFilterChip('All', allProjects.length),
                                  _buildFilterChip('Fintech & Gov', fintechGovCount),
                                  _buildFilterChip('Enterprise & POS', posCount),
                                  _buildFilterChip(
                                    'Consumer & Lifestyle',
                                    consumerCount,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                        // Project Grid
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          child: LayoutBuilder(
                            builder: (context, c) {
                              final count = c.maxWidth > 1120
                                  ? 3
                                  : c.maxWidth > 680
                                      ? 2
                                      : 1;

                              return GridView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: displayedProjects.length,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: count,
                                  crossAxisSpacing: 16,
                                  mainAxisSpacing: 16,
                                  childAspectRatio: count == 1
                                      ? 2.5
                                      : count == 2
                                          ? 2.05
                                          : 1.88,
                                ),
                                itemBuilder: (context, index) {
                                  final p = displayedProjects[index];
                                  return FeaturedProjectCard(
                                    title: p.title,
                                    badge: p.badge,
                                    badgeColor: p.badgeColor,
                                    description: p.description,
                                    imageAsset: p.imageAsset,
                                    logoAsset: p.logoAsset,
                                    fallbackIcon: p.fallbackIcon,
                                    accentColor: p.accentColor,
                                    onCaseStudy: () => showCaseStudyModal(
                                      context: context,
                                      title: p.modalTitle,
                                      category: p.modalCategory,
                                      imageAsset: p.imageAsset,
                                      logoAsset: p.logoAsset,
                                      description: p.modalDescription,
                                      technologies: p.technologies,
                                      fallbackIcon: p.fallbackIcon,
                                      accentColor: p.accentColor,
                                      playStoreUrl: p.playStoreUrl,
                                      appStoreUrl: p.appStoreUrl,
                                      companyName: p.companyName,
                                      companyUrl: p.companyUrl,
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),

                        const SizedBox(height: 48),
                        const FooterSection(),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildFilterChip(String label, int count) {
    final isSelected = _selectedCategory == label;
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => setState(() => _selectedCategory = label),
        borderRadius: BorderRadius.circular(99),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
          decoration: BoxDecoration(
            color: isSelected
                ? kPurple.withValues(alpha: 0.22)
                : kPanel.withValues(alpha: 0.6),
            borderRadius: BorderRadius.circular(99),
            border: Border.all(
              color: isSelected
                  ? kPurple.withValues(alpha: 0.8)
                  : Colors.white.withValues(alpha: 0.08),
              width: isSelected ? 1.4 : 1.0,
            ),
            boxShadow: isSelected
                ? [
                    BoxShadow(
                      color: kPurple.withValues(alpha: 0.25),
                      blurRadius: 10,
                      offset: const Offset(0, 2),
                    ),
                  ]
                : null,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: isSelected ? FontWeight.w800 : FontWeight.w600,
                  color: isSelected ? kWhite : kMuted,
                ),
              ),
              const SizedBox(width: 7),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 6,
                  vertical: 1.5,
                ),
                decoration: BoxDecoration(
                  color: isSelected
                      ? kPurple
                      : Colors.white.withValues(alpha: 0.08),
                  borderRadius: BorderRadius.circular(99),
                ),
                child: Text(
                  '$count',
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w800,
                    color: isSelected ? Colors.white : kMuted,
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
