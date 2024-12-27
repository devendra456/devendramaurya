import 'package:flutter/material.dart';

import '../../../app/statics/data_values.dart';
import 'button_icon.dart';

class SocialProfiles extends StatelessWidget {
  const SocialProfiles({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(width: 10.0),
        ButtonIcon(name: 'github', url: DataValues.githubURL).returnButton(),
        const SizedBox(width: 10.0),
        ButtonIcon(name: 'linkedin', url: DataValues.linkedinURL)
            .returnButton(),
        const SizedBox(width: 10.0),
        ButtonIcon(name: 'twitter', url: DataValues.twitterURL).returnButton(),
        const SizedBox(width: 10.0),
        ButtonIcon(name: 'whatsapp', url: DataValues.whatsappURL).returnButton(),
        const SizedBox(width: 10.0),
        ButtonIcon(name: 'telegram', url: DataValues.telegramURL)
            .returnButton(),
        const SizedBox(width: 10.0),
        ButtonIcon(name: 'facebook', url: DataValues.facebookURL)
            .returnButton(),
        const SizedBox(width: 10.0),
        ButtonIcon(name: 'instagram', url: DataValues.instagramURL)
            .returnButton(),
      ],
    );
  }
}
