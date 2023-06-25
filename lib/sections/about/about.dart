import 'package:devendramaurya/responsive/responsive.dart';
import 'package:devendramaurya/sections/about/about_desktop.dart';
import 'package:devendramaurya/sections/about/about_mobile.dart';
import 'package:devendramaurya/sections/about/about_tablet.dart';
import 'package:flutter/material.dart';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      tablet: AboutTab(),
      mobile: AboutMobile(),
      desktop: AboutDesktop(),
    );
  }
}
