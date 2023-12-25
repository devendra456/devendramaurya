import 'package:devendramaurya/responsive/responsive.dart';
import 'package:devendramaurya/sections/home/home_desktop.dart';
import 'package:devendramaurya/sections/home/home_mobile.dart';
import 'package:devendramaurya/sections/home/home_tab.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: HomeMobile(),
      tablet: HomeTab(),
      desktop: HomeDesktop(),
    );
  }
}
