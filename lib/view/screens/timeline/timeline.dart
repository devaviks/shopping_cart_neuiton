import 'package:flutter/material.dart';
import 'package:neuimart_project/view/screens/timeline/timeline_screen.dart';
import '../profile/Utils_Profile/colors.dart';
import '../wishlist/wishlist.dart';


class Timeline extends StatefulWidget {

  @override
  State<Timeline> createState() => _TimelineState();
}

class _TimelineState extends State<Timeline> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.scaffoldBGColor,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColor.heading6),
          onPressed: () => Navigator.of(context).pushReplacementNamed('/home'),
        ),
        backgroundColor: AppColor.whiteColor,
        elevation: 0,
        title: Text("TIMELINE", style: TextStyle(
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
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Wishlist()),
              );
            },
          ),
        ],
      ),
      body: TimelineScreen(),
    );
  }
}
