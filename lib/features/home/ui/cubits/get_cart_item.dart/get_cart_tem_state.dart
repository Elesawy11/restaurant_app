part of 'get_cart_tem_cubit.dart';

@immutable
sealed class GetCartITemState {}

final class GetCartITemInitial extends GetCartITemState {}
final class GetCartITemLoading extends GetCartITemState {}
final class GetCartITemSuccess extends GetCartITemState {
  final List<CartItem> items;

  GetCartITemSuccess(this.items);
}
final class GetCartITemError extends GetCartITemState {
  final String errorMessage;

  GetCartITemError(this.errorMessage);
}
