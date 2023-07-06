import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

import '../../../profile/Utils_Profile/colors.dart';

class CartOffers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: AppColor.whiteColor,
          child: Row(
            children: [
              Container(
                  padding: EdgeInsets.all(12),
                  child: Icon(Icons.discount_outlined)),
              Text(
                "Available Offers",
                style: TextStyle(
                    fontSize: 12.5,
                    color: AppColor.fontColor,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        Container(
          color: AppColor.whiteColor,
          padding: EdgeInsets.only(left: 12, right: 12, bottom: 12),
          child: ReadMoreText(
            '• 15% Instant Discount on AU Credit Cards on a min spend of Rs 2,000 & also get 2% cashback on your all spendings. TCA\n'
            '\n'
            '• 15% Instant Discount on AU Credit Cards on a min spend of Rs 2,000 & also get 2% cashback on your all spendings. TCA\n'
            '\n'
                '• 15% Instant Discount on AU Credit Cards on a min spend of Rs 2,000 & also get 2% cashback on your all spendings. TCA\n'
            '\n'
            '• 15% Instant Discount on AU Credit Cards on a min spend of Rs 2,000 & also get 2% cashback on your all spendings. TCA\n'
            '\n'
                '• 15% Instant Discount on AU Credit Cards on a min spend of Rs 2,000 & also get 2% cashback on your all spendings. TCA  ',
            style: TextStyle(
              fontSize: 10,
              color: AppColor.heading6
            ),
            trimLines: 2,
            colorClickableText: Colors.pink,
            trimMode: TrimMode.Line,
            trimCollapsedText: 'Show more',
            trimExpandedText: 'Show less',
            moreStyle: TextStyle(fontSize: 11.5, fontWeight: FontWeight.bold, color: AppColor.redColor),
          ),
        )
      ],
    );
  }
}
