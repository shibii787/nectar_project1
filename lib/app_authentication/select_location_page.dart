import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:nectar_project1/app_body/bottom_nav.dart';
import 'package:nectar_project1/core/common/colors.dart';
import 'package:nectar_project1/core/common/images.dart';
import 'package:shared_preferences/shared_preferences.dart';


import '../main.dart';

class selectLocationPage extends StatefulWidget {
  const selectLocationPage({super.key});

  @override
  State<selectLocationPage> createState() => _selectLocationPageState();
}

class _selectLocationPageState extends State<selectLocationPage> {

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: theColors.primaryColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: theColors.primaryColor,
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(CupertinoIcons.back)),
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.all(w * 0.03),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              height: h*0.5,
              width: w*1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Image.asset(theImages.selectLocation,
                      height: h*0.3,
                      width: w*1),
                  Center(
                    child: Text("Select Your Location",style: TextStyle(
                        fontWeight: FontWeight.w600,fontSize: w*0.065
                    ),),
                  ),
                  Center(
                    child: Text(
                      "Switch on your location to stay tune with\n        what's happening in your area",
                      style: TextStyle(
                          fontWeight: FontWeight.w400,fontSize: w*0.025
                      ),),
                  ),
                ],
              ),
            ),
            SizedBox(height: h*0.05),
            ElevatedButton(
                onPressed: () async {

                  _currentLocation = await getCurrentLocation();
                  _currentAddress = await getAddressCoordinates();
                  await getAddressCoordinates();
                  print("$_currentLocation");
                  print("$_currentAddress");

                }, child: Text("Submit Your Zone")),
            InkWell(
              onTap: () {
                Navigator.push(context, CupertinoPageRoute(builder: (context) => bottomNav(),));
              },
              child: Container(
                height: w * 0.15,
                width: w * 0.9,
                decoration: BoxDecoration(
                    color: theColors.third,
                    borderRadius: BorderRadius.circular(w * 0.03)),
                child: Center(
                  child: Text("Submit",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: w * 0.045,
                          color: theColors.primaryColor)),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
