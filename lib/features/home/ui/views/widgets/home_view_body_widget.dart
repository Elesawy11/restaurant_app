import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_app/features/home/ui/cubits/get_items_cubit/get_items_cubit.dart';

import '../../../../../core/utils/spacer.dart';
import '../../../../../core/utils/styles.dart';
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
          child: BlocProvider(
            create: (context) => GetItemsCubit()..getItems(),
            child: BlocBuilder<GetItemsCubit, GetItemsState>(
              builder: (context, state) {
                return state is GetItemsSuccess
                    ? ListView.builder(
                        itemCount: state.items.length,
                        itemBuilder: (context, index) {
                          return FoodItemCardWidget(
                            imageUrl: state.items[index].image,
                            title: state.items[index].name,

                            price: state.items[index].price,
                            onTap: () {
                              print('Add to cart pressed');
                            },
                          );
                        },
                      )
                    : state is GetItemsLoading
                    ? const Center(child: CircularProgressIndicator())
                    : state is GetItemsError
                    ? Center(
                        child: Text(
                          state.errorMessage,
                          style: Styles.font14bold,
                        ),
                      )
                    : Center(
                        child: Text('No items found', style: Styles.font14bold),
                      );
              },
            ),
          ),
        ),
      ],
    );
  }
}
