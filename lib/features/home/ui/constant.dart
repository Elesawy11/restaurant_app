import 'package:flutter/material.dart';

import 'views/cart_view.dart';
import 'views/widgets/home_view_body_widget.dart';

class HomeConstants {
  HomeConstants._();
  static const List<Widget> pages = [HomeViewBodyWidget(), MyCartPage()];
}
