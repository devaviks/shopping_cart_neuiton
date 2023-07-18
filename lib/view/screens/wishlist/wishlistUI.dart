import 'package:flutter/material.dart';

import '../../../model/common_widgets/cached_image.dart';
import '../../../model/data_provider/product_data.dart';
import '../../../model/data_provider/product_dto.dart';

class WishlistPage extends StatefulWidget {
  @override
  _WishlistPageState createState() => _WishlistPageState();
}

class _WishlistPageState extends State<WishlistPage> {
  bool isWishlist = false;
  List<ProductDto> wishlistItems = ProductData.getProductsListData();

  List<String> categories = [
    'All',
    'Shoes',
    'Dresses',
    'T-shirts',
    'Jeans',
    'Accessories',
    'Bags',
    'Watches',
    'Sunglasses',
  ];

  String selectedCategory = 'All';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10),
          Container(
            height: 30,
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 8),
                  padding: EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                    color: Color.fromRGBO(255, 63, 108, 1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      'Collections',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 12
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: categories.map((category) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedCategory = category;
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 8),
                            padding: EdgeInsets.symmetric(horizontal: 16),
                            decoration: BoxDecoration(
                              color: selectedCategory == category
                                  ? Color.fromRGBO(255, 63, 108, 1)
                                  : Colors.grey[300],
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                              child: Text(
                                category,
                                style: TextStyle(
                                  color: selectedCategory == category
                                      ? Colors.white
                                      : Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
          Expanded(
            child: SingleChildScrollView(
              child: GridView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.65,
                  crossAxisSpacing: 1,
                  mainAxisSpacing: 1,
                ),
                itemCount: wishlistItems.length,
                itemBuilder: (context, index) {
                  final product = wishlistItems[index];
                  return Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 8,
                              child: CachedImage(
                                url: product.imageUrl,
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Padding(
                                padding:
                                EdgeInsets.only(top: 5, left: 10, right: 10, bottom: 5),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: Text(
                                            '${product.name}',
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ),
                                        isWishlist
                                            ? InkWell(
                                          onTap: () {
                                            setState(() {
                                              isWishlist = !isWishlist;
                                            });
                                          },
                                          child: Icon(
                                            Icons.favorite,
                                            color: Colors.red,
                                            size: 20,
                                          ),
                                        )
                                            : InkWell(
                                          onTap: () {
                                            setState(() {
                                              isWishlist = !isWishlist;
                                            });
                                          },
                                          child: Icon(
                                            Icons.favorite_border,
                                            size: 20,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      '${product.description}',
                                      style: TextStyle(
                                        fontSize: 10,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          '₹ ${product.price}',
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.black,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 2,
                                        ),
                                        Text(
                                          '₹ ${product.mrpPrice}',
                                          style: TextStyle(
                                            fontSize: 12,
                                            decoration: TextDecoration.lineThrough,
                                            color: Colors.grey,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 2,
                                        ),
                                        Text(
                                          '${product.discountString}',
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Color.fromRGBO(255, 144, 90, 1),
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
