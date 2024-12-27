import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import '../../app/core/responsive_screen_provider.dart';
import 'desktop/ds_1_header.dart';
import 'desktop/ds_2_about_me.dart';
import 'desktop/ds_3_education.dart';
import 'desktop/ds_4_experience.dart';
import 'desktop/ds_5_volunteering.dart';
import 'desktop/ds_6_technotes.dart';
import 'desktop/ds_7_contact.dart';
import 'desktop/ds_8_footer.dart';
import 'mobile/ms_1_header.dart';
import 'mobile/ms_2_about_me.dart';
import 'mobile/ms_3_education.dart';
import 'mobile/ms_4_experience.dart';
import 'mobile/ms_5_volunteering.dart';
import 'mobile/ms_6_technotes.dart';
import 'mobile/ms_7_contact.dart';
import 'mobile/ms_8_footer.dart';
import 'widgets/nav_bar.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  bool _showBackToTopButton = false;
  late ScrollController _scrollController;

  @override
  void initState() {
    FlutterNativeSplash.remove();
    _scrollController = ScrollController()
      ..addListener(
        () {
          setState(
            () {
              if (_scrollController.offset >= 300) {
                _showBackToTopButton = true;
              } else {
                _showBackToTopButton = false;
              }
            },
          );
        },
      );

    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToTop() {
    _scrollController.animateTo(0,
        duration: const Duration(milliseconds: 1000), curve: Curves.easeInOut);
  }

  @override
  Widget build(BuildContext context) {
    Widget desktopUI() {
      return ListView(
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        children: const [
          DS1Header(),
          DS2AboutMe(),
          DS3Education(),
          DS4Experience(),
          DS5Volunteering(),
          DS6TechNotes(),
          DS7Contact(),
          DS8Footer(),
        ],
      );
    }

    Widget mobileUI() {
      return ListView(
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        children: const [
          MS1Header(),
          MS2AboutMe(),
          MS3Education(),
          MS4Experience(),
          MS5Volunteering(),
          MS6TechNotes(),
          MS7Contact(),
          MS8Footer(),
        ],
      );
    }

    return Scaffold(
      appBar: ResponsiveScreenProvider.isDesktopScreen(context)
          ? null
          : AppBar(elevation: 0.0),
      drawer: ResponsiveScreenProvider.isDesktopScreen(context)
          ? null
          : NavBar().mobileNavBar(context),
      body: SingleChildScrollView(
        controller: _scrollController,
        physics: const BouncingScrollPhysics(),
        child: Container(
          // color: AppThemeData.backgroundGrey,
          child: ResponsiveScreenProvider.isDesktopScreen(context)
              ? desktopUI()
              : mobileUI(),
        ),
      ),
      floatingActionButton: _showBackToTopButton == false
          ? null
          : FloatingActionButton(
              onPressed: _scrollToTop,
              tooltip: 'Go to top',
              // backgroundColor: AppThemeData.buttonPrimary,
              // foregroundColor: AppThemeData.iconSecondary,
              child: const Icon(
                Icons.arrow_upward_rounded,
              ),
            ),
    );
  }
}
