import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:nectar_project1/app_authentication/select_location_page.dart';
import 'package:nectar_project1/pages_showing_items/appleDetails.dart';
import 'package:nectar_project1/pages_showing_items/bananapage.dart';
import 'package:nectar_project1/core/common/colors.dart';
import 'package:nectar_project1/core/common/images.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../main.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({super.key});

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  //for animated smooth indicator
  int currentIndex = 0;

  TextEditingController searchController = TextEditingController(); //controller for search container

  //for carousel slider
  List carousel = [
    theImages.slider1,
    theImages.slider2,
    theImages.slider3,
  ];

  //exclusive list
  List exclusive=[
    {
      "image": theImages.banana,
      "name": "Banana",
      "qty": 1,
      "price" : 4.99
    },
    {
      "image": theImages.apple,
      "name": "Apple",
      "qty": 1,
      "price" : 4.99
    },
  ];

  //best selling list
  List bestSelling=[
    {
      "image": theImages.Redbell,
      "name": "Bell Pepper",
      "qty": 1,
      "price" : 4.99
    },
    {
      "image": theImages.ginger,
      "name": "Ginger",
      "qty": 1,
      "price" : 4.99
    },
  ];

  //groceries
  List groceries=[
    {
      "image":theImages.rice,
      "name":"Rice"
    },
    {
      "image":theImages.pulse,
      "name":"Pulses"
    }
  ];
  
  //meat 
  List meat=[
    {
      "image": theImages.meat,
      "name": "Beef",
      "qty": 1,
      "price" : 4.99
    },
    {
      "image": theImages.chicken,
      "name": "Chicken",
      "qty": 1,
      "price" : 4.99
    },
  ];

  //for location
  Position? _currentLocation;
  late bool servicePermission = false;
  late LocationPermission permission;

  String _currentAddress = "";

  Future<Position> getCurrentLocation()async{
    servicePermission = await Geolocator.isLocationServiceEnabled();
    if(!servicePermission){
      print("Service Denied");
    }
    permission = await Geolocator.checkPermission();
    if(permission == LocationPermission.denied){
      permission = await Geolocator.requestPermission();
    }
    return await Geolocator.getCurrentPosition();
  }

  getAddressCoordinates()async{
    try{
      List<Placemark> placesmark = await placemarkFromCoordinates(_currentLocation!.latitude,_currentLocation!.longitude);
      Placemark place = placesmark[0];
      setState(() {
        _currentAddress = "${place.locality},${place.country}";
      });
    }catch(e){
      print(e);
    }
  }

  newFunc() async {
    _currentLocation = await getCurrentLocation();
    _currentAddress = await getAddressCoordinates();
    await getAddressCoordinates();
    print("$_currentLocation");
    print("$_currentAddress");

  }

  @override
  void initState() {
    newFunc();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(w * 0.03),
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  SizedBox(height: h * 0.02),
                  InkWell(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(w*0.05),
                              ),
                              title: Text("Are you sure you want to update your location details?", style: TextStyle(
                                fontSize: w*0.035
                              ),),
                              content: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.pushAndRemoveUntil(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => selectLocationPage(),
                                          ),
                                              (route) => false);
                                      setState(() {});
                                    },
                                    child: Container(
                                      height: h * 0.05,
                                      width: w * 0.2,
                                      child: Center(child: Text("Yes",style: TextStyle(
                                          color: theColors.primaryColor
                                      ),)),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(w * 0.03),
                                        color: theColors.third,
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.pop(context);
                                      setState(() {});
                                    },
                                    child: Container(
                                      height: h * 0.05,
                                      width: w * 0.2,
                                      child: Center(child: Text("No",style: TextStyle(
                                          color: theColors.primaryColor
                                      ),)),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(w * 0.03),
                                        color: theColors.third,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            );
                          },);
                    },
                    child: Container(
                      height: h * 0.15,
                      width: w * 0.55,
                      padding: EdgeInsets.all(w*0.02),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(w*0.03),
                        border: Border.all(
                          color: theColors.third.withOpacity(0.5)
                        )
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(theImages.orangeCarrot,
                              height: w * 0.15, width: w * 0.15),
                          SizedBox(height: h * 0.02),
                          Row(
                            children: [
                              Icon(Icons.location_on),
                              Text("$_currentAddress",style: TextStyle(
                              color: theColors.secondary
                              ),),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: h * 0.03),
                  TextFormField(
                      controller: searchController,
                      keyboardType: TextInputType.multiline,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: theColors.sixth,
                          prefixIcon: const Icon(Icons.search),
                          label: const Text("Search Store"),
                        labelStyle: TextStyle(
                          color: theColors.secondary
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(w*0.03),
                          borderSide: BorderSide(
                              color: theColors.third
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(w*0.03),
                          borderSide: BorderSide(
                              color: theColors.third
                          ),
                        ),
                      )),
                  SizedBox(height: h * 0.03),
                  CarouselSlider.builder(
                    itemCount: carousel.length,
                    options: CarouselOptions(
                        onPageChanged: (index, reason) {
                          setState(() {
                            currentIndex = index;
                          });
                        },
                        autoPlay: true,
                        aspectRatio: 1.5,
                        viewportFraction: 1,
                        autoPlayAnimationDuration: Duration(seconds: 1)),
                    itemBuilder: (context, index, realIndex) {
                      return Container(
                        height: h * 0.2,
                        width: w * 1,
                        margin: EdgeInsets.all(w*0.02),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(w * 0.03),
                            image: DecorationImage(
                                image: AssetImage(carousel[index]),
                                fit: BoxFit.fill)),
                      );
                    },
                  ),
                  SizedBox(height: h * 0.02),
                  AnimatedSmoothIndicator(
                    activeIndex: currentIndex,
                    count: carousel.length,
                    effect: JumpingDotEffect(
                      activeDotColor: theColors.third,
                      dotColor: theColors.sixth,
                      dotHeight: h * 0.01,
                      dotWidth: w * 0.06,
                    ),
                  ),
                  SizedBox(height: h * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Exclusive Offer",style: TextStyle(
                        fontWeight: FontWeight.w600,color: theColors.secondary
                      ),),
                      Text("See All",style: TextStyle(
                        fontWeight: FontWeight.w500,color: theColors.third
                      ),)
                    ],
                  ),
                  Container(
                    height: h*0.35,
                    width: w*1,
                    child: ListView.builder(
                      itemCount: exclusive.length,
                      physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              index==0?Navigator.push(context, CupertinoPageRoute(builder: (context) => bananapage(),)):null;
                              index==1?Navigator.push(context, CupertinoPageRoute(builder: (context) => appleDetails(),)):null;
                            },
                            child: Container(
                              height: h*0.15,
                              width: w*0.4,
                              padding: EdgeInsets.all(w*0.03),
                              margin: EdgeInsets.all(w*0.03),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(w*0.03),
                                border: Border.all(
                                  color: theColors.eleventh
                                )
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Image.asset(exclusive[index]["image"]),
                                  Text(exclusive[index]["name"],style: TextStyle(
                                    fontWeight: FontWeight.w600
                                  ),),
                                  Text(exclusive[index]["qty"].toString(),style: TextStyle(
                                    fontWeight: FontWeight.w600
                                  ),),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(exclusive[index]["price"].toString(),style: TextStyle(
                                        fontWeight: FontWeight.w600
                                      ),),
                                      Container(
                                        height: w*0.1,
                                        width: w*0.1,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(w * 0.04),
                                            color: theColors.third,
                                            border: Border.all(
                                                color: theColors.seventh,
                                                width: w * 0.003)),
                                        child:  Icon(
                                          Icons.add,
                                          color: theColors.primaryColor,
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
                        },),
                  ),
                  SizedBox(height: h * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Best Selling",style: TextStyle(
                          fontWeight: FontWeight.w600,color: theColors.secondary
                      ),),
                      Text("See All",style: TextStyle(
                          fontWeight: FontWeight.w500,color: theColors.third
                      ),)
                    ],
                  ),
                  Container(
                    height: h*0.35,
                    width: w*1,
                    child: ListView.builder(
                      itemCount: bestSelling.length,
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Container(
                          height: h*0.15,
                          width: w*0.4,
                          padding: EdgeInsets.all(w*0.03),
                          margin: EdgeInsets.all(w*0.03),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(w*0.03),
                              border: Border.all(
                                  color: theColors.eleventh
                              )
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image.asset(bestSelling[index]["image"]),
                              Text(bestSelling[index]["name"],style: TextStyle(
                                  fontWeight: FontWeight.w600
                              ),),
                              Text(bestSelling[index]["qty"].toString(),style: TextStyle(
                                  fontWeight: FontWeight.w600
                              ),),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(bestSelling[index]["price"].toString(),style: TextStyle(
                                      fontWeight: FontWeight.w600
                                  ),),
                                  Container(
                                    height: w*0.1,
                                    width: w*0.1,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                        BorderRadius.circular(w * 0.04),
                                        color: theColors.third,
                                        border: Border.all(
                                            color: theColors.seventh,
                                            width: w * 0.003)),
                                    child:  Icon(
                                      Icons.add,
                                      color: theColors.primaryColor,
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        );
                      },),
                  ),
                  SizedBox(height: h * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Groceries",style: TextStyle(
                          fontWeight: FontWeight.w600,color: theColors.secondary
                      ),),
                      Text("See All",style: TextStyle(
                          fontWeight: FontWeight.w500,color: theColors.third
                      ),)
                    ],
                  ),
                  SizedBox(height: h * 0.02),
                  Container(
                    height: h*0.2,
                    width: w*1,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(w*0.03),
                    ),
                    child: ListView.builder(
                      itemCount: groceries.length,
                      physics: BouncingScrollPhysics(),
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Container(
                            height: h*0.15,
                            width: w*0.6,
                            margin: EdgeInsets.all(w*0.03),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(w*0.03),
                              color: theColors.nine
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Image.asset(groceries[index]["image"]),
                                Text(groceries[index]["name"],style: TextStyle(
                                  fontWeight: FontWeight.w600
                                ),)
                              ],
                            ),
                          );
                        },),
                  ),
                  SizedBox(height: h*0.02),
                  Container(
                    height: h*0.35,
                    width: w*1,
                    child: ListView.builder(
                      itemCount: meat.length,
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Container(
                          height: h*0.15,
                          width: w*0.4,
                          padding: EdgeInsets.all(w*0.03),
                          margin: EdgeInsets.all(w*0.03),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(w*0.03),
                              border: Border.all(
                                  color: theColors.eleventh
                              )
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Image.asset(meat[index]["image"]),
                              Text(meat[index]["name"],style: TextStyle(
                                  fontWeight: FontWeight.w600
                              ),),
                              Text(meat[index]["qty"].toString(),style: TextStyle(
                                  fontWeight: FontWeight.w600
                              ),),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(meat[index]["price"].toString(),style: TextStyle(
                                      fontWeight: FontWeight.w600
                                  ),),
                                  Container(
                                    height: w*0.1,
                                    width: w*0.1,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                        BorderRadius.circular(w * 0.04),
                                        color: theColors.third,
                                        border: Border.all(
                                            color: theColors.seventh,
                                            width: w * 0.003)),
                                    child:  Icon(
                                      Icons.add,
                                      color: theColors.primaryColor,
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        );
                      },),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
