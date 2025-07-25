import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import 'package:restaurant_app/features/home/data/models/cart_item.dart';

part 'add_cart_item_state.dart';

class AddCartItemCubit extends Cubit<AddCartItemState> {
  AddCartItemCubit() : super(AddCartItemInitial());
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  Future<void> addItemToCart({required CartItem item}) async {
    emit(AddCartItemLoading());
    try {
      await firestore.collection('itemCart').add(item.toJson());

      emit(AddCartItemSuccess());
    } catch (e) {
      emit(AddCartItemError(e.toString()));
    }
  }
}
