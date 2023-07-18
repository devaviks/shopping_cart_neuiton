import 'package:flutter/material.dart';
import '../profile/Utils_Profile/colors.dart';
import '../wishlist/wishlist.dart';
import 'my_orders_model.dart';
import 'orders_details.dart';

class MyOrdersPage extends StatelessWidget {
  final List<Order> orders = [
    Order(
      orderId: "1",
      items: [
        OrderItem(
          itemName: "Blue Denim Jacket",
          itemImage:
          "https://cdn.shopify.com/s/files/1/0454/8666/9990/files/FootFitter-clean-shoes-Instagram-glorifygifts-1024x702.png",
          price: 49.99,
        ),
        OrderItem(
          itemName: "Black Leather Boots",
          itemImage:
          "https://images-eu.ssl-images-amazon.com/images/I/71zbzwdGBJL._AC_SR462,693_.jpg",
          price: 89.99,
        ),
        OrderItem(
          itemName: "Black Leather Boots",
          itemImage:
          "https://m.media-amazon.com/images/I/81Okj7GEHwL._AC_UX575_.jpg",
          price: 89.99,
        ),
      ],
      orderDate: "2023-07-01",
      deliveryDate: "2023-07-05",
      isDelivered: true,
    ),
    Order(
      orderId: "2",
      items: [
        OrderItem(
          itemName: "Stylish Puma Boots",
          itemImage:
          "https://static.wixstatic.com/media/ba2cd3_901a55a781554866b2a079348b384ec2~mv2.png/v1/fill/w_560,h_374,al_c,q_85,usm_0.66_1.00_0.01,enc_auto/ba2cd3_901a55a781554866b2a079348b384ec2~mv2.png",
          price: 69.99,
        ),
      ],
      orderDate: "2023-07-10",
      deliveryDate: "2023-07-15",
      isDelivered: false,
    ),
    Order(
      orderId: "3",
      items: [
        OrderItem(
          itemName: "Blue Denim Jacket",
          itemImage:
          "https://static.wixstatic.com/media/ba2cd3_901a55a781554866b2a079348b384ec2~mv2.png/v1/fill/w_560,h_374,al_c,q_85,usm_0.66_1.00_0.01,enc_auto/ba2cd3_901a55a781554866b2a079348b384ec2~mv2.png",
          price: 49.99,
        ),
        OrderItem(
          itemName: "Black Leather Boots",
          itemImage:
          "https://m.media-amazon.com/images/I/81Okj7GEHwL._AC_UX575_.jpg",
          price: 89.99,
        ),
        OrderItem(
          itemName: "Black Leather Boots",
          itemImage:
          "https://images-eu.ssl-images-amazon.com/images/I/71U-6b5sHbL._AC_UL330_SR330,330_.jpg",
          price: 89.99,
        ),
      ],
      orderDate: "2023-07-01",
      deliveryDate: "2023-06-25",
      isDelivered: true,
    ),
    // Add more orders as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.scaffoldBGColor,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColor.heading6),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: AppColor.whiteColor,
        elevation: 0,
        title: Text(
          "MY ORDERS",
          style: TextStyle(
            fontSize: 14.5,
            letterSpacing: 0.15,
            color: AppColor.heading6,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.favorite_border,
              color: AppColor.heading6,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Wishlist()),
              );
            },
          ),
        ],
      ),
      body: ListView.separated(
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        itemCount: orders.length,
        separatorBuilder: (context, index) => SizedBox(height: 16),
        itemBuilder: (context, index) {
          final order = orders[index];
          return Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  offset: Offset(0, 2),
                  blurRadius: 6.0,
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Delivered on ${order.deliveryDate}',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16),
                ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: order.items.length,
                  separatorBuilder: (context, index) => Divider(),
                  itemBuilder: (context, index) {
                    final item = order.items[index];
                    return Container(
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.grey[100], // Add grey[300] background color
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: ListTile(
                        contentPadding: EdgeInsets.zero,
                        leading: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.network(
                            item.itemImage,
                            width: 70,
                            height: 70,
                            fit: BoxFit.cover,
                          ),
                        ),
                        title: Text(
                          item.itemName,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                        ),
                        subtitle: Text(
                          '₹ ${item.price.toStringAsFixed(2)}',
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Order ID: ${order.orderId}',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[600],
                      ),
                    ),
                    Text(
                      'Total: ₹ ${order.getTotalPrice().toStringAsFixed(2)}',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      order.isDelivered ? 'Delivered' : 'Pending',
                      style: TextStyle(
                        color: order.isDelivered ? Colors.green : Colors.orange,
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                    ),
                    Icon(
                      order.isDelivered ? Icons.check_circle : Icons.pending,
                      color: order.isDelivered ? Colors.green : Colors.orange,
                      size: 16,
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Container(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => OrderDetailsPage(
                            order: order,
                            orderItems: order.items, // Add orderItems parameter
                          ),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColor.buttonColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 12),
                    ),
                    child: Text(
                      'VIEW DETAILS',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
