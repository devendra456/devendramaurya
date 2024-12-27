import 'package:flutter/material.dart';


class ButtonRectangle extends StatelessWidget {
  final String name;
  final VoidCallback onPressed;
  // final Color color;
  final String message;

  const ButtonRectangle(
      {super.key,
      required this.name,
      required this.onPressed,
      // required this.color,
      required this.message});

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: message,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          // backgroundColor: color,
          // foregroundColor: AppThemeData.textWhite,
          minimumSize: const Size(170.0, 50.0),
          textStyle: Theme.of(context).textTheme.titleMedium,
          elevation: 0.0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),
        child: Text(name),
      ),
    );
  }
}
