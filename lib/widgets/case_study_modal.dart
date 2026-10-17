import 'package:flutter/material.dart';
import '../core/constants/portfolio_links.dart';
import '../core/theme/app_colors.dart';

void showCaseStudyModal({
  required BuildContext context,
  required String title,
  required String category,
  required String description,
  required List<String> technologies,
  String? imageAsset,
  String? logoAsset,
  IconData? fallbackIcon,
  Color? accentColor,
  Uri? playStoreUrl,
  Uri? appStoreUrl,
  String? companyName,
  Uri? companyUrl,
}) {
  showGeneralDialog<void>(
    context: context,
    barrierDismissible: true,
    barrierLabel: 'Close Case Study',
    barrierColor: Colors.black.withValues(alpha: 0.72),
    transitionDuration: const Duration(milliseconds: 300),
    transitionBuilder: (context, anim, secondaryAnim, child) {
      final curved = CurvedAnimation(parent: anim, curve: Curves.easeOutBack);
      return ScaleTransition(
        scale: Tween<double>(begin: 0.88, end: 1.0).animate(curved),
        child: FadeTransition(
          opacity: anim,
          child: child,
        ),
      );
    },
    pageBuilder: (context, anim, secondaryAnim) {
      final effectiveColor = accentColor ?? kCyan;
      final screenSize = MediaQuery.sizeOf(context);
      final isMobile = screenSize.width < 600;
      final imageWidth = (screenSize.width - 96).clamp(180.0, 250.0);
      final imageHeight = imageWidth * (16 / 9);

      return AlertDialog(
        backgroundColor: kPanelAlt,
        surfaceTintColor: Colors.transparent,
        insetPadding: EdgeInsets.symmetric(
          horizontal: isMobile ? 14 : 32,
          vertical: isMobile ? 16 : 28,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(22),
          side: BorderSide(color: Colors.white.withValues(alpha: 0.12)),
        ),
        title: Row(
          children: [
            Container(
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: kPanel,
                border: Border.all(
                  color: effectiveColor.withValues(alpha: 0.35),
                  width: 1.2,
                ),
                boxShadow: [
                  BoxShadow(
                    color: effectiveColor.withValues(alpha: 0.25),
                    blurRadius: 10,
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(11),
                child: (logoAsset != null && logoAsset.isNotEmpty)
                    ? Image.asset(
                        logoAsset,
                        fit: BoxFit.cover,
                        cacheWidth: 100,
                        cacheHeight: 100,
                        filterQuality: FilterQuality.low,
                        errorBuilder: (_, __, ___) => Icon(
                          fallbackIcon ?? Icons.rocket_launch_rounded,
                          color: effectiveColor,
                          size: 22,
                        ),
                      )
                    : Icon(
                        fallbackIcon ?? Icons.rocket_launch_rounded,
                        color: effectiveColor,
                        size: 22,
                      ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w800)),
                  Text(category, style: TextStyle(fontSize: 11, color: effectiveColor)),
                  if (companyName != null) ...[
                    const SizedBox(height: 3),
                    InkWell(
                      onTap: companyUrl != null ? () => PortfolioLinks.open(companyUrl) : null,
                      borderRadius: BorderRadius.circular(4),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(Icons.business_rounded, size: 11, color: kMuted),
                          const SizedBox(width: 4),
                          Text(
                            companyName,
                            style: TextStyle(
                              fontSize: 11,
                              color: companyUrl != null ? kCyan : kMutedLight,
                              fontWeight: FontWeight.w500,
                              decoration: companyUrl != null ? TextDecoration.underline : null,
                              decorationColor: companyUrl != null ? kCyan.withValues(alpha: 0.5) : null,
                            ),
                          ),
                          if (companyUrl != null) ...[
                            const SizedBox(width: 3),
                            const Icon(Icons.open_in_new_rounded, size: 9, color: kCyan),
                          ],
                        ],
                      ),
                    ),
                  ],
                ],
              ),
            ),
            IconButton(
              icon: const Icon(Icons.close_rounded, size: 20),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        ),
        content: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: isMobile ? screenSize.width * 0.94 : 640,
            maxHeight: screenSize.height * 0.80,
          ),
          child: SingleChildScrollView(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (imageAsset != null && imageAsset.isNotEmpty) ...[
                    Center(
                      child: Container(
                        width: imageWidth,
                        height: imageHeight,
                        margin: const EdgeInsets.only(bottom: 20),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(18),
                          boxShadow: [
                            BoxShadow(
                              color: effectiveColor.withValues(alpha: 0.25),
                              blurRadius: 24,
                              spreadRadius: 1,
                              offset: const Offset(0, 6),
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(18),
                          child: Image.asset(
                            imageAsset,
                            fit: BoxFit.contain,
                            cacheWidth: 500,
                            cacheHeight: 880,
                            filterQuality: FilterQuality.low,
                          ),
                        ),
                      ),
                    ),
                  ] else if (fallbackIcon != null) ...[
                  Center(
                    child: Container(
                      width: 76,
                      height: 76,
                      margin: const EdgeInsets.only(bottom: 16),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: effectiveColor.withValues(alpha: 0.15),
                        border: Border.all(
                          color: effectiveColor.withValues(alpha: 0.45),
                          width: 1.5,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: effectiveColor.withValues(alpha: 0.25),
                            blurRadius: 18,
                          ),
                        ],
                      ),
                      child: Center(
                        child: Icon(
                          fallbackIcon,
                          size: 38,
                          color: effectiveColor,
                        ),
                      ),
                    ),
                  ),
                ],
                Text(
                  description,
                  style: const TextStyle(color: kMutedLight, height: 1.6, fontSize: 13),
                ),
                const SizedBox(height: 18),
                const Text(
                  'Key Technologies & Architecture',
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 10),
                Wrap(
                  spacing: 6,
                  runSpacing: 6,
                  children: technologies.map((tech) {
                    return Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      decoration: BoxDecoration(
                        color: kPanel,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.white.withValues(alpha: 0.08)),
                      ),
                      child: Text(
                        tech,
                        style: const TextStyle(fontSize: 11, color: kCyan),
                      ),
                    );
                  }).toList(),
                ),
                if (playStoreUrl != null || appStoreUrl != null || companyUrl != null) ...[
                  const SizedBox(height: 22),
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: [
                      if (playStoreUrl != null)
                        ElevatedButton.icon(
                          onPressed: () => PortfolioLinks.open(playStoreUrl),
                          icon: const Icon(Icons.shop_rounded, size: 16),
                          label: const Text('Google Play Store'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF01875F),
                            foregroundColor: Colors.white,
                            textStyle: const TextStyle(fontSize: 11, fontWeight: FontWeight.w700),
                          ),
                        ),
                      if (appStoreUrl != null)
                        ElevatedButton.icon(
                          onPressed: () => PortfolioLinks.open(appStoreUrl),
                          icon: const Icon(Icons.apple_rounded, size: 16),
                          label: const Text('Apple App Store'),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF1F2937),
                            foregroundColor: Colors.white,
                            textStyle: const TextStyle(fontSize: 11, fontWeight: FontWeight.w700),
                          ),
                        ),
                      if (companyUrl != null)
                        ElevatedButton.icon(
                          onPressed: () => PortfolioLinks.open(companyUrl),
                          icon: const Icon(Icons.language_rounded, size: 16),
                          label: Text(
                            companyName != null ? 'Visit $companyName' : 'Company Website',
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF4F46E5),
                            foregroundColor: Colors.white,
                            textStyle: const TextStyle(fontSize: 11, fontWeight: FontWeight.w700),
                          ),
                        ),
                    ],
                  ),
                ],
              ],
            ),
          ),
        ),
        actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Close', style: TextStyle(color: kMuted)),
        ),
      ],
    );
    },
  );
}
