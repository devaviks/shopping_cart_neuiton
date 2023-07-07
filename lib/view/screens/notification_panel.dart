import 'package:flutter/material.dart';
import 'package:neuimart_project/view/screens/profile/Utils_Profile/colors.dart';

import '../../model/data_provider/product_dto.dart';

class NotificationPage extends StatelessWidget {
  final List<ProductDto> products;

  NotificationPage({required this.products});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColor.heading6),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: AppColor.whiteColor,
        elevation: 0,
        title: Text("NOTIFICATIONS", style: TextStyle(
            fontSize: 14.5,
            letterSpacing: 0.15,
            color:AppColor.heading6,
            fontWeight: FontWeight.bold
        ),),
        actions: [
          IconButton(
            icon: Icon(
              Icons.shopping_cart_outlined,
              color: AppColor.heading6,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          ProductDto product = products[index];
          return Padding(
            padding: EdgeInsets.all(10),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: ListTile(
                contentPadding: EdgeInsets.all(0),
                leading: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: NetworkImage(product.imageUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                title: Text(
                  product.name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 4),
                    Text(
                      product.description,
                      style: TextStyle(color: Colors.grey),
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(Icons.access_time, size: 14, color: Colors.grey),
                        SizedBox(width: 4),
                        Text(
                          '12:34 PM',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}