import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nectar_project1/colors.dart';
import 'package:nectar_project1/icons.dart';


import '../app_payment/payment1.dart';
import 'home_page.dart';

class bottomNav extends StatefulWidget {
  const bottomNav({super.key});

  @override
  State<bottomNav> createState() => _bottomNavState();
}

class _bottomNavState extends State<bottomNav> {

  //int bottom represents pages in the UI
  int bottom=0;

  //to add all UI pages into the bottom navigation bar
  List pages =[
    homeScreen(),
    payment1()
  ];

  @override
  Widget build(BuildContext context) {
    // return Scaffold(
    //   body: pages[bottom],
    //   bottomNavigationBar: BottomNavigationBar(
    //     type: BottomNavigationBarType.fixed,
    //     showSelectedLabels: true,
    //     showUnselectedLabels: true,
    //     selectedItemColor: theColors.third,
    //     selectedIconTheme: IconThemeData(
    //       color: theColors.third
    //     ),
    //     unselectedItemColor: theColors.secondary,
    //     items: [
    //       BottomNavigationBarItem(icon: SvgPicture.asset(theIcons.homeIcon),label: "Shop"),
    //       BottomNavigationBarItem(icon: SvgPicture.asset(theIcons.exploreIcon),label: "Explore"),
    //       BottomNavigationBarItem(icon: SvgPicture.asset(theIcons.cartIcon),label: "Cart"),
    //       BottomNavigationBarItem(icon: SvgPicture.asset(theIcons.favIcon),label: "Favourite"),
    //       BottomNavigationBarItem(icon: SvgPicture.asset(theIcons.userIcon),label: "Account"),
    //     ],
    //   )
    // );

    return Scaffold(
      body: pages[bottom],
      bottomNavigationBar: ConvexAppBar(
        backgroundColor: theColors.third,
          items: [
            TabItem(icon: SvgPicture.asset(theIcons.homeIcon)),
            TabItem(icon: SvgPicture.asset(theIcons.exploreIcon)),
            TabItem(icon: SvgPicture.asset(theIcons.cartIcon)),
            TabItem(icon: SvgPicture.asset(theIcons.favIcon)),
            TabItem(icon: SvgPicture.asset(theIcons.userIcon)),
          ],
        initialActiveIndex: bottom,
        onTap: (int index) {
          setState(() {
            bottom=index;
          });
        },
      ),
    );

  }
}

