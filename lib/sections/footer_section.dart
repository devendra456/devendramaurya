import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';

// ---------------------------------------------------------------------------
// Footer Section
// ---------------------------------------------------------------------------
class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 20, 24, 34),
      child: Text(
        '© ${DateTime.now().year} Devendra Maurya · Built with Flutter Web',
        textAlign: TextAlign.center,
        style: const TextStyle(color: kMuted, fontSize: 12),
      ),
    );
  }
}
