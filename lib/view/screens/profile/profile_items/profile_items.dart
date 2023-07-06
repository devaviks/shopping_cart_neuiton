import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Utils_Profile/colors.dart';

class ProfileItem extends StatelessWidget {
  const ProfileItem(
      {Key? key,
      required this.title,
      required this.subtitle,
      required this.leading,
      required this.isLast,
        this.onTap,
      })
      : super(key: key);

  final String title;
  final String subtitle;
  final String leading;
  final bool isLast;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
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
        ),
        isLast ? Container() : const Divider(),
      ],
    );
  }
}
