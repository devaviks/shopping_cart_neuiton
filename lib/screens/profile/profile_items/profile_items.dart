import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shopping_cart_neuiton/screens/profile/Utils_Profile/colors.dart';

class ProfileItem extends StatelessWidget {
  const ProfileItem(
      {Key? key,
      required this.title,
      required this.subtitle,
      required this.leading,
      required this.isLast,
      })
      : super(key: key);

  final String title;
  final String subtitle;
  final String leading;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 68,
          child: ListTile(
            leading: Image(
              image: AssetImage(leading),
              width: 30,
              height: 30,
            ),
            title: Text(
              title,
              style: TextStyle(fontSize: 14, color: AppColor.bodyColor1),
            ),
            subtitle: Text(
              subtitle,
              style: TextStyle(fontSize: 11, color: AppColor.captionColor),
            ),
            trailing: Icon(
              CupertinoIcons.chevron_forward,
              size: 16,
            ),
          ),
        ),
        isLast ? Container() : const Divider(),
      ],
    );
  }
}
