import 'package:flutter/material.dart';
import 'package:shopping_cart_neuiton/screens/home_screen.dart';
import 'package:shopping_cart_neuiton/screens/login/login.dart';
import 'package:shopping_cart_neuiton/screens/login/otp.dart';
import 'package:shopping_cart_neuiton/screens/products/product_details.dart';
import 'package:shopping_cart_neuiton/screens/products/product_list.dart';


void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Myntra',
      theme: ThemeData(
        primaryColor: Colors.pinkAccent,
        hintColor: Colors.white,
      ),
      home: Login(),
      routes: {
        Login.routeName: (ctx) => Login(),
        Otp.routeName: (ctx) => Otp(),
        HomeScreen.routeName: (ctx) => HomeScreen(),
        ProductList.routeName: (ctx) => ProductList(),
        ProductDetails.routeName: (ctx) => ProductDetails(),
      },
    );
  }
}
