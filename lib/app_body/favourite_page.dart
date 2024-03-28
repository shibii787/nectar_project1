import 'package:flutter/material.dart';
import 'package:nectar_project1/colors.dart';

import '../main.dart';

class Favourite_page extends StatefulWidget {
  const Favourite_page({super.key});

  @override
  State<Favourite_page> createState() => _Favourite_pageState();
}

class _Favourite_pageState extends State<Favourite_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: theColors.primaryColor,
      floatingActionButton: Container(
        height: w * 0.15,
        width: w * 0.9,
        decoration: BoxDecoration(
            color: theColors.third,
            borderRadius: BorderRadius.circular(w * 0.04)),
        child: Center(
          child: Text("Add All To Cart",
              style: TextStyle(
                  color: theColors.primaryColor,
                  fontSize: w*0.05,
                  fontWeight: FontWeight.w600)),
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Text("Favourites"),
        backgroundColor: theColors.primaryColor,
      ),
    );
  }
}
