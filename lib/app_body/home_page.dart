import 'package:flutter/material.dart';
import 'package:nectar_project1/colors.dart';
import 'package:nectar_project1/images.dart';


import '../main.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({super.key});

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {

  TextEditingController searchController= TextEditingController(); //controller for search container

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
                Container(
                  height: h*0.14,
                  width: w*0.45,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(theImages.orangeCarrot,
                          height: w*0.15,
                          width: w*0.15),
                      SizedBox(height: h*0.02),
                      Row(
                        children: [
                          Icon(Icons.location_on),
                          Text("Kerala, Mannarkkad")
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(height: h*0.05),
                TextFormField(
                  controller: searchController,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: theColors.sixth,
                    prefixIcon: const Icon(Icons.search),
                    label: const Text("Search Store"),
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


