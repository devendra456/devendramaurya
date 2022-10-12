import 'package:devendramaurya/configs/app_typography.dart';
import 'package:flutter/material.dart';

class CustomSectionHeading extends StatelessWidget {
  final String text;

  const CustomSectionHeading({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: AppText.h1!.copyWith(
        fontFamily: 'Montserrat',
      ),
    );
  }
}

class CustomSectionSubHeading extends StatelessWidget {
  final String text;

  const CustomSectionSubHeading({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: AppText.l1!.copyWith(
        fontFamily: 'Montserrat',
      ),
    );
  }
}
