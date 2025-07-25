import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../data/models/cart_item.dart';

class CartItemImageWidget extends StatelessWidget {
  const CartItemImageWidget({super.key, required this.item});

  final CartItem item;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80.r,
      height: 80.r,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.grey[800],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.asset(
          item.imageUrl,
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              color: Colors.grey[700],
              child: const Icon(
                Icons.fastfood,
                color: Colors.white54,
                size: 40,
              ),
            );
          },
        ),
      ),
    );
  }
}
