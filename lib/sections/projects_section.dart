import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';
import '../data/projects_data.dart';
import '../models/project_model.dart';
import '../pages/all_projects_page.dart';
import '../widgets/case_study_modal.dart';
import '../widgets/featured_project_card.dart';

// ---------------------------------------------------------------------------
// Featured Projects Section (Home Page: 4 Flagship Projects + View All Button)
// ---------------------------------------------------------------------------
class ProjectsSection extends StatefulWidget {
  const ProjectsSection({super.key});

  @override
  State<ProjectsSection> createState() => _ProjectsSectionState();
}

class _ProjectsSectionState extends State<ProjectsSection> {
  bool _isViewAllHovered = false;

  void _openAllProjects(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => const AllProjectsPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    final displayedProjects = featuredProjects;
    final totalProjectsCount = portfolioProjects.length;

    return Container(
      padding: const EdgeInsets.fromLTRB(24, 32, 24, 40),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(color: Colors.white.withValues(alpha: 0.06)),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Eyebrow & Top "View All" Link
          Row(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: kPurple.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(99),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.auto_awesome_rounded, size: 12, color: kPurple),
                    SizedBox(width: 6),
                    Text(
                      'FEATURED PROJECTS',
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
              const Spacer(),
              // Top quick link to All Projects
              InkWell(
                onTap: () => _openAllProjects(context),
                borderRadius: BorderRadius.circular(8),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'View All ($totalProjectsCount)',
                        style: const TextStyle(
                          color: kCyan,
                          fontSize: 12.5,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(width: 4),
                      const Icon(
                        Icons.arrow_forward_rounded,
                        size: 14,
                        color: kCyan,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),

          // Heading
          const Text.rich(
            TextSpan(
              children: [
                TextSpan(text: 'Products That Create '),
                TextSpan(
                  text: 'Real Impact',
                  style: TextStyle(color: Color(0xFFB495FF)),
                ),
              ],
            ),
            style: TextStyle(fontSize: 27, fontWeight: FontWeight.w900),
          ),
          const SizedBox(height: 6),
          Text(
            'Flagship production mobile applications built and shipped across fintech, government services, GIS mapping, and social networking. Showing 4 featured of $totalProjectsCount total apps.',
            style: const TextStyle(color: kMuted, fontSize: 13),
          ),
          const SizedBox(height: 24),

          // 4 Projects (Desktop: Single Row of 4 cards, Tablet: 2x2, Mobile: 1-col)
          LayoutBuilder(
            builder: (context, c) {
              final isDesktop = c.maxWidth >= 960;
              final isTablet = c.maxWidth >= 600 && c.maxWidth < 960;

              if (isDesktop) {
                return SizedBox(
                  height: 195,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      for (int i = 0; i < displayedProjects.length; i++) ...[
                        if (i > 0) const SizedBox(width: 14),
                        Expanded(
                          child: _buildProjectCard(context, displayedProjects[i]),
                        ),
                      ],
                    ],
                  ),
                );
              }

              final count = isTablet ? 2 : 1;
              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: displayedProjects.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: count,
                  crossAxisSpacing: 14,
                  mainAxisSpacing: 14,
                  childAspectRatio: count == 1 ? 2.3 : 1.75,
                ),
                itemBuilder: (context, index) =>
                    _buildProjectCard(context, displayedProjects[index]),
              );
            },
          ),
          const SizedBox(height: 28),

          // Bottom Action: View All Projects (15+ Apps) Button
          Center(
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              onEnter: (_) => setState(() => _isViewAllHovered = true),
              onExit: (_) => setState(() => _isViewAllHovered = false),
              child: GestureDetector(
                onTap: () => _openAllProjects(context),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 15),
                  decoration: BoxDecoration(
                    color: _isViewAllHovered ? kPanelAlt : kPanelCard,
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                      color: _isViewAllHovered
                          ? kPurple.withValues(alpha: 0.8)
                          : Colors.white.withValues(alpha: 0.12),
                      width: 1.3,
                    ),
                    boxShadow: _isViewAllHovered
                        ? [
                            BoxShadow(
                              color: kPurple.withValues(alpha: 0.25),
                              blurRadius: 18,
                              offset: const Offset(0, 4),
                            ),
                          ]
                        : null,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: kPurple.withValues(alpha: 0.2),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(
                          Icons.grid_view_rounded,
                          size: 16,
                          color: Color(0xFFCBB6FF),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Text(
                        'View All Projects ($totalProjectsCount Apps Archive)',
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w800,
                          color: kWhite,
                          letterSpacing: -0.2,
                        ),
                      ),
                      const SizedBox(width: 10),
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        transform: Matrix4.translationValues(
                          _isViewAllHovered ? 4 : 0,
                          0,
                          0,
                        ),
                        child: const Icon(
                          Icons.arrow_forward_rounded,
                          size: 16,
                          color: kCyan,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProjectCard(BuildContext context, ProjectModel p) {
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
  }
}
