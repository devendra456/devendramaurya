import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../core/constants/portfolio_links.dart';
import '../core/theme/app_colors.dart';
import '../widgets/profile_photo_dialog.dart';
import '../widgets/pulsing_status_dot.dart';

// ---------------------------------------------------------------------------
// Navigation Bar
// ---------------------------------------------------------------------------
class NavBar extends StatelessWidget {
  const NavBar({
    super.key,
    required this.onNavigate,
    required this.onOpenDrawer,
  });

  final void Function(String section) onNavigate;
  final VoidCallback onOpenDrawer;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isCompact = constraints.maxWidth < 1080;
        final isMobile = constraints.maxWidth < 600;
        final isNarrow = constraints.maxWidth < 430;
        final isVeryNarrow = constraints.maxWidth < 360;

        final horizontalPadding = isVeryNarrow ? 12.0 : (isMobile ? 16.0 : 24.0);
        final verticalPadding = isMobile ? 14.0 : 20.0;
        final avatarSize = isMobile ? 38.0 : 44.0;
        final nameFontSize = isMobile ? (isVeryNarrow ? 15.0 : 17.0) : 20.0;

        return Padding(
          padding: EdgeInsets.symmetric(
            horizontal: horizontalPadding,
            vertical: verticalPadding,
          ),
          child: Row(
            children: [
              // Brand Logo & Name
              Expanded(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Tooltip(
                      message: 'View Photo',
                      child: InkWell(
                        borderRadius: BorderRadius.circular(999),
                        onTap: () => showProfilePhotoDialog(context),
                        child: Container(
                          width: avatarSize,
                          height: avatarSize,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: const LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [kCyan, kPurple],
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: kPurple.withValues(alpha: 0.45),
                                blurRadius: 12,
                                spreadRadius: 1,
                              ),
                              BoxShadow(
                                color: kCyan.withValues(alpha: 0.25),
                                blurRadius: 6,
                              ),
                            ],
                          ),
                          padding: const EdgeInsets.all(2.0),
                          child: ClipOval(
                            child: Image.asset(
                              'assets/images/devendra_portrait.png',
                              fit: BoxFit.cover,
                              alignment: Alignment.topCenter,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: isMobile ? 9 : 12),
                    Flexible(
                      child: InkWell(
                        onTap: () => onNavigate('Home'),
                        borderRadius: BorderRadius.circular(8),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 2),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                'Devendra Maurya',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: nameFontSize,
                                  letterSpacing: -0.5,
                                  color: kWhite,
                                ),
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  PulsingStatusDot(color: kGreen, size: isMobile ? 6 : 7),
                                  const SizedBox(width: 5),
                                  Flexible(
                                    child: Text(
                                      'Mobile App Specialist',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: isMobile ? 10.5 : 11,
                                        fontWeight: FontWeight.w600,
                                        color: kMutedLight.withValues(alpha: 0.85),
                                        letterSpacing: 0.2,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              if (!isCompact) ...[
                // Nav Links
                ...['Home', 'About', 'Projects', 'Experience', 'Education', 'Skills', 'Awards', 'Contact']
                    .map((item) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: TextButton(
                      onPressed: () => onNavigate(item),
                      style: TextButton.styleFrom(
                        foregroundColor: kMutedLight,
                        textStyle: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      child: Text(item),
                    ),
                  );
                }),
                const SizedBox(width: 14),
                // Download Resume Button
                const GlowingResumeButton(compact: false),
              ] else ...[
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (defaultTargetPlatform == TargetPlatform.android) ...[
                      IconButton(
                        tooltip: 'Call Devendra',
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(minWidth: 36, minHeight: 36),
                        onPressed: () => PortfolioLinks.open(PortfolioLinks.phone),
                        icon: Container(
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: const Color(0xFF10B981).withValues(alpha: 0.2),
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: const Color(0xFF10B981).withValues(alpha: 0.6),
                              width: 1.2,
                            ),
                          ),
                          child: const Icon(Icons.phone_in_talk_rounded, color: Color(0xFF10B981), size: 15),
                        ),
                      ),
                      const SizedBox(width: 4),
                    ],
                    GlowingResumeButton(
                      compact: true,
                      iconOnly: isNarrow ||
                          (defaultTargetPlatform == TargetPlatform.android &&
                              constraints.maxWidth < 470),
                    ),
                    const SizedBox(width: 4),
                    IconButton(
                      onPressed: onOpenDrawer,
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(minWidth: 40, minHeight: 40),
                      icon: const Icon(Icons.menu_rounded, color: kWhite, size: 26),
                    ),
                  ],
                ),
              ],
            ],
          ),
        );
      },
    );
  }
}

