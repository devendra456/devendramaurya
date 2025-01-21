import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../app/core/responsive_screen_provider.dart';
import '../../app/statics/data_values.dart';
import 'desktop/ds_1_header.dart';
import 'desktop/ds_2_about_me.dart';
import 'desktop/ds_3_education.dart';
import 'desktop/ds_4_experience.dart';
import 'desktop/ds_7_contact.dart';
import 'desktop/ds_8_footer.dart';
import 'mobile/ms_1_header.dart';
import 'mobile/ms_2_about_me.dart';
import 'mobile/ms_3_education.dart';
import 'mobile/ms_4_experience.dart';
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
          MS7Contact(),
          MS8Footer(),
        ],
      );
    }

    return Scaffold(
      appBar: ResponsiveScreenProvider.isDesktopScreen(context)
          ? null
          : AppBar(
              elevation: 0.0,
              actions: [
                /*BlocBuilder<ThemeBloc, ThemeState>(
                  builder: (context, state) {
                    if (state is ThemeSuccess) {
                      return IconButton(
                        icon: Icon(
                          state.themeMode == ThemeMode.dark
                              ? Icons.light_mode
                              : Icons.dark_mode,
                        ),
                        onPressed: () {
                          context.read<ThemeBloc>().add(
                                ThemeLoadEvent(
                                  brightness: state.themeMode == ThemeMode.dark
                                      ? Brightness.light
                                      : Brightness.dark,
                                ),
                              );
                        },
                      );
                    }
                    return SizedBox();
                  },
                ),*/
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: Tooltip(
                    message: DataValues.resumeURL.toString(),
                    child: IconButton(
                      onPressed: () async {
                        if (!await launchUrl(DataValues.resumeURL)) {
                          throw 'Could not launch ${DataValues.resumeURL}';
                        }
                        log("Direct to: ${DataValues.resumeURL}");
                      },
                      icon: Icon(
                        Icons.download_for_offline_rounded,
                        size: 32,
                      ),
                    ),
                  ),
                ),
              ],
            ),
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
