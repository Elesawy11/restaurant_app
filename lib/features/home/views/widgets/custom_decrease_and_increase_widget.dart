import 'package:flutter/material.dart';
import '../../data/models/cart_item.dart';

class CustomDecreaseAndIncreaseWidget extends StatelessWidget {
  const CustomDecreaseAndIncreaseWidget({
    super.key,
    required this.decreaseQuantity,
    required this.item,
    required this.increaseQuantity,
  });

  final VoidCallback? decreaseQuantity;
  final CartItem item;
  final VoidCallback? increaseQuantity;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[800],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            onPressed: () => decreaseQuantity,
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
            onPressed: () => increaseQuantity,
            icon: const Icon(Icons.add, color: Colors.white, size: 18),
            constraints: const BoxConstraints(minWidth: 32, minHeight: 32),
            padding: EdgeInsets.zero,
          ),
        ],
      ),
    );
  }
}
