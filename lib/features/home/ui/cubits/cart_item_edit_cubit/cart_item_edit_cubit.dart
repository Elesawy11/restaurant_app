import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import '../../../data/models/cart_item.dart';
part 'cart_item_edit_state.dart';

class CartItemEditCubit extends Cubit<CartItemEditState> {
  CartItemEditCubit() : super(CartItemEditInitial());
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> removeItem({required String id}) async {
    emit(CartItemEditLoading());
    try {
      await firestore.collection('itemCart').doc(id).delete();
      emit(CartItemEditSuccess());
    } catch (e) {
      emit(CartItemEditError(e.toString()));
    }
  }

  Future<void> decreaseQuantity({required CartItem item}) async {
    emit(CartItemEditLoading());
    try {
      if (item.quantity <= 1) {
      } else {
        await firestore.collection('itemCart').doc(item.id).update({
          'quantity': item.quantity - 1,
        });
        emit(CartItemEditSuccess());
      }
    } catch (e) {
      emit(CartItemEditError(e.toString()));
    }
  }

  Future<void> increaseQuantity({required CartItem item}) async {
    emit(CartItemEditLoading());
    try {
      await firestore.collection('itemCart').doc(item.id).update({
        'quantity': item.quantity + 1,
      });
      emit(CartItemEditSuccess());
    } catch (e) {
      emit(CartItemEditError(e.toString()));
    }
  }
}
//commit