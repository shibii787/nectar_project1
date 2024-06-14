import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:nectar_project1/app_body/bottom_nav.dart';
import 'package:nectar_project1/core/common/colors.dart';
import 'package:nectar_project1/core/common/images.dart';
import 'package:nectar_project1/feature/addingDetails/controller/addController.dart';


import '../main.dart';
import '../model/userModel.dart';

class selectLocationPage extends StatefulWidget {
  const selectLocationPage({super.key,});

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

  TextEditingController pincodeController=TextEditingController();
  TextEditingController AddressController=TextEditingController();

  editAddressAndPincode(){
    FirebaseFirestore.instance.collection("account").doc(userId).update(
    currentUserModel!.copyWith(
    address: AddressController.text
    ).tomap()
    );

    userAddress = AddressController.text;

    print("Address -- ${userAddress}");}

  @override
  void initState() {
    userId = currentUserModel!.id;
    print("SELECT LOCATION PAGE  ---  ${userId}");
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: theColors.primaryColor,
      body: Padding(
        padding: EdgeInsets.all(w * 0.03),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: h*0.5,
                width: w*1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(theImages.selectLocation,
                        height: h*0.2,
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
                            fontWeight: FontWeight.w400,fontSize: w*0.035
                        ),),
                    ),
                  ],
                ),
              ),
              Container(
                height: h*0.35,
                width: w*0.8,
                padding: EdgeInsets.all(w*0.03),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(w*0.05),
                  border: Border.all(
                    color: theColors.third.withOpacity(0.6),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                        onPressed: () async {
                          _currentLocation = await getCurrentLocation();
                          _currentAddress = await getAddressCoordinates();
                          await getAddressCoordinates();
                          print("$_currentLocation");
                          print("$_currentAddress");

                        }, child: Text("Submit Your Zone")),
                    Text("${_currentAddress}",style: TextStyle(
                        fontWeight: FontWeight.w500
                    ),),
                    TextFormField(
                      controller:  pincodeController,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: theColors.third.withOpacity(0.08),
                        counterText: "",
                        hintText: " Enter your pincode",
                          hintStyle: TextStyle(color: theColors.secondary),
                        labelText: "Pincode",
                          labelStyle: TextStyle(color: theColors.secondary),
                        suffixIcon: Icon(CupertinoIcons.location_solid,color: theColors.third,),
                        border: OutlineInputBorder(
                        ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(w*0.03),
                            borderSide: BorderSide(color: theColors.third),
                          )
                      ),
                      maxLength: 6,
                    ),
                    TextFormField(
                      controller:  AddressController,
                      onEditingComplete: () {
                        editAddressAndPincode();
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      keyboardType: TextInputType.multiline,
                      textInputAction: TextInputAction.done,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: theColors.third.withOpacity(0.08),
                        hintText: " Enter your Address",
                          hintStyle: TextStyle(color: theColors.secondary),
                        labelText: "Address",
                          labelStyle: TextStyle(color: theColors.secondary),
                        suffixIcon: Icon(CupertinoIcons.mail,color: theColors.third,),
                        border: OutlineInputBorder(
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(w*0.03),
                          borderSide: BorderSide(color: theColors.third),
                        )
                      ),
                      maxLines: null,
                    )
                  ],
                ),
              ),
              SizedBox(height: w*0.03),
              InkWell(
                onTap: () {

                  if(
                  pincodeController.text!=""&&
                  AddressController.text!=""
                  ){
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Submitted Successfully")));
                    Navigator.push(context, CupertinoPageRoute(builder: (context) => bottomNav(),));
                  }else{
                    pincodeController.text==""?ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("please enter your valid pincode"))):
                    AddressController.text==""?ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("please enter your valid Address"))):
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("please enter your valid details")));
                  }

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
      ),
    );
  }
}
