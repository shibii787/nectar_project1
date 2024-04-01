import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:nectar_project1/colors.dart';
import 'package:nectar_project1/images.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


import '../main.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({super.key});

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {

  //for animated smooth indicator
  int currentIndex=0;

  TextEditingController searchController= TextEditingController(); //controller for search container

  //for carousel slider
  List carousel=[
    theImages.slider1,
    theImages.slider2,
    theImages.slider3,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(w*0.03),
            child: Column(
              children: [
                SizedBox(height: h*0.02),
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
                CarouselSlider.builder(
                    itemCount: carousel.length,
                  options: CarouselOptions(
                    onPageChanged: (index, reason) {
                      setState(() {
                        currentIndex=index;
                      });
                    },
                    autoPlay: true,
                    aspectRatio: 1,
                    viewportFraction: 1,
                    autoPlayAnimationDuration: Duration(
                      seconds: 1
                    )
                  ),
                    itemBuilder: (context, index, realIndex) {
                      return Container(
                        height: h*0.2,
                        width: w*1,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(w*0.03),
                          image: DecorationImage(image: AssetImage(carousel[index]),fit: BoxFit.fill)
                        ),
                      );
                    },
                    ),
                SizedBox(height: h*0.02),
                AnimatedSmoothIndicator(
                    activeIndex: currentIndex,
                    count: carousel.length,
                  effect: JumpingDotEffect(
                    activeDotColor: theColors.third,
                    dotColor: theColors.sixth,
                    dotHeight: h*0.012,
                    dotWidth: w*0.07,
                  ),
                ),
              ],
            ),
          ),
        ),
      )
    );
  }
}


