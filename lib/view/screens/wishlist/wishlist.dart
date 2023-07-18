import 'package:flutter/material.dart';
import 'package:neuimart_project/view/screens/wishlist/wishlistUI.dart';
import '../cart/cart_ui/cart.dart';
import '../profile/Utils_Profile/colors.dart';


class Wishlist extends StatefulWidget {

  @override
  State< Wishlist> createState() => _WishlistState();
}

class _WishlistState extends State< Wishlist> {
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
        title: Text("Wishlist", style: TextStyle(
            fontSize: 14.5,
            letterSpacing: 0.15,
            color:AppColor.heading6,
            fontWeight: FontWeight.bold
        ),),
        actions: [
          IconButton(
            icon: Icon(
              Icons.shopping_bag_outlined,
              color: AppColor.heading6,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Cart()),
              );
            },
          ),
        ],
      ),
      body: WishlistPage(),
    );
  }
}
