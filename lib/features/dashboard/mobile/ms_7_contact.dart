import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../app/statics/data_values.dart';
import '../../../app/statics/key_holders.dart';
import '../widgets/container_banner.dart';
import '../widgets/frame_title.dart';
import '../widgets/social_profiles.dart';

class MS7Contact extends StatelessWidget {
  const MS7Contact({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      key: KeyHolders.contactKey,
      // color: AppThemeData.backgroundGrey,
      child: Column(
        children: [
          const SizedBox(
            height: 40.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const FrameTitle(
                    title: DataValues.contactTitle,
                    description: DataValues.contactDescription),
                const SizedBox(height: 30.0),
                SelectableText(DataValues.contactBanner,
                    style: TextStyle(
                      fontSize: Theme.of(context).textTheme.titleMedium!.fontSize,
                      fontWeight: Theme.of(context).textTheme.titleLarge!.fontWeight,
                      // color: AppThemeData.textWhite,
                    )),
                const SizedBox(height: 5.0),
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () {
                      Clipboard.setData(
                        const ClipboardData(text: DataValues.contactEmail),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(
                          'Email successfully copied to clipboard',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        duration: const Duration(seconds: 2),
                      ));
                    },
                    child: Tooltip(
                      message: 'Click to copy email to clipboard',
                      child: Text(
                        DataValues.contactEmail,
                        style: TextStyle(
                          fontSize: Theme.of(context).textTheme.titleMedium!.fontSize,
                          fontWeight: Theme.of(context).textTheme.titleLarge!.fontWeight,
                          // color: AppThemeData.textPrimary,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          const SocialProfiles(),
          /*const SizedBox(
            height: 20.0,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40.0),
            child: ContainerBanner(context: context).type2(
              message:
                  'Visit profile.dileepabandara.dev to view my all profiles >>',
              url: DataValues.profilesURL,
            ),
          ),*/
          const SizedBox(
            height: 40.0,
          ),
        ],
      ),
    );
  }
}
