import 'package:devendramaurya/configs/app_dimensions.dart';
import 'package:devendramaurya/configs/app_theme.dart';
import 'package:devendramaurya/configs/app_typography.dart';
import 'package:flutter/material.dart';

class ToolTechWidget extends StatelessWidget {
  final String techName;

  const ToolTechWidget({super.key, required this.techName});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          Icons.play_arrow,
          color: AppTheme.c!.primary,
          size: AppDimensions.normalize(6),
        ),
        Text(
          " $techName ",
          style: AppText.l1b,
        )
      ],
    );
  }
}
