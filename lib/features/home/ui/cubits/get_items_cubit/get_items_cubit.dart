import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import 'package:restaurant_app/features/home/data/models/item_model.dart';

part 'get_items_state.dart';

class GetItemsCubit extends Cubit<GetItemsState> {
  GetItemsCubit() : super(GetItemsInitial());
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  Future<void> getItems() async {
    emit(GetItemsLoading());

    try {
      firestore.collection('items').snapshots().listen((snapshot) {
        List<ItemModel> items = snapshot.docs
            .map((doc) => ItemModel.fromJson(doc.data()))
            .toList();
        emit(GetItemsSuccess(items));
      });
    } catch (e) {
      emit(GetItemsError(e.toString()));
    }
  }
}
