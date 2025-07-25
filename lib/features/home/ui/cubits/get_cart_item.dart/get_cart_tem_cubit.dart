import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

import '../../../data/models/cart_item.dart';

part 'get_cart_tem_state.dart';

class GetCartITemCubit extends Cubit<GetCartITemState> {
  GetCartITemCubit() : super(GetCartITemInitial());
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<void> getCartItems() async {
    emit(GetCartITemLoading());

    try {
      firestore.collection('itemCart').snapshots().listen((snapshot) {
        List<CartItem> items = snapshot.docs
            .map((doc) => CartItem.fromJson(doc.data()))
            .toList();
        emit(GetCartITemSuccess(items));
      });
    } catch (e) {
      emit(GetCartITemError(e.toString()));
    }
  }
}
