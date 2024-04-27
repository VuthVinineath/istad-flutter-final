import 'package:ecommerce_clothes/views/cart/cart.dart';
import 'package:ecommerce_clothes/views/home/home.dart';
import 'package:ecommerce_clothes/views/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'views/category/category.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    )
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // Variable Declaration
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IndexedStack(
          index: selectedIndex,
          children: const [
            Homepage(),
            CategoryScreen(),
            CartScreen(),
            ProfileScreen(),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.grey.shade300,
                blurRadius: 5,
                blurStyle: BlurStyle.outer,
                spreadRadius: 1
            ),
          ],
        ),
        child: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: changeSelectedNavigation,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.black,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                FontAwesomeIcons.house,
                size: 20,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.bars, size: 20),
              label: 'Menu',
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.bagShopping, size: 20),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.solidUser, size: 20),
              label: 'profile',
            ),
          ],
        ),
      ),
    );
  }
  // --- Change Current Selected Bottom Navigation
  void changeSelectedNavigation(int value) {
    setState(() {
      selectedIndex = value;
    });
  }
}




