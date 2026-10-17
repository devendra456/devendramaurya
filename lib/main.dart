import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'core/theme/app_colors.dart';
import 'sections/cta_banner_section.dart';
import 'sections/education_section.dart';
import 'sections/footer_section.dart';
import 'sections/hero_section.dart';
import 'sections/journey_skills_awards_section.dart';
import 'sections/nav_bar.dart';
import 'sections/projects_section.dart';
import 'widgets/ambient_background.dart';
import 'widgets/scroll_to_top_button.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const DevendraPortfolioApp());
}

// ---------------------------------------------------------------------------
// Root Application
// ---------------------------------------------------------------------------
class DevendraPortfolioApp extends StatelessWidget {
  const DevendraPortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = GoogleFonts.plusJakartaSansTextTheme(
      ThemeData.dark().textTheme,
    );

    return MaterialApp(
      title: 'Devendra Maurya | Flutter Developer',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: kBg,
        colorScheme: ColorScheme.fromSeed(
          seedColor: kPurple,
          brightness: Brightness.dark,
          surface: kPanel,
        ),
        textTheme: textTheme.apply(
          bodyColor: kWhite,
          displayColor: kWhite,
        ),
        useMaterial3: true,
      ),
      home: const PortfolioHome(),
    );
  }
}

// ---------------------------------------------------------------------------
// Main Portfolio Page
// ---------------------------------------------------------------------------
class PortfolioHome extends StatefulWidget {
  const PortfolioHome({super.key});

  @override
  State<PortfolioHome> createState() => _PortfolioHomeState();
}

class _PortfolioHomeState extends State<PortfolioHome>
    with TickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final Map<String, GlobalKey> _sectionKeys = {
    'Home': GlobalKey(),
    'About': GlobalKey(),
    'Projects': GlobalKey(),
    'Experience': GlobalKey(),
    'Education': GlobalKey(),
    'Skills': GlobalKey(),
    'Awards': GlobalKey(),
    'Contact': GlobalKey(),
  };

  late final AnimationController _glowAnim = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 8),
  )..repeat(reverse: true);

  late final AnimationController _floatAnim = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 4),
  )..repeat(reverse: true);

  void _scrollTo(String sectionName) {
    if (sectionName == 'About') {
      sectionName = 'Home';
    } else if (sectionName == 'Skills' || sectionName == 'Awards') {
      sectionName = 'Experience';
    }
    final key = _sectionKeys[sectionName];
    final ctx = key?.currentContext;
    if (ctx != null) {
      Scrollable.ensureVisible(
        ctx,
        duration: const Duration(milliseconds: 700),
        curve: Curves.easeInOutCubic,
        alignment: 0.03,
      );
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _glowAnim.dispose();
    _floatAnim.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: kBg,
      endDrawer: MobileDrawer(onNavigate: _scrollTo),
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
          // Main Scrollable Content
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
                        NavBar(
                          onNavigate: _scrollTo,
                          onOpenDrawer: () =>
                              _scaffoldKey.currentState?.openEndDrawer(),
                        ),
                        Container(
                          key: _sectionKeys['Home'],
                          child: HeroSection(
                            floatAnim: _floatAnim,
                            onNavigate: _scrollTo,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Container(
                          key: _sectionKeys['Projects'],
                          child: const ProjectsSection(),
                        ),
                        const SizedBox(height: 30),
                        Container(
                          key: _sectionKeys['Experience'],
                          child: const JourneySkillsAwardsSection(),
                        ),
                        const SizedBox(height: 36),
                        Container(
                          key: _sectionKeys['Education'],
                          child: const EducationSection(),
                        ),
                        const SizedBox(height: 40),
                        Container(
                          key: _sectionKeys['Contact'],
                          child: const CtaBannerSection(),
                        ),
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
}
