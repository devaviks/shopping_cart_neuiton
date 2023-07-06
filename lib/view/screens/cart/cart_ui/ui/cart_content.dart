import 'package:flutter/material.dart';

import '../../../../../model/data_provider/product_data.dart';
import '../../../../../model/data_provider/product_dto.dart';

class CartContent extends StatefulWidget {
  @override
  State<CartContent> createState() => _CartContentState();
}

class _CartContentState extends State<CartContent> {
  List<int> quantities = [];
  List<ProductDto> products = [];

  @override
  void initState() {
    super.initState();
    products = ProductData.getProductsListData();
    quantities = List<int>.filled(products.length, 1);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 310,
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: 3,
        itemBuilder: (context, index) {
          if (products.isEmpty) {
            return Container(
              height: 130,
              child: Center(
                child: Text('No products available.'),
              ),
            );
          }
          final productIndex = index % products.length;
          final price = double.parse(products[productIndex].price);
          final totalPrice = price * quantities[productIndex];
          return Container(
            color: Colors.white,
            padding: EdgeInsets.all(10),
            height: 160,
            child: Column(
              children: [
                Row(
                  children: [
                    Image.network(
                      products[productIndex].imageUrl,
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            products[productIndex].name,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Price: \$${totalPrice.toStringAsFixed(2)}',
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 13,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            products[productIndex].description,
                            style: TextStyle(
                              color: Colors.grey[400],
                              fontSize: 11,
                            ),
                          ),
                          SizedBox(height: 10),
                          Container(
                            height: 30,
                            child: ToggleButtons(
                              children: [
                                Text('S'),
                                Text('M'),
                                Text('L'),
                              ],
                              isSelected: List.generate(3, (i) => false),
                              onPressed: (int index) {},
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(width: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey[100],
                          ),
                          width: 40,
                          height: 40,
                          child: Material(
                            elevation: 2,
                            shape: CircleBorder(),
                            child: IconButton(
                              icon: Icon(
                                Icons.remove,
                                size: 24,
                              ),
                              onPressed: () {
                                setState(() {
                                  if (quantities[productIndex] > 0) {
                                    quantities[productIndex]--;
                                  }
                                });
                              },
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          quantities[productIndex].toString(),
                          style: TextStyle(fontSize: 16),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.grey[100],
                          ),
                          width: 40,
                          height: 40,
                          child: Material(
                            elevation: 2,
                            shape: CircleBorder(),
                            child: IconButton(
                              icon: Icon(
                                Icons.add,
                                size: 24,
                              ),
                              onPressed: () {
                                setState(() {
                                  quantities[productIndex]++;
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Divider(
                  thickness: 2,
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
