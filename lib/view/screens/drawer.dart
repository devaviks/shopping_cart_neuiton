import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage('https://img.traveltriangle.com/blog/wp-content/uploads/2020/01/cover-for-Shopping-In-Coonoor_30th-Jan.jpg'),
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
            leading: Icon(Icons.home, color: Color.fromRGBO(255, 63, 108, 1),),
            title: Text(
              'Home',
              style: TextStyle(color: Colors.black),
            ),
            onTap: () {
              // Handle home tap
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.favorite, color: Color.fromRGBO(255, 63, 108, 1),),
            title: Text(
              'Favorites',
              style: TextStyle(color: Colors.black),
            ),
            onTap: () {
              // Handle favorites tap
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.shopping_cart, color: Color.fromRGBO(255, 63, 108, 1),),
            title: Text(
              'Cart',
              style: TextStyle(color: Colors.black),
            ),
            onTap: () {
              // Handle cart tap
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.settings, color: Color.fromRGBO(255, 63, 108, 1),),
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
            leading: Icon(Icons.help, color: Color.fromRGBO(255, 63, 108, 1),),
            title: Text(
              'Become a Seller',
              style: TextStyle(color: Colors.black),
            ),
            onTap: () {
              // Handle help & support tap
            },
          ),
          Divider(),
        ],
      ),
    );
  }
}