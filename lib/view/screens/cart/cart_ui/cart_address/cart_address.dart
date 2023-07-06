import 'package:flutter/material.dart';


import '../../../profile/Utils_Profile/colors.dart';
import 'cart_add_ui.dart';


class CartAddressSelection extends StatefulWidget {
  static const routeName = 'CartAdd';


  @override
  State<CartAddressSelection> createState() => _CartAddressSelectionState();
}

class _CartAddressSelectionState extends State<CartAddressSelection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF2F2F2),
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColor.heading6),
          onPressed: () => Navigator.of(context).pop(),
        ),
        backgroundColor: AppColor.whiteColor,
        elevation: 0,
        title: Text("ADDRESS BOOK", style: TextStyle(
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
      body: AddressPage(),
    );
  }
}
