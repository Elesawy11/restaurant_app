import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../core/utils/color_manager.dart';
import '../../../../../core/utils/spacer.dart';
import '../../../../../core/utils/styles.dart';

class FoodItemCardWidget extends StatelessWidget {
  const FoodItemCardWidget({
    super.key,
    required this.imageUrl,
    required this.title,

    required this.price,
    this.onTap,
  });

  final String imageUrl;
  final String title;

  final double price;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.h),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: ColorManager.black2D,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              imageUrl,
              width: 80,
              height: 80,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  width: 80.r,
                  height: 80.r,
                  decoration: BoxDecoration(
                    color: Colors.grey[600],
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(
                    Icons.fastfood,
                    color: Colors.white54,
                    size: 40,
                  ),
                );
              },
            ),
          ),
          horizontalSpace(16),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: Styles.font18W600.copyWith(color: Colors.white),
                ),
                verticalSpace(8),

                // Price
                Text(
                  '₹ $price',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          InkWell(
            onTap: onTap,
            child: Container(
              width: 28.r,
              height: 28.r,
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(color: Colors.white54, width: 2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Icon(Icons.add, color: Colors.white, size: 18.r),
            ),
          ),
        ],
      ),
    );
  }
}
