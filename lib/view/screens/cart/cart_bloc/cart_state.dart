


import '../../../../model/data_provider/product_dto.dart';

abstract class CartState {}

class CartInitial extends CartState {}

class CartLoading extends CartState {}

class CartLoaded extends CartState {
  final List<ProductDto> cartItems;

  CartLoaded(this.cartItems);
}

class CartError extends CartState {
  final String message;

  CartError(this.message);
}