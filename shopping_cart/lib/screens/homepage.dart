import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../screens/cart_screen.dart';
import '../screens/product_overview_screen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _index = 0;
  final _pages = [
    ProductOverviewScreen(),
    CartScreen(),
    Center(
      child: Text('Coming Soon!'),
    ),
    Center(
      child: Text('Coming Soon!'),
    ),
  ];

  void onTap(int index) {
    setState(() {
      _index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages.elementAt(_index),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
        child: GNav(
            selectedIndex: _index,
            onTabChange: (int value) {
              setState(() {
                _index = value;
              });
            },
            backgroundColor: Colors.grey.shade200,
            activeColor: Colors.pinkAccent,
            tabBackgroundColor: Colors.white,
            rippleColor: Colors.pinkAccent,
            padding: const EdgeInsets.all(22),
            tabs: [
              GButton(
                icon: Icons.home,
                haptic: true,
                text: 'Home',
              ),
              GButton(
                icon: Icons.shopping_cart,
                haptic: true,
                text: 'Cart',
              ),
              GButton(
                icon: Icons.search,
                text: 'Search',
              ),
              GButton(
                icon: Icons.person,
                text: 'Profile',
              )
            ]),
      ),
    );
  }
}
