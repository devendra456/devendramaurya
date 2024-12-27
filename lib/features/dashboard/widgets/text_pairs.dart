import 'package:flutter/material.dart';

class TextPairs {
  final BuildContext context;

  TextPairs({required this.context});

  Widget type1({required String title, required String description}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            SelectableText(title,
                style: Theme.of(context).textTheme.titleMedium),
          ],
        ),
        const SizedBox(height: 10.0),
        SelectableText(description,
            style: Theme.of(context).textTheme.labelLarge),
      ],
    );
  }

  Widget type2(
      {required String title,
      required String value1,
      required String value2,
      required bool isThreeLines}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SelectableText(
          title,
          style: TextStyle(
            fontSize: Theme.of(context).textTheme.titleSmall!.fontSize,
            fontWeight: Theme.of(context).textTheme.titleSmall!.fontWeight,
            // color: AppThemeData.textWhite,
          ),
        ),
        SelectableText(
          value1,
          style: TextStyle(
            fontSize: Theme.of(context).textTheme.labelLarge!.fontSize,
            fontWeight: Theme.of(context).textTheme.labelLarge!.fontWeight,
            // color: AppThemeData.textGreyDark,
          ),
        ),
        isThreeLines ? const SizedBox(height: 20.0) : Container(),
        SelectableText(
          value2,
          style: TextStyle(
            fontSize: Theme.of(context).textTheme.labelLarge!.fontSize,
            fontWeight: Theme.of(context).textTheme.labelLarge!.fontWeight,
            // color: AppThemeData.textGreyDark,
          ),
        ),
      ],
    );
  }

  Widget type3(
      {required String title, required String value1, required String value2}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SelectableText(
          title,
          style: TextStyle(
            fontSize: Theme.of(context).textTheme.titleSmall!.fontSize,
            fontWeight: Theme.of(context).textTheme.titleSmall!.fontWeight,
            // color: AppThemeData.textWhite,
          ),
        ),
        SelectableText(
          value1,
          style: TextStyle(
            fontSize: Theme.of(context).textTheme.labelLarge!.fontSize,
            fontWeight: Theme.of(context).textTheme.labelLarge!.fontWeight,
            // color: AppThemeData.textGreyDark,
          ),
        ),
        const SizedBox(height: 20.0),
        SelectableText(
          value2,
          style: TextStyle(
            fontSize: Theme.of(context).textTheme.labelLarge!.fontSize,
            fontWeight: Theme.of(context).textTheme.labelLarge!.fontWeight,
            // color: AppThemeData.textGreyDark,
          ),
        ),
      ],
    );
  }
}
