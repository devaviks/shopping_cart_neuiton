import 'package:flutter/material.dart';
import 'package:shopping_cart_neuiton/screens/profile/Utils_Profile/colors.dart';
import 'package:shopping_cart_neuiton/screens/profile/profile_without_login/profile_without_login.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.scaffoldBGColor,
      appBar: AppBar(
        backgroundColor: AppColor.whiteColor,
        elevation: 0,
        title: Text("Profile", style: TextStyle(
          fontSize: 14.5,
          letterSpacing: 0.15,
          color:AppColor.heading6
        ),),
      ),
        body: SingleChildScrollView(child: ProfileWithoutLogin()),);
  }
}
