import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goldy/core/constants/app_colors.dart';
import 'package:goldy/core/constants/app_images.dart';
import 'package:goldy/core/constants/app_strings.dart';
import 'package:goldy/core/presentation/widgets/custom_text.dart';
import 'package:goldy/features/silver/data/repository/silver_repository.dart';
import 'package:goldy/features/silver/presentation/cubit/silver_cubit.dart';
import 'package:goldy/core/presentation/widgets/metal_details_bottom_sheet.dart';
import 'package:goldy/features/silver/presentation/cubit/silver_state.dart';

class SilverView extends StatelessWidget {
  const SilverView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SilverCubit(SilverRepository())..fetchSilver(),
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: AppBar(
          backgroundColor: AppColors.appbarColor,
          title: Center(
            child: CustomText(
              text: AppStrings.silverappbar,
              color: AppColors.silverColor,
            ),
          ),
        ),
        body: Center(
          child: BlocBuilder<SilverCubit, SilverState>(
            builder: (context, state) {
              if (state is SilverLoading) {
                return Center(
                  child: CircularProgressIndicator(
                    color: AppColors.silverColor,
                  ),
                );
              } else if (state is SilverError) {
                return CustomText(
                  text: state.errorMessage,
                  color: AppColors.errorColor,
                );
              } else if (state is SilverLoaded) {
                final silver = state.silverModel;

                return InkWell(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      backgroundColor: Colors.transparent,
                      builder: (_) => MetalDetailsBottomSheet(
                        metal: silver,
                        title: "Silver Details",
                        accentColor: AppColors.silverColor,
                      ),
                    );
                  },
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        AppImages.silverImage,
                        height: 200,
                        width: 200,
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CustomText(
                            text: silver.price.toStringAsFixed(2),
                            color: AppColors.silverColor,
                          ),
                          const SizedBox(width: 10),
                          const CustomText(
                            text: 'USD',
                            color: AppColors.silverColor,
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              }

              return const SizedBox.shrink();
            },
          ),
        ),
      ),
    );
  }
}
