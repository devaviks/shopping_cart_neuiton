import 'package:flutter/material.dart';
import 'package:shopping_cart_neuiton/screens/profile/Utils_Profile/colors.dart';

class ProfileTextButton extends StatelessWidget {
  const ProfileTextButton({Key? key, required this.text}) : super(key: key);
  final String text;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: InkWell(
        onTap: () {},
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 60),
          width: MediaQuery.of(context).size.width,
          child: Text(
            text,
            style: TextStyle(
                fontSize: 11.5,
                fontWeight: FontWeight.w600,
                color: AppColor.heading6),
          ),
        ),
      ),
    );
  }
}
