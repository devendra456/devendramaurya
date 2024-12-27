import 'package:flutter/material.dart';

import '../../../app/statics/data_values.dart';
import '../../../app/statics/key_holders.dart';
import '../widgets/container_card.dart';
import '../widgets/frame_title.dart';

class MS3Education extends StatelessWidget {
  const MS3Education({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      key: KeyHolders.educationKey,
      // color: AppThemeData.backgroundGrey,
      child: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const FrameTitle(
                title: DataValues.educationTitle,
                description: DataValues.educationDescription),
            const SizedBox(height: 30.0),
            ContainerCard(context: context).type2(
              image: 'mms',
              title: DataValues.educationOrg1Title,
              values: [
                DataValues.educationOrg1Course1Name,
                DataValues.educationOrg1Course1Grade,
                DataValues.educationOrg1Course1Year,
                DataValues.educationOrg1Course2Name,
                DataValues.educationOrg1Course2Grade,
                DataValues.educationOrg1Course2Year,
                DataValues.educationOrg1Course3Name,
                DataValues.educationOrg1Course3Year,
                DataValues.educationOrg1Course3Year2,
              ],
              message: DataValues.linkedinURL.toString(),
              url: DataValues.linkedinURL,
            ),
            const SizedBox(height: 20.0),
            ContainerCard(context: context).type2(
              image: 'nibm',
              title: DataValues.educationOrg2Title,
              values: [
                DataValues.educationOrg2Course1Name,
                DataValues.educationOrg2Course1Grade,
                DataValues.educationOrg2Course1Year,
                DataValues.educationOrg2Course2Name,
                DataValues.educationOrg2Course2Grade,
                DataValues.educationOrg2Course2Year,
                DataValues.educationOrg2Course3Name,
                DataValues.educationOrg2Course3Grade,
                DataValues.educationOrg2Course3Year,
              ],
              message: DataValues.linkedinURL.toString(),
              url: DataValues.linkedinURL,
            ),
          ],
        ),
      ),
    );
  }
}
