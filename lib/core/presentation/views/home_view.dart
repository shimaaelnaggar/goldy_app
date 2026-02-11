import 'package:flutter/material.dart';
import 'package:goldy/core/constants/app_colors.dart';
import 'package:goldy/core/constants/app_strings.dart';
import 'package:goldy/core/presentation/widgets/custom_button.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomButton(
            onTap: () {},
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
