import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goldy/core/constants/app_colors.dart';
import 'package:goldy/core/constants/app_images.dart';
import 'package:goldy/core/constants/app_strings.dart';
import 'package:goldy/features/gold/data/repository/gold_rebository.dart';
import 'package:goldy/features/gold/presentation/cubit/cubit/gold_cubit.dart';
import 'package:goldy/features/gold/presentation/views/widgets/custom_text.dart';

class GoldView extends StatelessWidget {
  const GoldView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GoldCubit(GoldRebository())..fetchGold(),
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        appBar: AppBar(
          backgroundColor: AppColors.appbarColor,
          title: Center(child: CustomText(text: AppStrings.goldappbar)),
        ),
        body: Center(
          child: BlocBuilder<GoldCubit, GoldState>(
            builder: (context, state) {
              if (state is GoldLoading) {
                return Center(
                  child: CircularProgressIndicator(color: AppColors.goldColor),
                );
              } else if (state is GoldError) {
                return CustomText(text: state.errorMessage);
              } else if (state is GoldLoaded) {
                final gold = state.goldModel;

                return GestureDetector(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      isScrollControlled: true,
                      backgroundColor: Colors.transparent,
                      builder: (_) {
                        return Container(
                          padding: const EdgeInsets.all(20),
                          decoration: const BoxDecoration(
                            color: Color(0xff1E1E1E),
                            borderRadius: BorderRadius.vertical(
                              top: Radius.circular(30),
                            ),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                             
                              Container(
                                width: 50,
                                height: 5,
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),

                              const SizedBox(height: 25),

                              const Text(
                                "Gold Details",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.amber,
                                ),
                              ),

                              const SizedBox(height: 25),

                              _buildDetailRow(Icons.badge, "Name", gold.name),
                              const SizedBox(height: 15),

                              _buildDetailRow(
                                Icons.code,
                                "Symbol",
                                gold.symbol,
                              ),
                              const SizedBox(height: 15),

                              _buildDetailRow(
                                Icons.attach_money,
                                "Price",
                                "${gold.price.toStringAsFixed(2)} USD",
                              ),
                              const SizedBox(height: 15),

                              _buildDetailRow(
                                Icons.access_time,
                                "Updated",
                                gold.updatedAtReadable,
                              ),

                              const SizedBox(height: 25),
                            ],
                          ),
                        );
                      },
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
                          CustomText(text: gold.price.toStringAsFixed(2)),
                          const SizedBox(width: 10),
                          const CustomText(text: 'USD'),
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

Widget _buildDetailRow(IconData icon, String title, String value) {
  return Row(
    children: [
      Icon(icon, color: Colors.amber),
      const SizedBox(width: 12),
      Text(
        "$title:",
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      const SizedBox(width: 8),
      Expanded(
        child: Text(value, style: const TextStyle(color: Colors.white70)),
      ),
    ],
  );
}
