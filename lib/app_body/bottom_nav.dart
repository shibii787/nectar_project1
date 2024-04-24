
import 'package:flutter/material.dart';
import 'package:nectar_project1/app_body/cart_page.dart';
import 'package:nectar_project1/app_body/explore_page.dart';
import 'package:nectar_project1/app_profile/account.dart';
import 'package:nectar_project1/app_profile/profile_page.dart';
import 'package:nectar_project1/core/common/colors.dart';



import '../app_payment/payment1.dart';
import 'favourite_page.dart';
import 'home_page.dart';

class bottomNav extends StatefulWidget {
  const bottomNav({super.key,});

  @override
  State<bottomNav> createState() => _bottomNavState();
}

class _bottomNavState extends State<bottomNav> {

  //int bottom represents pages in the UI
  int bottom=0;

  //to add all UI pages into the bottom navigation bar
  List pages =[
    homeScreen(),
    ExplorePage(),
    CartPage(),
    FavouritePage(),
    account()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[bottom],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            bottom=value;
          });
        },
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        selectedItemColor: theColors.third,
        unselectedItemColor: theColors.secondary,
        currentIndex: bottom,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined),label: "Shop"),
          BottomNavigationBarItem(icon: Icon(Icons.manage_search),label: "Explore"),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_outlined),label: "Cart"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_border_outlined),label: "Favourite"),
          BottomNavigationBarItem(icon: Icon(Icons.account_box_outlined),label: "Account"),
        ],
      )
    );

  }
}

