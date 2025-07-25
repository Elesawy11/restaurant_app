import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import '../../../data/models/cart_item.dart';
part 'get_cart_tem_state.dart';

class GetCartITemCubit extends Cubit<GetCartITemState> {
  GetCartITemCubit() : super(GetCartITemInitial());
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  StreamSubscription<QuerySnapshot>? _cartSubscription;
  double totalPrice = 0.0;
  List<CartItem> cartItems = [];

  Future<void> getCartItems() async {
    emit(GetCartITemLoading());
    await _cartSubscription?.cancel();

    try {
      _cartSubscription = firestore.collection('itemCart').snapshots().listen((
        snapshot,
      ) {
        final items = snapshot.docs
            .map((doc) => CartItem.fromJson(doc.data()))
            .toList();

        totalPrice = items.fold(
          0.0,
          (x, item) => x + (item.price * item.quantity),
        );

        cartItems = items;

        emit(GetCartITemSuccess(items));
      }, onError: (error) => emit(GetCartITemError(error.toString())));
    } catch (e) {
      emit(GetCartITemError(e.toString()));
    }
  }
}
