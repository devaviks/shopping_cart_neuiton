import '../../../../model/data_provider/product_dto.dart';

abstract class CartEvent {}

class AddToCartEvent extends CartEvent {
  final ProductDto product;

  AddToCartEvent(this.product);
}

class RemoveFromCartEvent extends CartEvent {
  final ProductDto product;

  RemoveFromCartEvent(this.product);
}