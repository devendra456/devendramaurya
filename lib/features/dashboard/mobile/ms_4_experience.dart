import 'package:flutter/material.dart';

import '../../../app/statics/data_values.dart';
import '../../../app/statics/key_holders.dart';
import '../widgets/container_card.dart';
import '../widgets/frame_title.dart';

class MS4Experience extends StatelessWidget {
  const MS4Experience({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      key: KeyHolders.experienceKey,
      // color: AppThemeData.backgroundGrey,
      child: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const FrameTitle(
                title: DataValues.experienceTitle,
                description: DataValues.experienceDescription),
            const SizedBox(height: 30.0),
            Center(
              child: ContainerCard(context: context).type3(
                image: 'tcc_logo',
                title: DataValues.experienceOrg3Title,
                role: DataValues.experienceOrg3Role,
                years: DataValues.experienceOrg3Years,
                values: DataValues.experienceOrg3Vales,
                message: DataValues.experienceURL3.toString(),
                url: DataValues.tccUrl,
                isButtonEnabled: true,
              ),
            ),
            const SizedBox(height: 20.0),
            ContainerCard(context: context).type3(
              image: 'rv_logo',
              title: DataValues.experienceOrg1Title,
              role: DataValues.experienceOrg1Role,
              years: DataValues.experienceOrg1Years,
              values: DataValues.experienceOrg1Vales,
              message: DataValues.experienceURL1.toString(),
              url: DataValues.rvURL,
              isButtonEnabled: true,
            ),
            const SizedBox(height: 20.0),
            ContainerCard(context: context).type3(
              image: 'sky_logo',
              title: DataValues.experienceOrg2Title,
              role: DataValues.experienceOrg2Role,
              years: DataValues.experienceOrg2Years,
              values: DataValues.experienceOrg2Vales,
              message: DataValues.experienceURL1.toString(),
              url: DataValues.skyURL,
              isButtonEnabled: true,
            ),
            /*const SizedBox(height: 40.0),
            Center(
              child: ContainerBanner(context: context).type1(
                  isDesktop: false,
                  title1: DataValues.experienceBanner,
                  title2: DataValues.experienceBannerTitle,
                  description: DataValues.experienceBannerWeb,
                  image: 'logo',
                  message: 'View Toolkit',
                  url: DataValues.toolkitURL),
            ),*/
          ],
        ),
      ),
    );
  }
}
