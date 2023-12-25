import 'package:devendramaurya/responsive/responsive.dart';
import 'package:devendramaurya/sections/portfolio/portfolio_desktop.dart';
import 'package:devendramaurya/sections/portfolio/portfolio_mobile.dart';
import 'package:flutter/material.dart';

class Portfolio extends StatelessWidget {
  const Portfolio({super.key});

  @override
  Widget build(BuildContext context) {
    return const Responsive(
      mobile: PortfolioMobileTab(),
      tablet: PortfolioMobileTab(),
      desktop: PortfolioDesktop(),
    );
  }
}
