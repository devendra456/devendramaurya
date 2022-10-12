import 'package:devendramaurya/sections/about/about.dart';
import 'package:devendramaurya/sections/contact/contact.dart';
import 'package:devendramaurya/sections/home/home.dart';
import 'package:devendramaurya/sections/portfolio/portfolio.dart';
import 'package:devendramaurya/sections/services/services.dart';
import 'package:devendramaurya/widget/footer.dart';
import 'package:flutter/material.dart';

class StaticUtils {
  static const String hi = 'assets/hi.gif';

  // photos
  static const String mobilePhoto = 'assets/photos/mobile.png';
  static const String coloredPhoto = 'assets/photos/colored.png';
  static const String blackWhitePhoto = 'assets/photos/black-white.png';

  // work
  static const String dsc = 'assets/work/dsc.png';
  static const String sastaticket = 'assets/work/st.png';
  static const String university = 'assets/work/cui.png';
  static const String fullterIsb = 'assets/work/flutterIsl.png';
  static const String skyview = 'assets/work/skyview.png';

  // services
  static const String uiux = 'assets/services/ui.png';
  static const String blog = 'assets/services/blog.png';
  static const String appDev = 'assets/services/app.png';
  static const String rapid = 'assets/services/rapid.png';
  static const String openSource = 'assets/services/open.png';
  static const String openSourceBlack = 'assets/services/open_b.png';

  static const List<String> socialIconURL = [
    "https://img.icons8.com/metro/208/ffffff/facebook-new--v2.png",
    "https://img.icons8.com/ios-glyphs/480/ffffff/instagram-new.png",
    "https://img.icons8.com/android/480/ffffff/twitter.png",
    "https://img.icons8.com/metro/308/ffffff/linkedin.png",
    "https://img.icons8.com/material-rounded/384/ffffff/github.png",
    "https://img.icons8.com/material-rounded/384/ffffff/whatsapp.png",
  ];

  static const List<String> socialLinks = [
    "https://www.facebook.com/devender.raurya/",
    "https://www.instagram.com/devendramaurya456/",
    "https://twitter.com/Devendra7897430",
    "https://www.linkedin.com/in/devendra-maurya-b639261aa/",
    "https://github.com/devendra456",
    "https://api.whatsapp.com/send/?phone=917897430432&text=Hi&type=phone_number&app_absent=0",
  ];

  static const String resume = 'https://drive.google.com/file/d/1Gwg-3VHR44nLAf0I_W2jXEPJ_mMBLkY3/view?usp=sharing';

  static const String gitHub = 'https://github.com/devendra456';
}

class BodyUtils {
  static const List<Widget> views = [
    HomePage(),
    About(),
    Services(),
    Portfolio(),
    Contact(),
    Footer(),
  ];
}
