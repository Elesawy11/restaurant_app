part of 'add_cart_item_cubit.dart';

@immutable
sealed class AddCartItemState {}

final class AddCartItemInitial extends AddCartItemState {}
final class AddCartItemLoading extends AddCartItemState {}
final class AddCartItemSuccess extends AddCartItemState {}
final class AddCartItemError extends AddCartItemState {
  final String errorMessage;

  AddCartItemError(this.errorMessage);
}
