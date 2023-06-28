import 'package:flutter/material.dart';
import 'package:shopping_cart_neuiton/screens/profile/Utils_Profile/colors.dart';
import 'package:shopping_cart_neuiton/screens/profile/profile_content/profile_content.dart';
import 'package:shopping_cart_neuiton/screens/profile/profile_items/profile_items.dart';

class ProfileWithoutLogin extends StatelessWidget {
  final double TopContainerHeight = 190;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: TopContainerHeight,
          child: Stack(
            children: [
              Column(
                children: [
                  Container(
                    height: TopContainerHeight * .58,
                    color: AppColor.dummyBGColor,
                  ),
                  Container(
                    height: TopContainerHeight * .42,
                    color: AppColor.whiteColor,
                  ),
                ],
              ),
              Positioned(
                bottom: 20,
                left: 20,
                child: Container(
                  height: 132,
                  width: 132,
                  child: Card(
                    child: Container(
                        padding: EdgeInsets.all(25),
                        child: Image.asset("assets/icons/user.png")),
                  ),
                ),
              ),
              Positioned(
                  bottom: 22,
                  left: 170,
                  child: ElevatedButton(
                      onPressed: () {},
                      style: ButtonStyle(
                        elevation: MaterialStateProperty.all(0),
                          backgroundColor:
                              MaterialStateProperty.all(AppColor.buttonColor),
                          textStyle: MaterialStateProperty.all(TextStyle(
                            fontSize: 12.5,
                            fontWeight: FontWeight.w600,
                          ))),
                      child: Container(
                          width: MediaQuery.of(context).size.width - 215,
                          height: 45,
                          child: Center(child: Text("LOG IN/SIGN UP"))
                      ))
              ),
            ],
          ),
        ),
        SizedBox(
          height: 18,
        ),
        Container(
          color: AppColor.whiteColor,
          child: Column(
            children: const [
              ProfileItem(
                title: "Orders",
                subtitle: "Check your order status",
                leading: "assets/icons/package.png",
                isLast: false,
              ),
              ProfileItem(
                title: "Help Center",
                subtitle: "Help regarding your recent purchases",
                leading: "assets/icons/center.png",
                isLast: false,
              ),
              ProfileItem(
                title: "Wishlist",
                subtitle: "Your most loved styles",
                leading: "assets/icons/heart.png",
                isLast: true,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 18,
        ),
        Container(
          color: AppColor.whiteColor,
          child: Column(
            children: const [
              ProfileItem(
                title: "Scan for coupon",
                subtitle: " ",
                leading: "assets/icons/qr-code.png",
                isLast: false,
              ),
              ProfileItem(
                title: "Refer & Earn",
                subtitle: " ",
                leading: "assets/icons/change.png",
                isLast: true,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 18,
        ),
        ProfileContent(),
        SizedBox(
          height: 50,
        ),
        Text("APP VERSION 0.0.1",
        style: Theme.of(context).textTheme.labelSmall,
        ),
        SizedBox(
          height: 80,
        ),
      ],
    );
  }
}
