import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/models/cart_item.dart';
import '../../cubits/cart_item_edit_cubit/cart_item_edit_cubit.dart';

class CustomDecreaseAndIncreaseWidget extends StatelessWidget {
  const CustomDecreaseAndIncreaseWidget({super.key, required this.item});

  final CartItem item;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<CartItemEditCubit>();
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[800],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: () => cubit.decreaseQuantity(item: item),
            icon: const Icon(Icons.remove, color: Colors.white, size: 18),
            constraints: const BoxConstraints(minWidth: 32, minHeight: 32),
            padding: EdgeInsets.zero,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              '${item.quantity}',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          IconButton(
            onPressed: () => cubit.increaseQuantity(item: item),
            icon: const Icon(Icons.add, color: Colors.white, size: 18),
            constraints: const BoxConstraints(minWidth: 32, minHeight: 32),
            padding: EdgeInsets.zero,
          ),
        ],
      ),
    );
  }
}
