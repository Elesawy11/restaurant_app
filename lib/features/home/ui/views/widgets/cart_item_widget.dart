import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant_app/features/home/ui/cubits/cart_item_edit_cubit/cart_item_edit_cubit.dart';
import '../../../../../core/utils/spacer.dart';
import '../../../../../core/utils/styles.dart';
import '../../../data/models/cart_item.dart';
import 'cart_item_image_widget.dart';
import 'custom_decrease_and_increase_widget.dart';

class CartItemWidget extends StatelessWidget {
  const CartItemWidget({super.key, required this.item});
  final CartItem item;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CartItemEditCubit>();
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          CartItemImageWidget(item: item),
          horizontalSpace(12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      item.name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    IconButton(
                      onPressed: () => cubit.removeItem(id: item.id),
                      icon: Icon(
                        Icons.delete_outline,
                        color: Colors.red[400],
                        size: 24,
                      ),
                    ),
                  ],
                ),

                verticalSpace(8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '₹ ${item.price.toStringAsFixed(0)}',
                      style: Styles.font14bold,
                    ),

                    CustomDecreaseAndIncreaseWidget(item: item),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
