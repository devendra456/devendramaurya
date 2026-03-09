import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class ButtonIcon {
  final IconData icon;
  final Uri url;
  final double size;

  ButtonIcon(
      {required this.icon,
      required this.url,
      this.size = 30,
      });

  Widget returnButton() {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () async {
          if (!await launchUrl(url)) {
            throw 'Could not launch $url';
          }
          log("Direct to: $url");
        },
        child: Tooltip(
          message: url.toString(),
          child: FaIcon(icon, size: size),
        ),
      ),
    );
  }
}
