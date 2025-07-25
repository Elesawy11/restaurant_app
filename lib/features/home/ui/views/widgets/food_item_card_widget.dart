import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant_app/features/home/data/models/cart_item.dart';
import 'package:restaurant_app/features/home/data/models/item_model.dart';
import 'package:restaurant_app/features/home/ui/cubits/add_cart_item_cubit/add_cart_item_cubit.dart';

import '../../../../../core/utils/color_manager.dart';
import '../../../../../core/utils/spacer.dart';
import '../../../../../core/utils/styles.dart';

class FoodItemCardWidget extends StatelessWidget {
  const FoodItemCardWidget({super.key, required this.item});

  final ItemModel item;

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
              item.image,
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
                  item.name,
                  style: Styles.font18W600.copyWith(color: Colors.white),
                ),
                verticalSpace(8),

                // Price
                Text(
                  '₹ ${item.price}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          BlocListener<AddCartItemCubit, AddCartItemState>(
            listener: (context, state) {
              if (state is AddCartItemError) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(state.errorMessage)));
              }
            },
            child: InkWell(
              onTap: () {
                context.read<AddCartItemCubit>().addItemToCart(
                  item: CartItem(
                    name: item.name,
                    price: item.price,
                    imageUrl: item.image,
                    quantity: 1,
                  ),
                );
              },
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
          ),
        ],
      ),
    );
  }
}
