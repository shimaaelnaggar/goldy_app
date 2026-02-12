import 'package:flutter/material.dart';
import 'package:goldy/core/constants/app_colors.dart';
import 'package:goldy/core/constants/app_icons.dart';
import 'package:goldy/core/constants/app_strings.dart';
import 'package:goldy/core/presentation/widgets/animated_header.dart';
import 'package:goldy/core/presentation/widgets/custom_button.dart';
import 'package:goldy/core/routing/routes.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const AnimatedHeader(
            icon: AppIcons.trending,
            title: AppStrings.animatedTitle,
            subtitle: AppStrings.animatedSubtitle,
          ),

          const SizedBox(height: 40),
          CustomButton(
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.gold);
            },
            text: AppStrings.gold,
            buttonColor: AppColors.goldColor,
          ),
          const SizedBox(height: 20),
          CustomButton(
            onTap: () {},
            text: AppStrings.silver,
            buttonColor: AppColors.silverColor,
          ),
        ],
      ),
    );
  }
}
