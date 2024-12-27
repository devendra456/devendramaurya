import 'package:flutter/material.dart';

import '../../../app/statics/data_values.dart';
import '../widgets/social_profiles.dart';

class MS1Header extends StatelessWidget {
  const MS1Header({super.key});

  List<Widget> headerData(BuildContext context) {
    return [
      Image.asset('assets/images/logo.png', height: 250.0, width: 250.0),
      const SizedBox(height: 40.0),
      Column(
        children: [
          SelectableText(
            DataValues.headerGreetings,
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          SelectableText(
            DataValues.headerName,
            style: Theme.of(context).textTheme.displayMedium,
            textAlign: TextAlign.center,
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
          padding: const EdgeInsets.only(bottom: 40.0),
          child: Column(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: headerData(context),
              ),
              const SizedBox(height: 40.0),
            ],
          )),
    );
  }
}
