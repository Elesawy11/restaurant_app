import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_app/core/utils/styles.dart';
import 'package:restaurant_app/features/home/ui/cubits/get_cart_item.dart/get_cart_tem_cubit.dart';
import 'widgets/cart_item_widget.dart';

class MyCartPage extends StatefulWidget {
  const MyCartPage({super.key});

  @override
  _MyCartPageState createState() => _MyCartPageState();
}

class _MyCartPageState extends State<MyCartPage> {
  double totalPrice = 0;

  // void updateTotalPrice() {
  //   double total = 0;
  //   for (var item in cartItems) {
  //     total += item.price * item.quantity;
  //   }
  //   setState(() {
  //     totalPrice = total;
  //   });
  // }

  // void increaseQuantity(int id) {
  //   setState(() {
  //     cartItems.firstWhere((item) => item.id == id).quantity++;
  //     updateTotalPrice();
  //   });
  // }

  // void decreaseQuantity(int id) {
  //   setState(() {
  //     var item = cartItems.firstWhere((item) => item.id == id);
  //     if (item.quantity > 1) {
  //       item.quantity--;
  //       updateTotalPrice();
  //     }
  //   });
  // }

  // void removeItem(int id) {
  //   setState(() {
  //     cartItems.removeWhere((item) => item.id == id);
  //     updateTotalPrice();
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetCartITemCubit, GetCartITemState>(
      listener: (context, state) {
        totalPrice += context.read<GetCartITemCubit>().totalPrice;
        // item.price * item.quantity;

        if (state is GetCartITemSuccess) {
          for (var item in state.items) {}
        }
      },
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
                        return CartItemWidget(
                          item: state.items[index],
                          // decreaseQuantity: (){},
                          // increaseQuantity: increaseQuantity(item.id),
                          // removeItem: removeItem(item.id),
                        );
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
