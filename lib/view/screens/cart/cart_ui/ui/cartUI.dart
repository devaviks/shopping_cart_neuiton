import 'package:flutter/material.dart';
import '../../../profile/Utils_Profile/colors.dart';
import 'cart_content.dart';
import 'cart_footer.dart';
import 'cart_offers.dart';
import 'cart_price_details.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            child: Column(
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
                CartContent(),
                SizedBox(height: 15,),
                CartPriceDetails(),
              ],
            ),
          ),
        ),
        CartFooterSection(isLoggedIn: true,),
      ],
    );
  }
}