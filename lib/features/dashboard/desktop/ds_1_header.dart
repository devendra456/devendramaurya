import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../app/statics/data_values.dart';
import '../widgets/nav_bar.dart';
import '../widgets/social_profiles.dart';

class DS1Header extends StatelessWidget {
  const DS1Header({super.key});

  List<Widget> headerData(BuildContext context) {
    return [
      Image.asset('assets/images/logo.png', height: 250.0, width: 250.0),
      const SizedBox(width: 60.0),
      Column(
        children: [
          SelectableText(
            DataValues.headerGreetings,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          SelectableText(
            DataValues.headerName,
            style: Theme.of(context).textTheme.displayMedium,
          ),
          SelectableText(
            DataValues.headerTitle,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 20.0),
          const SocialProfiles(),
        ],
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: AppThemeData.backgroundBlack,
      child: Padding(
          padding: const EdgeInsets.only(top: 0, bottom: 40.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(40.0),
                child: Row(
                  children: [
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
                                      brightness:
                                          state.themeMode == ThemeMode.dark
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
                    Spacer(),
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
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: headerData(context),
              ),
              const SizedBox(height: 60.0),
              NavBar().desktopNavBar(),
            ],
          )),
    );
  }
}
