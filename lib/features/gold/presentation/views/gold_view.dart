import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goldy/core/constants/app_colors.dart';
import 'package:goldy/core/constants/app_images.dart';
import 'package:goldy/core/constants/app_strings.dart';
import 'package:goldy/core/widgets/custom_app_bar.dart';
import 'package:goldy/core/widgets/custom_text.dart';
import 'package:goldy/features/gold/data/repository/gold_repository.dart';
import 'package:goldy/features/gold/presentation/cubit/gold_cubit.dart';
import 'package:goldy/core/widgets/metal_details_bottom_sheet.dart';

class GoldView extends StatelessWidget {
  const GoldView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GoldCubit(GoldRepository())..fetchGold(),
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: CustomAppBar(
          title: AppStrings.goldappbar,
          titleColor: AppColors.goldColor,
        ),
        body: Center(
          child: BlocBuilder<GoldCubit, GoldState>(
            builder: (context, state) {
              if (state is GoldLoading) {
                return Center(
                  child: CircularProgressIndicator(color: AppColors.goldColor),
                );
              } else if (state is GoldError) {
                return CustomText(
                  text: state.errorMessage,
                  color: AppColors.errorColor,
                );
              } else if (state is GoldLoaded) {
                final gold = state.goldModel;

                return InkWell(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      backgroundColor: Colors.transparent,
                      builder: (_) => MetalDetailsBottomSheet(
                        metal: gold,
                        title: "Gold Details",
                        accentColor: AppColors.goldColor,
                      ),
                    );
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(AppImages.goldImage, height: 200, width: 200),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomText(
                            text: gold.price.toStringAsFixed(2),
                            color: AppColors.goldColor,
                          ),
                          const SizedBox(width: 10),
                          const CustomText(
                            text: 'USD',
                            color: AppColors.goldColor,
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              }
              return SizedBox.shrink();
            },
          ),
        ),
      ),
    );
  }
}
