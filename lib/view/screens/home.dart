import 'package:flutter/material.dart';
import 'package:flutter_swiper_null_safety/flutter_swiper_null_safety.dart';
import 'package:neuimart_project/view/screens/search_page.dart';
import 'package:neuimart_project/view/screens/wishlist/wishlist.dart';

import '../../model/common_widgets/cached_image.dart';
import '../../model/data_provider/home_data.dart';
import '../../model/data_provider/product_data.dart';
import '../../model/data_provider/product_dto.dart';
import '../utils/asset_constants.dart';
import 'cart/cart_ui/cart.dart';
import 'drawer.dart';
import 'notification_panel.dart';

class Home extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _openDrawer() {
    _scaffoldKey.currentState?.openDrawer();
  }

  void _openSearchPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SearchPage()),
    );
  }

  void _notificationPanelPage(BuildContext context) {
    List<ProductDto> products = ProductData.getProductsListData();
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => NotificationPage(products: products),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        drawer: CustomDrawer(),
        body: SafeArea(
          child: Column(
            children: [
              Container(
                color: Theme.of(context).hintColor,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        IconButton(
                            icon: Icon(Icons.menu),
                            onPressed: () {
                              _openDrawer();
                            }),
                        Text(
                          'Neuimart',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            letterSpacing: 0.6,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(
                            Icons.search,
                            color: Colors.black,
                          ),
                          onPressed: () {
                            _openSearchPage(context);
                          },
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.notifications,
                            color: Colors.black,
                          ),
                          onPressed: () {
                            _notificationPanelPage(context);
                          },
                        ),
                        IconButton(
                          icon: Icon(
                            Icons.favorite_border,
                            color: Colors.black,
                          ),
                          onPressed: () {
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
                          ),
                          onPressed: () {
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
              Container(
                height: 100,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: HomeData.getTopbarAssets()
                      .map((e) => CachedImage(
                            url: e,
                            height: 89,
                            width: 76,
                          ))
                      .toList(),
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 15,
                      ),
                      CachedImage(
                        url: banner1,
                        height: 361,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      CachedImage(
                        url: free_shipping,
                        height: 47,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          CachedImage(
                            url: banner2,
                            width: (MediaQuery.of(context).size.width -
                                    MediaQuery.of(context).padding.left -
                                    MediaQuery.of(context).padding.right) *
                                0.50,
                            height: 360,
                          ),
                          CachedImage(
                            url: banner3,
                            width: (MediaQuery.of(context).size.width -
                                    MediaQuery.of(context).padding.left -
                                    MediaQuery.of(context).padding.right) *
                                0.50,
                            height: 360,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      CachedImage(
                        url: biggest_offers,
                        height: 63,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        height: 275,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: HomeData.getBiggestOffers()
                              .map((e) => Padding(
                                    padding: EdgeInsets.only(right: 5, left: 5),
                                    child: CachedImage(
                                      url: e,
                                      height: 273,
                                      width: 179,
                                    ),
                                  ))
                              .toList(),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      CachedImage(
                        url: best_offers,
                        height: 63,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      buildOfferCard(context, kurta_offer, flipflop_offer,
                          watch_offer, loungewear_offer),
                      SizedBox(
                        height: 15,
                      ),
                      CachedImage(
                        url: festive_deals,
                        height: 63,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      buildOfferCard(context, seventy_off, under_399,
                          buy_1_get_1, sixty_off),
                      SizedBox(
                        height: 15,
                      ),
                      CachedImage(
                        url: daily_deals,
                        height: 63,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        height: 265,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: HomeData.getDailyDeals()
                              .map((e) => Padding(
                                    padding: EdgeInsets.only(right: 5, left: 5),
                                    child: CachedImage(
                                      url: e,
                                      height: 260,
                                      width: 171,
                                    ),
                                  ))
                              .toList(),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      CachedImage(
                        url: featured_brands,
                        height: 63,
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Container(
                        child: Swiper(
                          duration: 500,
                          itemWidth: double.infinity,
                          pagination: SwiperPagination(
                            builder: SwiperPagination.dots,
                          ),
                          itemCount: HomeData.getFeaturedBrands().length,
                          itemBuilder: (BuildContext context, int index) {
                            List<String> featuredBrands =
                                HomeData.getFeaturedBrands();
                            return CachedImage(
                              url: featuredBrands[index],
                            );
                          },
                          autoplay: true,
                        ),
                        height: 360,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        width: 50,
                        child: Divider(
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        '"The great thing about fashion is that it always looks forward"',
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Oscar De La Renta',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  Widget buildOfferCard(BuildContext context, String offer1, String offer2,
      String offer3, String offer4) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Card(
        color: Colors.white,
        margin: EdgeInsets.all(5),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CachedImage(
                  url: offer1,
                  height: 186,
                  width: (MediaQuery.of(context).size.width -
                          MediaQuery.of(context).padding.left -
                          MediaQuery.of(context).padding.right) *
                      0.45,
                ),
                CachedImage(
                  url: offer2,
                  height: 186,
                  width: (MediaQuery.of(context).size.width -
                          MediaQuery.of(context).padding.left -
                          MediaQuery.of(context).padding.right) *
                      0.45,
                ),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CachedImage(
                  url: offer3,
                  height: 186,
                  width: (MediaQuery.of(context).size.width -
                          MediaQuery.of(context).padding.left -
                          MediaQuery.of(context).padding.right) *
                      0.45,
                ),
                CachedImage(
                  url: offer4,
                  height: 186,
                  width: (MediaQuery.of(context).size.width -
                          MediaQuery.of(context).padding.left -
                          MediaQuery.of(context).padding.right) *
                      0.45,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
