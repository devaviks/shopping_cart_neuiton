import 'dart:async';

import '../../../../model/data_provider/product_dto.dart';

class CartBLoC {
  // StreamController for cart items
  StreamController<List<ProductDto>> _cartStreamController =
  StreamController<List<ProductDto>>.broadcast();

  // List to store cart items
  List<ProductDto> _cartItems = [];

  // Stream getter to listen to cart items
  Stream<List<ProductDto>> get cartStream => _cartStreamController.stream;

  // Getter to access the cart items
  List<ProductDto> get cartItems => _cartItems;

  // Add item to cart
  void addToCart(ProductDto product) {
    _cartItems.add(product);
    _cartStreamController.add(_cartItems);
  }

  // Remove item from cart
  void removeFromCart(ProductDto product) {
    _cartItems.remove(product);
    _cartStreamController.add(_cartItems);
  }

  // Dispose the stream controller
  void dispose() {
    _cartStreamController.close();
  }
}