import 'package:flutter/material.dart';

import '../../../../core/utils/spacer.dart';
import '../../../../core/utils/styles.dart';
import 'food_item_card_widget.dart';

class HomeViewBodyWidget extends StatelessWidget {
  const HomeViewBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('menu items: ', style: Styles.font18W600),
        verticalSpace(16),
        Expanded(
          child: ListView.builder(
            itemCount: 12,
            itemBuilder: (context, index) {
              return FoodItemCardWidget(
                imageUrl:
                    'https://images.unsplash.com/photo-1546833999-b9f581a1996d?w=300&h=300&fit=crop',
                title: 'Appam & Stew - 2 nos',

                price: 180,
                onTap: () {
                  print('Add to cart pressed');
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
