import 'package:flutter/material.dart';
import '../../profile/Utils_Profile/colors.dart';
import 'ui/cartUI.dart';

class Cart extends StatefulWidget {

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
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
        title: Text("SHOPPING BAG", style: TextStyle(
            fontSize: 14.5,
            letterSpacing: 0.15,
            color:AppColor.heading6,
          fontWeight: FontWeight.bold
        ),),
        actions: [
          IconButton(
            icon: Icon(
              Icons.favorite_border,
              color: AppColor.heading6,
            ),
            onPressed: () {},
          ),
        ],
      ),
        body: CartPage(),
    );
  }
}
