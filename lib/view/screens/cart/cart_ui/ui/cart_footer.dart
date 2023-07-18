import 'package:flutter/material.dart';

import '../../../login/login-bottomsheet.dart';
import '../../../profile/Utils_Profile/colors.dart';

class CartFooterSection extends StatelessWidget {
  final bool isLoggedIn; // Add a boolean flag to indicate login status

  CartFooterSection({required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
      color: AppColor.scaffoldBGColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Total: \$ 1,000.00',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              if (isLoggedIn) {
                _showOrderPlacedDialog(context);
              } else {
                _showLoginBottomSheet(context);
              }
              print('Place Order button pressed');
            },
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Color.fromRGBO(255, 63, 108, 1),
              padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            child: Text(
              'Place Order',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showOrderPlacedDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Order Placed', style: TextStyle(fontWeight: FontWeight.bold),),
          content: Text('Your order has been placed.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Okay'),
            ),
          ],
        );
      },
    );
  }

  void _showLoginBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      isDismissible: true,
      builder: (BuildContext context) {
        return Container(
          height: 530, // Set the desired height of the bottom sheet
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.close),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ],
                ),
              ),
              Expanded(
                child: LoginBottomSheet(),
              ),
            ],
          ),
        );
      },
    );
  }
}
