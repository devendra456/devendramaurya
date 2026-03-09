import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
        ButtonIcon(icon: FontAwesomeIcons.envelope, url: DataValues.emailURL).returnButton(),
        const SizedBox(width: 10.0),
        ButtonIcon(icon: FontAwesomeIcons.github, url: DataValues.githubURL).returnButton(),
        const SizedBox(width: 10.0),
        ButtonIcon(icon: FontAwesomeIcons.linkedin, url: DataValues.linkedinURL)
            .returnButton(),
        const SizedBox(width: 10.0),
        ButtonIcon(icon: FontAwesomeIcons.xTwitter, url: DataValues.twitterURL).returnButton(),
        const SizedBox(width: 10.0),
        ButtonIcon(icon: FontAwesomeIcons.whatsapp, url: DataValues.whatsappURL)
            .returnButton(),
        const SizedBox(width: 10.0),
        ButtonIcon(icon: FontAwesomeIcons.telegram, url: DataValues.telegramURL)
            .returnButton(),
        const SizedBox(width: 10.0),
        ButtonIcon(icon: FontAwesomeIcons.facebook, url: DataValues.facebookURL)
            .returnButton(),
        const SizedBox(width: 10.0),
        ButtonIcon(icon: FontAwesomeIcons.instagram, url: DataValues.instagramURL)
            .returnButton(),
      ],
    );
  }
}
