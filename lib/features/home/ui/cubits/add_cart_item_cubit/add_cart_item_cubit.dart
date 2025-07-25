import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import 'package:restaurant_app/features/home/data/models/cart_item.dart';
part 'add_cart_item_state.dart';

class AddCartItemCubit extends Cubit<AddCartItemState> {
  AddCartItemCubit() : super(AddCartItemInitial());
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  Future<void> addItemToCart({
    required CartItem item,
    required List<CartItem> list,
  }) async {
    emit(AddCartItemLoading());
    try {
      if (list.any((itemList) => item.id == itemList.id)) {
        emit(AddCartItemError('Item already exists in the cart'));
      } else {
        await firestore.collection('itemCart').doc(item.id).set(item.toJson());
        emit(AddCartItemSuccess());
      }
    } catch (e) {
      emit(AddCartItemError(e.toString()));
    }
  }
}
