import 'package:flutter/material.dart';
import 'package:goldy/core/constants/app_colors.dart';
import 'package:goldy/core/models/metal_model.dart';

class MetalDetailsBottomSheet extends StatelessWidget {
  final MetalModel metal;
  final String title;
  final Color accentColor;

  const MetalDetailsBottomSheet({
    super.key,
    required this.metal,
    required this.title,
    required this.accentColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: AppColors.backgroundColor,
        borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 50,
            height: 5,
            decoration: BoxDecoration(
              color: AppColors.textColor,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          const SizedBox(height: 25),
          Text(
            title,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: accentColor,
            ),
          ),
          const SizedBox(height: 25),
          _row(Icons.badge, "Name", metal.name),
          const SizedBox(height: 15),
          _row(Icons.code, "Symbol", metal.symbol),
          const SizedBox(height: 15),
          _row(
            Icons.attach_money,
            "Price",
            "${metal.price.toStringAsFixed(2)} USD",
          ),
          const SizedBox(height: 15),
          _row(Icons.access_time, "Updated", metal.updatedAtReadable),
          const SizedBox(height: 25),
        ],
      ),
    );
  }

  Widget _row(IconData icon, String title, String value) {
    return Row(
      children: [
        Icon(icon, color: accentColor),
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
          child: Text(
            value,
            style: const TextStyle(color: Colors.white70),
          ),
        ),
      ],
    );
  }
}