// ---------------------------------------------------------------------------
// Glowing Resume Button
// ---------------------------------------------------------------------------
class GlowingResumeButton extends StatelessWidget {
  const GlowingResumeButton({
    super.key,
    this.compact = false,
    this.iconOnly = false,
  });

  final bool compact;
  final bool iconOnly;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: iconOnly ? BoxShape.circle : BoxShape.rectangle,
        borderRadius: iconOnly ? null : BorderRadius.circular(999),
        gradient: const LinearGradient(
          colors: [Color(0xFF2856E3), Color(0xFF1B3172)],
        ),
        border: Border.all(color: kCyan.withValues(alpha: 0.45), width: 1.2),
        boxShadow: [
          BoxShadow(
            color: kBlue.withValues(alpha: 0.25),
            blurRadius: 14,
            spreadRadius: 1,
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          customBorder: iconOnly ? const CircleBorder() : const StadiumBorder(),
          onTap: () => PortfolioLinks.open(PortfolioLinks.resume),
          child: Tooltip(
            message: 'Download Resume',
            child: Padding(
              padding: iconOnly
                  ? const EdgeInsets.all(8)
                  : EdgeInsets.symmetric(
                      horizontal: compact ? 12 : 18,
                      vertical: compact ? 7 : 9,
                    ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.download_rounded, size: 15, color: kCyan),
                  if (!iconOnly) ...[
                    const SizedBox(width: 6),
                    Text(
                      compact ? 'Resume' : 'Download Resume',
                      style: TextStyle(
                        fontSize: compact ? 11.5 : 12,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        letterSpacing: 0.2,
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Mobile Navigation Drawer
// ---------------------------------------------------------------------------
class MobileDrawer extends StatelessWidget {
  const MobileDrawer({super.key, required this.onNavigate});

  final void Function(String section) onNavigate;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: kPanel,
      child: SafeArea(
        child: ListView(
          padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 20),
          children: [
            Row(
              children: [
                Tooltip(
                  message: 'View Photo',
                  child: InkWell(
                    borderRadius: BorderRadius.circular(999),
                    onTap: () => showProfilePhotoDialog(context),
                    child: Container(
                      width: 46,
                      height: 46,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: const LinearGradient(
                          colors: [kCyan, kPurple],
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: kPurple.withValues(alpha: 0.45),
                            blurRadius: 10,
                          ),
                        ],
                      ),
                      padding: const EdgeInsets.all(2),
                      child: ClipOval(
                        child: Image.asset(
                          'assets/images/devendra_portrait.png',
                          fit: BoxFit.cover,
                          alignment: Alignment.topCenter,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Devendra Maurya',
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 18,
                        letterSpacing: -0.5,
                      ),
                    ),
                    Text(
                      'Mobile App Specialist',
                      style: TextStyle(
                        fontSize: 11.5,
                        color: kCyan,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const Divider(color: Colors.white12, height: 36),
            ...['Home', 'About', 'Projects', 'Experience', 'Education', 'Skills', 'Awards', 'Contact']
                .map((item) {
              return ListTile(
                title: Text(item, style: const TextStyle(color: kMutedLight, fontSize: 15)),
                leading: const Icon(Icons.chevron_right_rounded, color: kCyan, size: 18),
                onTap: () {
                  Navigator.pop(context);
                  onNavigate(item);
                },
              );
            }),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: () => PortfolioLinks.open(PortfolioLinks.resume),
              icon: const Icon(Icons.download_rounded, size: 18),
              label: const Text('Download Resume'),
              style: ElevatedButton.styleFrom(
                backgroundColor: kBlue,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
            if (defaultTargetPlatform == TargetPlatform.android) ...[
              const SizedBox(height: 12),
              ElevatedButton.icon(
                onPressed: () => PortfolioLinks.open(PortfolioLinks.phone),
                icon: const Icon(Icons.phone_in_talk_rounded, size: 18),
                label: const Text('Call Devendra (+91 78974 30432)'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF10B981),
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
