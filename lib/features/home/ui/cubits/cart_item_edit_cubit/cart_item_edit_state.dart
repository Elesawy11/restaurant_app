part of 'cart_item_edit_cubit.dart';

@immutable
sealed class CartItemEditState {}

final class CartItemEditInitial extends CartItemEditState {}
final class CartItemEditLoading extends CartItemEditState {}
final class CartItemEditSuccess extends CartItemEditState {}
final class CartItemEditError extends CartItemEditState {
  final String errorMessage;

  CartItemEditError(this.errorMessage);
}
