import 'package:flutter/material.dart';
import 'package:goldy/core/constants/app_colors.dart';


class CustomText extends StatelessWidget {
  const CustomText({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        color: AppColors.goldColor,
        fontWeight: FontWeight.w700,
        fontSize: 20,
      ),
    );
  }
}
