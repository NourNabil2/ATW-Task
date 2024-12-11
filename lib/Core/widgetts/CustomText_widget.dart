import 'package:atw_task/Core/utilts/Constents.dart';
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String text;
  final TextStyle? style;

  const CustomText({
    Key? key,
    required this.text,
    this.style, // Style is optional; if not provided, it uses the default
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: SizeApp.defaultPadding),
      child: Text(
        text,
        style: style ?? Theme.of(context).textTheme.bodyLarge, // Default to bodyLarge if no style is provided
      ),
    );
  }
}
