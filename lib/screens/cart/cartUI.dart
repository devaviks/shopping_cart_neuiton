import 'package:flutter/material.dart';
import 'package:shopping_cart_neuiton/data_provider/product_dto.dart';
import 'package:shopping_cart_neuiton/screens/profile/Utils_Profile/colors.dart';

import '../../data_provider/product_data.dart';
import 'cart_content.dart';
import 'cart_offers.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<ProductDto> products = ProductData.getProductsListData();
    return Column(
      children: [
        SizedBox(height: 15,),
        Container(
          color: AppColor.whiteColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.all(12),
                child: Text(
                  "Check delivery time & services",
                  style: TextStyle(
                    fontSize: 12.5,
                    color: AppColor.fontColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(12),
                child: Text(
                  "ENTER PIN CODE",
                  style: TextStyle(
                    fontSize: 10.5,
                    color: AppColor.redColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 15,),
        CartOffers(),
        SizedBox(height: 15,),
        Expanded(
          child: ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              return CartContent(products[index]);
            },
          ),
        ),
      ],
    );
  }
}