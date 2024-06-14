import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:nectar_project1/app_authentication/select_location_page.dart';
import 'package:nectar_project1/feature/addingDetails/controller/addController.dart';
import 'package:nectar_project1/core/common/colors.dart';
import 'package:nectar_project1/core/common/images.dart';
import 'package:nectar_project1/grocery/grocery_page.dart';
import 'package:nectar_project1/pages_showing_items/Best%20selling_view%20page.dart';
import 'package:nectar_project1/pages_showing_items/exclusive_view_page.dart';
import 'package:nectar_project1/pulses/pulses_page.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../main.dart';

class homeScreen extends ConsumerStatefulWidget {
  const homeScreen({super.key});

  @override
  ConsumerState<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends ConsumerState<homeScreen> {
  //for animated smooth indicator
  int currentIndex = 0;

  bool exclusiveSelect = false;
  bool bestSellingSelect = false;

  TextEditingController searchController = TextEditingController(); //controller for search container

  //for carousel slider
  List carousel = [
    theImages.slider1,
    theImages.slider2,
    theImages.slider3,
  ];

  //best selling list
  List bestSelling=[
    {
      "image" : theImages.Redbell,
      "name" : "Bell Pepper",
      "qty" : 1,
      "price" : 55,
      "description" : "A Bell Pepper eases inflammation, reduced disease risk, improves immune health and improves eye health",
    },
    {
      "image" : theImages.ginger,
      "name" : "Ginger",
      "qty" : 1,
      "price" : 120,
      "description" : "A Ginger can cut down on fermentation, constipation and other causes of bloating and intestinal gas.",
    },
    {
      "image" : theImages.cucumber,
      "name" : "Cucumber",
      "qty" : 1,
      "price" : 60,
      "description" : "A Cucumber is good for hydration & detoxification it regulates blood pressure, reduces blood sugar, helpful in weight loss, better skin,soothes our eyes, reduces the risk of cancer"
    }
  ];
  
  addBestSellingList() async {
    for(int j = 0; j<bestSelling.length; j++){
    await FirebaseFirestore.instance.collection("bestSelling").add(bestSelling[j]);
    }
  }

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
      "price" : 220
    },
    {
      "image": theImages.chicken,
      "name": "Chicken",
      "qty": 1,
      "price" : 110
    },
  ];

  //for location
  Position? _currentLocation;
  late bool servicePermission = false;
  late LocationPermission permission;

  String _currentAddress = "";
  String _postalCode = "";

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
        _postalCode = "${place.postalCode}";
      });
    }catch(e){
      print(e);
    }
  }

  locationFunc() async {
    _currentLocation = await getCurrentLocation();
    _currentAddress = await getAddressCoordinates() ?? null;
    await getAddressCoordinates();
    print("$_currentLocation");
    print("$_currentAddress");

  }

  @override
  void initState() {
    locationFunc();
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
                      height: h * 0.2,
                      width: w * 0.6,
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
                            mainAxisAlignment: MainAxisAlignment.center,
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
                      InkWell(
                        onTap: () {
                          exclusiveSelect=!exclusiveSelect;
                        },
                        child:Text(exclusiveSelect == true ? "See Less" : "See All",style: TextStyle(
                          fontWeight: FontWeight.w500,color: theColors.third
                        ),),
                      )
                    ],
                  ),
                  ref.watch(exclusiveStreamProvider).when(
                      data: (data) {
                        return Container(
                          height: h*0.35,
                          width: w*1,
                          child: ListView.builder(
                            itemCount: exclusiveSelect == true ? data.length : 3,
                            shrinkWrap: true,
                            physics: BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  Navigator.push(context, CupertinoPageRoute(builder: (context) => exclusiveViewPage(
                                    itemName: data[index].name,
                                    itemprice: data[index].price,
                                    itemqty: data[index].qty,
                                    itemDescription: data[index].description,
                                    itemImage: data[index].image,
                                  ),));
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
                                ),),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Image.network(data[index].image),
                                      Text(data[index].name,style: TextStyle(
                                          fontWeight: FontWeight.w600
                                      ),),
                                      Text(data[index].qty.toString(),style: TextStyle(
                                          fontWeight: FontWeight.w600
                                      ),),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text("${data[index].price.toString()} ₹",style: TextStyle(
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
                        );
                      },
                      error: (error, stackTrace) {
                        return Text(error.toString());
                      },
                      loading: () {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      },
                  ),
                  SizedBox(height: h * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Best Selling",style: TextStyle(
                          fontWeight: FontWeight.w600,color: theColors.secondary
                      ),),
                      InkWell(
                        onTap: () {
                          bestSellingSelect=!bestSellingSelect;
                        },
                        child: Text(bestSellingSelect == true ? "See Less" : "See All",style: TextStyle(
                            fontWeight: FontWeight.w500,color: theColors.third
                        ),),
                      )
                    ],
                  ),
                  ref.watch(bestsellingStreamProvider).when(data: (data) {
                    return  Container(
                      height: h*0.35,
                      width: w*1,
                      child: ListView.builder(
                        itemCount: bestSellingSelect == true ? data.length : 3,
                        physics: BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => bestselling(
                                  image: data[index].image,
                                  price: data[index].price,
                                  name: data[index].name,
                                  qty: data[index].qty,
                                  discription: data[index].description,
                              ),));
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
                                  Image.network(data[index].image),
                                  Text(data[index].name,style: TextStyle(
                                      fontWeight: FontWeight.w600
                                  ),),
                                  Text(data[index].qty.toString(),style: TextStyle(
                                      fontWeight: FontWeight.w600
                                  ),),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("${data[index].price} ₹".toString(),style: TextStyle(
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
                    );
                  }, error: (error, stackTrace) {
                    return Text(error.toString());
                  }, loading: () {
                    return Center(
                        child: CircularProgressIndicator());
                  },),

                  SizedBox(height: h * 0.02),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Groceries",style: TextStyle(
                          fontWeight: FontWeight.w600,color: theColors.secondary
                      ),),
                      InkWell(
                        onTap: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("No more items available now")));
                        },
                        child: Text("See All",style: TextStyle(
                            fontWeight: FontWeight.w500,color: theColors.third
                        ),),
                      )
                    ],
                  ),
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
                          return InkWell(
                            onTap: () {
                              index==0?Navigator.push(context, MaterialPageRoute(builder: (context) => grocerypage(),)):null;
                              index==1?Navigator.push(context, MaterialPageRoute(builder: (context) => pulses(),)):null;
                            },
                            child: Container(
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
                            ),
                          );
                        },),
                  ),
                  SizedBox(height: h*0.02),

                  // Container(
                  //   height: h*0.35,
                  //   width: w*1,
                  //   child: ListView.builder(
                  //     itemCount: meat.length,
                  //     physics: BouncingScrollPhysics(),
                  //     scrollDirection: Axis.horizontal,
                  //     shrinkWrap: true,
                  //     itemBuilder: (context, index) {
                  //       return Container(
                  //         height: h*0.15,
                  //         width: w*0.4,
                  //         padding: EdgeInsets.all(w*0.03),
                  //         margin: EdgeInsets.all(w*0.03),
                  //         decoration: BoxDecoration(
                  //             borderRadius: BorderRadius.circular(w*0.03),
                  //             border: Border.all(
                  //                 color: theColors.eleventh
                  //             )
                  //         ),
                  //         child: Column(
                  //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //           children: [
                  //             Image.asset(meat[index]["image"]),
                  //             Text(meat[index]["name"],style: TextStyle(
                  //                 fontWeight: FontWeight.w600
                  //             ),),
                  //             Text(meat[index]["qty"].toString(),style: TextStyle(
                  //                 fontWeight: FontWeight.w600
                  //             ),),
                  //             Row(
                  //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //               children: [
                  //                 Text("${meat[index]["price"].toString()} ₹",style: TextStyle(
                  //                     fontWeight: FontWeight.w600
                  //                 ),),
                  //                 Container(
                  //                   height: w*0.1,
                  //                   width: w*0.1,
                  //                   decoration: BoxDecoration(
                  //                       borderRadius:
                  //                       BorderRadius.circular(w * 0.04),
                  //                       color: theColors.third,
                  //                       border: Border.all(
                  //                           color: theColors.seventh,
                  //                           width: w * 0.003)),
                  //                   child:  Icon(
                  //                     Icons.add,
                  //                     color: theColors.primaryColor,
                  //                   ),
                  //                 )
                  //               ],
                  //             )
                  //           ],
                  //         ),
                  //       );
                  //     },),
                  // ),

                ],

              ),
            ),
          ),
        ));
  }
}
