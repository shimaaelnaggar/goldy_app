import 'package:flutter/material.dart';
import 'package:goldy/core/constants/app_colors.dart';
import 'package:goldy/core/widgets/custom_text.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color titleColor;

  const CustomAppBar({
    super.key,
    required this.title,
    required this.titleColor,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.appbarColor,
      centerTitle: true,
      title: CustomText(text: title, color: titleColor),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
