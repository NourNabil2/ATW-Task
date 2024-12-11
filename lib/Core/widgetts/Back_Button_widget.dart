import 'package:atw_task/Core/utilts/Constents.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CustomBackButton extends StatelessWidget {
  final double width;
  final Color color;
  final VoidCallback onTap;

  const CustomBackButton({
    Key? key,
    this.width = 50,
    this.color = Colors.black87,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: onTap,
          child: SvgPicture.asset(
            EndPoinds.backButton, // Replace with your actual asset path
            colorFilter: ColorFilter.mode(color, BlendMode.srcIn),
            width: width,
          ),
        ),
      ],
    );
  }
}
