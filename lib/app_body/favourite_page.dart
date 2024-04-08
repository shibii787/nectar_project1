import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nectar_project1/colors.dart';

import '../main.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({super.key});

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
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
                  fontSize: w*0.045,
                  fontWeight: FontWeight.w500)),
        ),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        elevation: 0,
        title: Text("Favourites"),
        backgroundColor: theColors.primaryColor,
      ),
    );
  }
}
