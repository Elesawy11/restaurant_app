import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_app/core/utils/styles.dart';
import 'package:restaurant_app/features/home/ui/cubits/get_cart_item.dart/get_cart_tem_cubit.dart';
import 'widgets/cart_item_widget.dart';

class MyCartPage extends StatelessWidget {
  const MyCartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetCartITemCubit, GetCartITemState>(
      builder: (context, state) {
        final cubit = context.read<GetCartITemCubit>();
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('My Cart: ', style: Styles.font18W600),
            // Price Row
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Price',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    '₹ ${cubit.totalPrice}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            state is GetCartITemSuccess
                ? Expanded(
                    child: ListView.builder(
                      itemCount: state.items.length,
                      itemBuilder: (context, index) {
                        return CartItemWidget(item: state.items[index]);
                      },
                    ),
                  )
                : state is GetCartITemLoading
                ? const Center(child: CircularProgressIndicator())
                : const SizedBox.shrink(),
          ],
        );
      },
    );
  }
}
