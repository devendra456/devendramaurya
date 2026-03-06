import 'package:flutter/material.dart';

import '../../../app/statics/data_values.dart';
import '../../../app/statics/key_holders.dart';
import '../widgets/container_card.dart';
import '../widgets/frame_title.dart';

class MS5Projects extends StatelessWidget {
  const MS5Projects({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      key: KeyHolders.projectsKey,
      child: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const FrameTitle(
                title: DataValues.projectsTitle,
                description: DataValues.projectsDescription),
            const SizedBox(height: 30.0),
            ContainerCard(context: context).type6(
              image: 'tcc_logo',
              title: DataValues.project1Title,
              description: DataValues.project1Description,
              skills: DataValues.project1Technologies,
              androidLink: DataValues.project1AndroidURL.toString(),
              iOSLink: DataValues.project2iOSURL.toString(),
            ),
            const SizedBox(height: 20.0),
            ContainerCard(context: context).type6(
              image: 'mera_ration',
              title: DataValues.project2Title,
              description: DataValues.project2Description,
              skills: DataValues.project2Technologies,
              androidLink: DataValues.project2AndroidURL.toString(),
              iOSLink: DataValues.project2iOSURL.toString(),
            ),
          ],
        ),
      ),
    );
  }
}
