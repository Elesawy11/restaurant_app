import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../data/models/cart_item.dart';
import '../../../data/models/item_model.dart';
import '../../cubits/add_cart_item_cubit/add_cart_item_cubit.dart';
import '../../cubits/get_cart_item.dart/get_cart_tem_cubit.dart';

class AddCartITemBlocListener extends StatelessWidget {
  const AddCartITemBlocListener({super.key, required this.item});

  final ItemModel item;

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddCartItemCubit, AddCartItemState>(
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
              id: item.id,
              name: item.name,
              price: item.price,
              imageUrl: item.image,
              quantity: 1,
            ),
            list: context.read<GetCartITemCubit>().cartItems,
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
    );
  }
}
