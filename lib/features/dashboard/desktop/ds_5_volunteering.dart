import 'package:flutter/material.dart';

import '../../../app/statics/data_values.dart';
import '../../../app/statics/key_holders.dart';
import '../widgets/container_banner.dart';
import '../widgets/container_card.dart';
import '../widgets/frame_title.dart';

class DS5Volunteering extends StatelessWidget {
  const DS5Volunteering({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      key: KeyHolders.volunteeringKey,
      // color: AppThemeData.backgroundGrey,
      child: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const FrameTitle(
                title: DataValues.volunteeringTitle,
                description: DataValues.volunteeringDescription),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ContainerCard(context: context).type3(
                    image: 'flutterscope',
                    title: DataValues.volunteeringOrg1Title,
                    role: DataValues.volunteeringOrg1Role,
                    years: DataValues.volunteeringOrg1Years,
                    values: DataValues.volunteeringOrg1Vales,
                    message: DataValues.linkedinURL.toString(),
                    url: DataValues.linkedinURL,
                    isButtonEnabled: true,
                  ),
                ),
                SizedBox(width: MediaQuery.of(context).size.width * 0.05),
                Expanded(
                  child: ContainerCard(context: context).type3(
                    image: 'mlsa',
                    title: DataValues.volunteeringOrg2Title,
                    role: DataValues.volunteeringOrg2Role,
                    years: DataValues.volunteeringOrg2Years,
                    values: DataValues.volunteeringOrg2Vales,
                    message: DataValues.linkedinURL.toString(),
                    url: DataValues.linkedinURL,
                    isButtonEnabled: true,
                  ),
                ),
              ],
            ),
            /*const SizedBox(height: 80.0),
            Center(
              child: ContainerBanner(context: context).type1(
                isDesktop: true,
                title1: DataValues.volunteeringBanner,
                title2: DataValues.volunteeringBannerTitle,
                description: DataValues.volunteeringBannerWeb,
                image: 'image',
                message: 'Volunteering Profile',
                url: DataValues.volunteeringURL,
              ),
            ),*/
          ],
        ),
      ),
    );
  }
}
