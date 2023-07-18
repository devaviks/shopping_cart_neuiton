class Order {
  final String orderId;
  final List<OrderItem> items;
  final String orderDate;
  final String deliveryDate;
  final bool isDelivered;

  Order({
    required this.orderId,
    required this.items,
    required this.orderDate,
    required this.deliveryDate,
    required this.isDelivered,
  });

  double getTotalPrice() {
    double totalPrice = 0.0;
    for (var item in items) {
      totalPrice += item.price;
    }
    return totalPrice;
  }
}

class OrderItem {
  final String itemName;
  final String itemImage;
  final double price;

  OrderItem({
    required this.itemName,
    required this.itemImage,
    required this.price,
  });
}