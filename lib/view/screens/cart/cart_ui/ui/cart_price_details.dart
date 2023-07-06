import 'package:flutter/material.dart';

import '../../../profile/Utils_Profile/colors.dart';

class CartPriceDetails extends StatefulWidget {
  @override
  State<CartPriceDetails> createState() => _CartPriceDetailsState();
}

class _CartPriceDetailsState extends State<CartPriceDetails> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10,),
          Text("PRICE DETAILS",
            style: TextStyle(
                fontSize: 12.5,
                color: AppColor.fontColor,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10,),
          Divider(),
          SizedBox(height: 10,),
          Row(
            children: [
              Text("Total MRP"),
              Spacer(),
              Text("\$ 1,854")
            ],
          ),
          SizedBox(height: 10,),
          Row(
            children: [
              Text("Discount on MRP"),
              Spacer(),
              Text("-\$ 854")
            ],
          ),
          SizedBox(height: 10,),
          Row(
            children: [
              Text("Coupon Discount"),
              Spacer(),
              Text("Apply Coupon",
                style: TextStyle(
                  fontSize: 12.5,
                  color: AppColor.redColor,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
          SizedBox(height: 10,),
          Row(
            children: [
              Text("Delivery Fee"),
              Spacer(),
              Text("FREE",
                style: TextStyle(
                  fontSize: 11.5,
                  color: AppColor.redColor,
                ),
              )
            ],
          ),
          SizedBox(height: 10,),
          Divider(),
          SizedBox(height: 10,),
          Row(
            children: [
              Text("Total Amount",
                  style: TextStyle(
                      fontSize: 14.5,
                      color: AppColor.fontColor,
                      fontWeight: FontWeight.bold)
              ),
              Spacer(),
              Text("\$ 1,000",
                  style: TextStyle(
                      fontSize: 14.5,
                      color: AppColor.fontColor,
                      fontWeight: FontWeight.bold)
              ),
              SizedBox(height: 15,)
            ],
          )
        ],
      ),
    );
  }
}
