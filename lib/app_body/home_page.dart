import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nectar_project1/images.dart';


import '../main.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({super.key});

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(w*0.03),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(height: h*0.05),
                Center(
                  child: Image.asset(theImages.orangeCarrot,
                    height: w*0.15,
                  width: w*0.15),
                ),
                SizedBox(height: h*0.05),
                TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    label: Text("Search Store"),
                    border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(w*0.03)
                    )
                    )
                  ),
                SizedBox(height: h*0.05),
              ],
            ),
          ),
        ),
      )
    );
  }
}


