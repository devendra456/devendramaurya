import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../core/constants/portfolio_links.dart';
import '../core/theme/app_colors.dart';
import '../widgets/case_study_modal.dart';
import '../widgets/hero_stat_card.dart';
import '../widgets/pulsing_status_dot.dart';

// ---------------------------------------------------------------------------
// Hero Section
// ---------------------------------------------------------------------------
class HeroSection extends StatelessWidget {
  const HeroSection({
    super.key,
    required this.floatAnim,
    required this.onNavigate,
  });

  final Animation<double> floatAnim;
  final void Function(String section) onNavigate;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 16, 24, 40),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final isNarrow = constraints.maxWidth < 980;

          final leftContent = Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Pill: OPEN TO OPPORTUNITIES
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 7),
                decoration: BoxDecoration(
                  color: kPanel.withValues(alpha: 0.85),
                  borderRadius: BorderRadius.circular(99),
                  border: Border.all(color: kGreen.withValues(alpha: 0.4), width: 1.1),
                  boxShadow: [
                    BoxShadow(
                      color: kGreen.withValues(alpha: 0.12),
                      blurRadius: 12,
                    ),
                  ],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const PulsingStatusDot(color: kGreen, size: 7),
                    const SizedBox(width: 8),
                    const Text(
                      'OPEN TO OPPORTUNITIES',
                      style: TextStyle(
                        fontSize: 10,
                        letterSpacing: 1.3,
                        fontWeight: FontWeight.w800,
                        color: Color(0xFFC7F3DC),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 22),
              // Main Headline with Real Impact gradient
              Text.rich(
                TextSpan(
                  children: [
                    const TextSpan(text: 'Flutter Developer\nBuilding '),
                    TextSpan(
                      text: 'Real Impact',
                      style: TextStyle(
                        foreground: Paint()
                          ..shader = const LinearGradient(
                            colors: [kBlue, kPurple, Color(0xFFF375DB)],
                          ).createShader(const Rect.fromLTWH(0, 0, 360, 70)),
                      ),
                    ),
                  ],
                ),
                style: const TextStyle(
                  fontSize: 50,
                  height: 1.12,
                  fontWeight: FontWeight.w900,
                  letterSpacing: -1.8,
                ),
              ),
              const SizedBox(height: 18),
              // Subtitle
              const Text(
                'SDE 2 with 5+ years of experience building high-performance '
                'mobile applications across fintech, government services, '
                'and consumer products.',
                style: TextStyle(
                  color: kMuted,
                  fontSize: 15,
                  height: 1.6,
                ),
              ),
              const SizedBox(height: 26),
              // Action Buttons
              Wrap(
                spacing: 12,
                runSpacing: 12,
                children: [
                  // Let's Work Together
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(999),
                      gradient: const LinearGradient(
                        colors: [Color(0xFF386BF6), Color(0xFF1B40BD)],
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: kBlue.withValues(alpha: 0.35),
                          blurRadius: 20,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),
                    child: ElevatedButton.icon(
                      onPressed: () => onNavigate('Contact'),
                      iconAlignment: IconAlignment.end,
                      icon: const Icon(Icons.arrow_forward_rounded, size: 16),
                      label: const Text("Let's Work Together"),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal: 22, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(999),
                        ),
                        textStyle: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  // View My Work
                  OutlinedButton.icon(
                    onPressed: () => onNavigate('Projects'),
                    icon: const Icon(Icons.play_circle_outline_rounded, size: 18, color: kCyan),
                    label: const Text('View My Work'),
                    style: OutlinedButton.styleFrom(
                      foregroundColor: kWhite,
                      side: BorderSide(color: Colors.white.withValues(alpha: 0.16), width: 1.2),
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(999),
                      ),
                      textStyle: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              // 4 Metrics Cards row
              const Wrap(
                spacing: 12,
                runSpacing: 12,
                children: [
                  HeroStatCard(value: '5+', label: 'Years Experience'),
                  HeroStatCard(value: '30+', label: 'Apps Delivered'),
                  HeroStatCard(value: '1M+', label: 'Users Served'),
                  HeroStatCard(value: '10+', label: 'Domain Experience'),
                ],
              ),
            ],
          );

          // Hero Visual Right: 3D Floating Mockups
          final rightVisual = _buildHeroVisualShowcase(context);

          if (isNarrow) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                leftContent,
                const SizedBox(height: 32),
                rightVisual,
              ],
            );
          }

          return Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(flex: 5, child: leftContent),
              const SizedBox(width: 24),
              Expanded(flex: 6, child: rightVisual),
            ],
          );
        },
      ),
    );
  }

  Widget _buildHeroVisualShowcase(BuildContext context) {
    return AnimatedBuilder(
      animation: floatAnim,
      builder: (context, _) {
        final float1 = (floatAnim.value - 0.5) * 10.0;
        final float2 = (0.5 - floatAnim.value) * 12.0;

        return Center(
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: SizedBox(
              width: 630,
              height: 450,
              child: Stack(
                alignment: Alignment.center,
                clipBehavior: Clip.none,
                children: [
                  // 1. Cosmic Glow Aura & Radial Gradient Rings
                  Positioned(
                    left: 65,
                    top: 25,
                    child: Container(
                      width: 500,
                      height: 400,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: RadialGradient(
                          colors: [
                            kPurple.withValues(alpha: 0.38),
                            kBlue.withValues(alpha: 0.18),
                            kCyan.withValues(alpha: 0.08),
                            Colors.transparent,
                          ],
                          stops: const [0.0, 0.45, 0.7, 1.0],
                        ),
                      ),
                    ),
                  ),

                  // 2. Cosmic Circular Ring Accents
                  Positioned(
                    left: 115,
                    top: 45,
                    child: Container(
                      width: 400,
                      height: 360,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: kCyan.withValues(alpha: 0.12),
                          width: 1.2,
                        ),
                      ),
                    ),
                  ),

                  // 3. Floating Phone 1 (Leftmost): The Card Co (Fintech & Banking)
                  Positioned(
                    left: 8,
                    top: 60 + float1,
                    child: Transform.rotate(
                      angle: -0.11,
                      child: _buildFloatingPhoneCard(
                        imageAsset: 'assets/images/mockup_thecardco.png',
                        accentColor: kPurple,
                        appName: 'The Card Co.',
                        appTag: '✦ Fintech & UPI',
                        width: 148,
                        height: 300,
                        onTap: () => showCaseStudyModal(
                          context: context,
                          title: 'The Card Co.',
                          category: 'Fintech & Digital Banking',
                          imageAsset: 'assets/images/mockup_thecardco.png',
                          logoAsset: 'assets/images/logo_thecardco.png',
                          description:
                              'The Card Company is an RBI-licensed digital wallet designed for families '
                              'and individuals to manage spending, pay bills, and earn Gold Coin rewards. '
                              'Engineered with high security, RBI & PCI-DSS compliance, banking APIs, '
                              'and seamless UPI rails.',
                          technologies: const [
                            'Flutter',
                            'Dart',
                            'Bloc',
                            'UPI Integration',
                            'Firebase',
                            'PCI-DSS Compliance',
                            'Biometric Security',
                          ],
                          playStoreUrl: PortfolioLinks.theCardCoAndroid,
                          appStoreUrl: PortfolioLinks.theCardCoiOS,
                          companyName: 'The Card Company',
                          companyUrl: PortfolioLinks.theCardCompany,
                        ),
                      ),
                    ),
                  ),

                  // 4. Floating Phone 2 (Center-Left): Mera Ration (Gov Food Security)
                  Positioned(
                    left: 148,
                    top: 25 + float2,
                    child: Transform.rotate(
                      angle: -0.035,
                      child: _buildFloatingPhoneCard(
                        imageAsset: 'assets/images/mockup_meraration.png',
                        accentColor: const Color(0xFF4880FF),
                        appName: 'Mera Ration',
                        appTag: '✦ 1M+ Beneficiaries',
                        width: 160,
                        height: 325,
                        onTap: () => showCaseStudyModal(
                          context: context,
                          title: 'Mera Ration App',
                          category: 'Government & Public Services',
                          imageAsset: 'assets/images/mockup_meraration.png',
                          logoAsset: 'assets/images/logo_meraration.png',
                          description:
                              'Developed a government-integrated application under the One Nation One '
                              'Ration Card initiative under NFSA, enabling beneficiaries to access '
                              'subsidized food grains from Fair Price Shops nationwide via Aadhaar-based '
                              'biometric authentication.',
                          technologies: const [
                            'Flutter',
                            'Android Native',
                            'Aadhaar Biometric Auth',
                            'ePoS Devices',
                            'Secure REST APIs',
                            'Encryption',
                          ],
                          playStoreUrl: PortfolioLinks.meraRationAndroid,
                          appStoreUrl: PortfolioLinks.meraRationiOS,
                          companyName: 'RV Solutions Pvt. Ltd.',
                          companyUrl: PortfolioLinks.rvSolutions,
                        ),
                      ),
                    ),
                  ),

                  // 5. Floating Phone 3 (Center-Right): Mate (Social & Realtime Matching)
                  Positioned(
                    left: 300,
                    top: 15 + float1,
                    child: Transform.rotate(
                      angle: 0.04,
                      child: _buildFloatingPhoneCard(
                        imageAsset: 'assets/images/mockup_mate.png',
                        accentColor: kPink,
                        appName: 'Mate Social',
                        appTag: '✦ Realtime Match',
                        width: 168,
                        height: 340,
                        onTap: () => showCaseStudyModal(
                          context: context,
                          title: 'Mate - Dating & Social Platform',
                          category: 'Consumer & Real-time Social',
                          imageAsset: 'assets/images/mockup_mate.png',
                          logoAsset: 'assets/images/logo_mate.png',
                          description:
                              'Interactive dating and social discovery application with real-time '
                              'swipe matching, in-app messaging, FCM push notifications, dynamic '
                              'profile customization, and low-latency chat.',
                          technologies: const [
                            'Flutter',
                            'Firebase Firestore',
                            'FCM Notifications',
                            'WebSockets',
                            'Swipe Animations',
                          ],
                          playStoreUrl: PortfolioLinks.mateAndroid,
                          companyName: 'Skyview Smart Solutions',
                          companyUrl: PortfolioLinks.skyviewAds,
                        ),
                      ),
                    ),
                  ),

                  // 6. Floating Phone 4 (Rightmost): MAUSAM (Weather & GIS Radar)
                  Positioned(
                    left: 462,
                    top: 55 + float2,
                    child: Transform.rotate(
                      angle: 0.11,
                      child: _buildFloatingPhoneCard(
                        imageAsset: 'assets/images/mockup_mausam.png',
                        accentColor: kCyan,
                        appName: 'MAUSAM Radar',
                        appTag: '✦ Live Meteorology',
                        width: 148,
                        height: 300,
                        onTap: () => showCaseStudyModal(
                          context: context,
                          title: 'MAUSAM - Weather & Radar',
                          category: 'GIS & Meteorology',
                          imageAsset: 'assets/images/mockup_mausam.png',
                          logoAsset: 'assets/images/logo_mausam.png',
                          description:
                              'A dedicated mobile application for weather observation and geospatial '
                              'radar forecasts in collaboration with meteorological services. Features '
                              'high-resolution radar maps, satellite overlays, and district-level warnings.',
                          technologies: const [
                            'Flutter',
                            'Leaflet',
                            'GIS Maps',
                            'Radar Layering',
                            'REST APIs',
                            'Caching',
                          ],
                          playStoreUrl: PortfolioLinks.mausamAndroid,
                          appStoreUrl: PortfolioLinks.mausamiOS,
                          companyName: 'RV Solutions Pvt. Ltd.',
                          companyUrl: PortfolioLinks.rvSolutions,
                        ),
                      ),
                    ),
                  ),

                  // 7. Neon Script Badge (Top Right)
                  Positioned(
                    top: 0,
                    right: 8,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                      decoration: BoxDecoration(
                        color: kPanel.withValues(alpha: 0.88),
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(
                          color: kPink.withValues(alpha: 0.45),
                          width: 1,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: kPink.withValues(alpha: 0.25),
                            blurRadius: 16,
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            'Featured Screenshots',
                            style: GoogleFonts.caveat(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFFFF8ECF),
                            ),
                          ),
                          Text(
                            'Production Mobile Apps',
                            style: GoogleFonts.caveat(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                              color: const Color(0xFFFFB6E1),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // 8. Interactive Hint Chip (Bottom Center)
                  Positioned(
                    bottom: 0,
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                      decoration: BoxDecoration(
                        color: kPanelCard.withValues(alpha: 0.92),
                        borderRadius: BorderRadius.circular(99),
                        border: Border.all(
                          color: Colors.white.withValues(alpha: 0.12),
                          width: 1,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.4),
                            blurRadius: 12,
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 6,
                            height: 6,
                            decoration: const BoxDecoration(
                              color: kCyan,
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            'Tap any screenshot to explore project details',
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                              color: kMutedLight.withValues(alpha: 0.9),
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
      },
    );
  }

  Widget _buildFloatingPhoneCard({
    required String imageAsset,
    required Color accentColor,
    required double width,
    required double height,
    required String appName,
    required String appTag,
    VoidCallback? onTap,
  }) {
    return _FloatingHeroPhoneCard(
      imageAsset: imageAsset,
      accentColor: accentColor,
      width: width,
      height: height,
      appName: appName,
      appTag: appTag,
      onTap: onTap,
    );
  }
}

class _FloatingHeroPhoneCard extends StatefulWidget {
  const _FloatingHeroPhoneCard({
    required this.imageAsset,
    required this.accentColor,
    required this.width,
    required this.height,
    required this.appName,
    required this.appTag,
    this.onTap,
  });

  final String imageAsset;
  final Color accentColor;
  final double width;
  final double height;
  final String appName;
  final String appTag;
  final VoidCallback? onTap;

  @override
  State<_FloatingHeroPhoneCard> createState() => _FloatingHeroPhoneCardState();
}

class _FloatingHeroPhoneCardState extends State<_FloatingHeroPhoneCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedScale(
        scale: _isHovered ? 1.05 : 1.0,
        duration: const Duration(milliseconds: 240),
        curve: Curves.easeOutCubic,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: widget.onTap,
            borderRadius: BorderRadius.circular(24),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 240),
              curve: Curves.easeOutCubic,
              width: widget.width,
              height: widget.height,
              decoration: BoxDecoration(
                color: const Color(0xFF0F172A),
                borderRadius: BorderRadius.circular(24),
                border: Border.all(
                  color: _isHovered
                      ? widget.accentColor.withValues(alpha: 0.9)
                      : widget.accentColor.withValues(alpha: 0.5),
                  width: _isHovered ? 1.8 : 1.5,
                ),
                boxShadow: [
                  BoxShadow(
                    color: widget.accentColor.withValues(alpha: _isHovered ? 0.6 : 0.35),
                    blurRadius: _isHovered ? 32 : 24,
                    spreadRadius: _isHovered ? 2 : 1,
                  ),
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.65),
                    blurRadius: 20,
                    offset: const Offset(0, 12),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(22),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.asset(
                      widget.imageAsset,
                      fit: BoxFit.cover,
                      cacheWidth: 320,
                      filterQuality: FilterQuality.low,
                    ),
                    // Shimmer light sweep on hover
                    AnimatedOpacity(
                      duration: const Duration(milliseconds: 300),
                      opacity: _isHovered ? 1.0 : 0.0,
                      child: IgnorePointer(
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              stops: const [0.0, 0.45, 0.55, 1.0],
                              colors: [
                                Colors.transparent,
                                Colors.white.withValues(alpha: 0.15),
                                Colors.white.withValues(alpha: 0.35),
                                Colors.transparent,
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              Colors.transparent,
                              const Color(0xFF070B18).withValues(alpha: 0.95),
                            ],
                          ),
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              widget.appName,
                              style: const TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w800,
                                color: Colors.white,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 1),
                            Text(
                              widget.appTag,
                              style: TextStyle(
                                fontSize: 9,
                                fontWeight: FontWeight.w700,
                                color: widget.accentColor,
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
