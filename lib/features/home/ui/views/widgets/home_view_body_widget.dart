import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:restaurant_app/features/home/ui/cubits/add_cart_item_cubit/add_cart_item_cubit.dart';
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
          child: BlocBuilder<GetItemsCubit, GetItemsState>(
            builder: (context, state) {
              return state is GetItemsSuccess
                  ? ListView.builder(
                      itemCount: state.items.length,
                      itemBuilder: (context, index) {
                        return BlocProvider(
                          create: (context) => AddCartItemCubit(),
                          child: FoodItemCardWidget(
                            item: state.items[index],
                            
                          ),
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
      ],
    );
  }
}
