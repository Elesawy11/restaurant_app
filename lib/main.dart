import 'package:flutter/material.dart';
import 'package:restaurant_app/restaurant_body.dart';

void main(List<String> args) {
  runApp(const RestaurantApp());
}

class RestaurantApp extends StatelessWidget {
  const RestaurantApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const RestaurantBody();
  }
}
