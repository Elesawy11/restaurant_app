import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_app/features/home/ui/cubits/cart_item_edit_cubit/cart_item_edit_cubit.dart';
import 'views/cart_view.dart';
import 'views/widgets/home_view_body_widget.dart';

class HomeConstants {
  HomeConstants._();
  static List<Widget> pages = [
    const HomeViewBodyWidget(),

    BlocProvider(
      create: (context) => CartItemEditCubit(),
      child: const MyCartPage(),
    ),
  ];
}
