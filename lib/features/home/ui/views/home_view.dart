import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant_app/core/utils/styles.dart';
import 'package:restaurant_app/features/home/data/models/item_model.dart';
import 'package:restaurant_app/features/home/ui/constant.dart';
import 'package:restaurant_app/features/home/ui/cubits/get_cart_item.dart/get_cart_tem_cubit.dart';
import 'package:restaurant_app/features/home/ui/cubits/get_items_cubit/get_items_cubit.dart';
import 'package:uuid/uuid.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int selectedIndex = 0;

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => GetItemsCubit()..getItems()),
        BlocProvider(create: (context) => GetCartITemCubit()..getCartItems()),
      ],
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            final id = const Uuid().v4();
            FirebaseFirestore.instance
                .collection('items')
                .doc(id)
                .set(
                  ItemModel(
                    id: id,
                    name: 'item7',
                    price: 350,
                    image:
                        'https://images.unsplash.com/photo-1546833999-b9f581a1996d?w=300&h=300&fit=crop',
                  ).toJson(),
                );
          },
        ),
        appBar: AppBar(
          title: Text('Welcome !!', style: Styles.font14bold),
          backgroundColor: Colors.black54,
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: HomeConstants.pages.elementAt(selectedIndex),
        ),
        bottomNavigationBar: homeBottomNavigationBar(),
      ),
    );
  }

  BottomNavigationBar homeBottomNavigationBar() {
    return BottomNavigationBar(
      items: [
        const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        const BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart),
          label: 'Cart',
        ),
      ],
      currentIndex: selectedIndex,
      onTap: (value) => onItemTapped(value),
    );
  }
}
