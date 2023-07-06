import 'package:flutter/material.dart';
import 'package:neuimart_project/view/screens/profile/profile_without_login/profile_without_login.dart';

import 'Utils_Profile/colors.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.scaffoldBGColor,
      appBar: AppBar(
        backgroundColor: AppColor.whiteColor,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColor.heading6),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text("Profile", style: TextStyle(
          fontSize: 14.5,
          letterSpacing: 0.15,
          color:AppColor.heading6
        ),),
      ),
        body: SingleChildScrollView(child: ProfileWithoutLogin()),);
  }
}
