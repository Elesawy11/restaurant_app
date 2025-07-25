import 'package:flutter/material.dart';

class HomeBottomNavigationBar extends StatelessWidget {
  const HomeBottomNavigationBar({super.key, required this.selectedIndex});

  final ValueNotifier<int> selectedIndex;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: [
        const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
        const BottomNavigationBarItem(
          icon: Icon(Icons.shopping_cart),
          label: 'Cart',
        ),
      ],
      currentIndex: selectedIndex.value,
      onTap: (value) {
        selectedIndex.value = value;
      },
    );
  }
}
