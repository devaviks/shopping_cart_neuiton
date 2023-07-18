import 'package:flutter/material.dart';
import 'package:neuimart_project/view/screens/wishlist/wishlist.dart';

import '../cart/cart_ui/cart.dart';
import '../profile/Utils_Profile/colors.dart';
import 'category.dart';

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 10, bottom: 10),
            color: Theme.of(context).hintColor,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back, color: AppColor.heading6),
                      onPressed: () => Navigator.of(context).pushReplacementNamed('/home'),
                    ),
                    SizedBox(width: 15,),
                    Text(
                      'Categories',
                      style: TextStyle(
                        color: Colors.grey.shade700,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.favorite_border,
                        color: Colors.black,
                      ), onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Wishlist()),
                      );
                    },
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.shopping_bag_outlined,
                        color: Colors.black,
                      ), onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Cart()),
                      );
                    },
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Category(
                      'BIG FASHION FESTIVAL',
                      'Top Offers, Apparel, Footware',
                      ['Top Offers', 'Men', 'Women', 'Kids', 'Festive'],
                      Colors.yellowAccent.shade100),
                  Category(
                      'WOMEN',
                      'Kurtas & Suits, Top & Tees',
                      [
                        'Westernwear',
                        'Ethnicwear',
                        'Bags, Wallets & Clutches',
                        'Jewellery'
                      ],
                      Colors.pinkAccent.shade100),
                  Category(
                      'MEN',
                      'T-Shirts, Shirts, Jeans',
                      ['Topwear', 'Footwear', 'Watches', 'Sports & Activewear'],
                      Colors.orangeAccent.shade100),
                  Category(
                      'KIDS',
                      'Brands, Clothing, Footwear',
                      ['Explore Kids Store', 'Infants', 'Masks'],
                      Colors.purpleAccent.shade100),
                  Category(
                      'NEUIMART MALL',
                      'H&M, Nike, Smashbox',
                      ['Explore Myntra Mall', 'Casio', 'HRX', 'Nike', 'Wrogn'],
                      Colors.pink.shade100),
                  Category(
                      'GADGETS',
                      'Head phones, Smart wearables',
                      [
                        'Smart Wearables',
                        'Audio & Hearables',
                        'Mobile Accessories'
                      ],
                      Colors.teal.shade100),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
