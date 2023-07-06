import 'package:flutter/material.dart';
import 'package:neuimart_project/view/screens/cart/cart_ui/cart_address/cart_address.dart';
import 'package:neuimart_project/view/screens/cart/cart_bloc/cart_bloc.dart';
import 'package:neuimart_project/view/screens/home_screen.dart';
import 'package:neuimart_project/view/screens/login/login-bottomsheet.dart';
import 'package:neuimart_project/view/screens/login/login.dart';
import 'package:neuimart_project/view/screens/login/otp-bottomsheet.dart';
import 'package:neuimart_project/view/screens/login/otp.dart';
import 'package:neuimart_project/view/screens/products/product_details.dart';
import 'package:neuimart_project/view/screens/products/product_list.dart';

import 'model/data_provider/product_dto.dart';


void main() {
  final CartBLoC cartBLoC = CartBLoC();
  final ProductDto product = ProductDto(
    'imageUrl',
    'name',
    'description',
    'price',
    'mrpPrice',
    'discountString'
  );
  runApp(App(cartBLoC: cartBLoC, product: product,));
}

class App extends StatelessWidget {
  final ProductDto product;
  final CartBLoC cartBLoC;

  App({required this.cartBLoC, required this.product});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Neuimart',
      theme: ThemeData(
        primaryColor: Colors.pinkAccent,
        hintColor: Colors.white,
      ),
      home: Login(),
      routes: {
        Login.routeName: (ctx) => Login(),
        LoginBottomSheet.routeName: (ctx) => LoginBottomSheet(),
        Otp.routeName: (ctx) => Otp(),
        OtpBottomSheet.routeName: (ctx) => OtpBottomSheet(),
        HomeScreen.routeName: (ctx) => HomeScreen(),
        ProductList.routeName: (ctx) => ProductList(),
        ProductDetails.routeName: (ctx) => ProductDetails(cartBLoC: cartBLoC, product: product),
        CartAddressSelection.routeName: (ctx) => CartAddressSelection(),
      },
    );
  }
}
