import 'package:flutter/material.dart';
import 'package:neuimart_project/view/screens/wishlist/wishlist.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'becomeseller/become_seller.dart';
import 'cart/cart_ui/cart.dart';
import 'login/login.dart';

class CustomDrawer extends StatelessWidget {
  void _showLogoutConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Logout'),
          content: Text('Do you want to logout?'),
          actions: [
            TextButton(
              child: Text('No'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Yes'),
              onPressed: () async {
                // Perform logout and clear mobile number
                final prefs = await SharedPreferences.getInstance();
                await prefs.setBool('isLoggedIn', false);
                await prefs.remove('mobileNumber');

                Navigator.of(context).pushNamedAndRemoveUntil(
                  Login.routeName,
                      (route) => false,
                );
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  'https://img.traveltriangle.com/blog/wp-content/uploads/2020/01/cover-for-Shopping-In-Coonoor_30th-Jan.jpg',
                ),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              alignment: Alignment.bottomLeft,
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.white,
                    // Replace with user profile image
                    backgroundImage: AssetImage('assets/icons/user.png'),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'John Doe',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'johndoe@example.com',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.home,
              color: Color.fromRGBO(255, 63, 108, 1),
            ),
            title: Text(
              'Home',
              style: TextStyle(color: Colors.black),
            ),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/home');
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(
              Icons.favorite,
              color: Color.fromRGBO(255, 63, 108, 1),
            ),
            title: Text(
              'Favorites',
              style: TextStyle(color: Colors.black),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Wishlist()),
              );
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(
              Icons.shopping_bag,
              color: Color.fromRGBO(255, 63, 108, 1),
            ),
            title: Text(
              'Cart',
              style: TextStyle(color: Colors.black),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Cart()),
              );
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(
              Icons.settings,
              color: Color.fromRGBO(255, 63, 108, 1),
            ),
            title: Text(
              'Settings',
              style: TextStyle(color: Colors.black),
            ),
            onTap: () {
              // Handle settings tap
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(
              Icons.help,
              color: Color.fromRGBO(255, 63, 108, 1),
            ),
            title: Text(
              'Become a Seller',
              style: TextStyle(color: Colors.black),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BecomeSellerPage()),
              );
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(
              Icons.logout_outlined,
              color: Color.fromRGBO(255, 63, 108, 1),
            ),
            title: Text(
              'Logout',
              style: TextStyle(color: Colors.black),
            ),
            onTap: () {
              _showLogoutConfirmation(context);
            },
          ),
          Divider(),
        ],
      ),
    );
  }
}
