import 'package:flutter/material.dart';
import 'package:shopping_cart_neuiton/screens/profile/Utils_Profile/colors.dart';

class BackButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.arrow_back,
        color: AppColor.heading6,
      ),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
  }

}