import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../widgets/text_pairs.dart';
import 'button_text.dart';

class ContainerCard {
  final BuildContext context;

  ContainerCard({required this.context});

  Widget type1({
    required String title,
    required String description,
    required String image,
    required String message,
    required Uri url,
  }) {
    return Container(
      decoration: BoxDecoration(
        // color: AppThemeData.cardGrey,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(image, height: 70.0, width: 70.0),
                const SizedBox(height: 20.0),
                SelectableText(
                  title,
                  style: TextStyle(
                    fontSize: Theme.of(context).textTheme.titleMedium!.fontSize,
                    fontWeight: Theme.of(context).textTheme.headlineSmall!.fontWeight,
                    // color: AppThemeData.textWhite,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10.0),
            SelectableText(description,
                style: Theme.of(context).textTheme.labelLarge),
            const SizedBox(height: 20.0),
            // ButtonTextSmall(
            //   text: 'View More >>',
            //   message: message,
            //   url: url,
            // ),
          ],
        ),
      ),
    );
  }

  Widget type2({
    required String image,
    required String title,
    required List values,
    required String message,
    required Uri url,
  }) {
    return Container(
      decoration: BoxDecoration(
        // color: AppThemeData.cardGrey,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset('assets/images/$image.png', height: 70.0),
                const SizedBox(height: 20.0),
                SelectableText(title,
                    style: TextStyle(
                      fontSize: Theme.of(context).textTheme.titleMedium!.fontSize,
                      fontWeight: Theme.of(context).textTheme.headlineSmall!.fontWeight,
                      // color: AppThemeData.textPrimary,
                    )),
                const SizedBox(height: 10.0),
                TextPairs(context: context).type2(
                  title: values[0],
                  value1: values[1],
                  value2: values[2],
                  isThreeLines: false,
                ),
                const SizedBox(height: 10.0),
                TextPairs(context: context).type2(
                  title: values[3],
                  value1: values[4],
                  value2: values[5],
                  isThreeLines: false,
                ),
                const SizedBox(height: 10.0),
                TextPairs(context: context).type2(
                  title: values[6],
                  value1: values[7],
                  value2: values[8],
                  isThreeLines: false,
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            ButtonTextSmall(
              text: 'View More >>',
              message: message,
              url: url,
            ),
          ],
        ),
      ),
    );
  }

  Widget type3({
    required String image,
    required String title,
    required String role,
    required String years,
    required String values,
    required String message,
    required Uri url,
    required bool isButtonEnabled,
  }) {
    return Container(
      decoration: BoxDecoration(
        // color: AppThemeData.cardGrey,
        borderRadius: BorderRadius.circular(10.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset('assets/images/$image.png', height: 70.0),
                const SizedBox(height: 20.0),
                SelectableText(title,
                    style: TextStyle(
                      fontSize: Theme.of(context).textTheme.titleMedium!.fontSize,
                      fontWeight: Theme.of(context).textTheme.headlineSmall!.fontWeight,
                      // color: AppThemeData.textPrimary,
                    )),
                const SizedBox(height: 10.0),
                TextPairs(context: context).type2(
                  title: role,
                  value1: years,
                  value2: values,
                  isThreeLines: true,
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            isButtonEnabled
                ? ButtonTextSmall(
                    text: 'View More >>',
                    message: message,
                    url: url,
                  )
                : Text(
                    'See you soon with the link :)',
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
          ],
        ),
      ),
    );
  }

  Widget type4({
    required String image,
    required String title,
    required String message,
    required Uri url,
  }) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Tooltip(
          message: 'Visit $message',
          child: MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () async {
                if (!await launchUrl(url)) {
                  throw 'Could not launch $url';
                }
                log("Direct to: $url");
              },
              child: Text(
                message,
                style: TextStyle(
                  fontSize: Theme.of(context).textTheme.labelLarge!.fontSize,
                  fontWeight:
                      Theme.of(context).textTheme.labelLarge!.fontWeight,
                  // color: AppThemeData.textWhite,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
