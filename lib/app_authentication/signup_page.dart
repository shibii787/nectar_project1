import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nectar_project1/app_authentication/select_location_page.dart';
import 'package:nectar_project1/app_authentication/sign_page.dart';
import 'package:nectar_project1/core/common/colors.dart';
import 'package:nectar_project1/core/common/images.dart';
import 'package:nectar_project1/feature/addingDetails/controller/collectionControl.dart';
import 'package:nectar_project1/model/userModel.dart';

import '../main.dart';

class signupPage extends ConsumerStatefulWidget {
  const signupPage({super.key});

  @override
  ConsumerState<signupPage> createState() => _signupPageState();
}

class _signupPageState extends ConsumerState<signupPage> {
  var file;
  String imageurl = "";

  bool tap = true;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final emailValidation =
      RegExp(r"^[a-z0-9.a-z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-z0-9]+\.[a-z]+");
  final passwordValidation =
      RegExp(r"^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$");

  pickFile(ImageSource) async {
    final pickedFile =
        await ImagePicker.platform.pickImage(source: ImageSource);
    file = File(pickedFile!.path);
    if (mounted) {
      setState(() {
        file = File(pickedFile.path);
      });
    }
  }

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

  addNewUserFunc(){
    UserModel userModel = UserModel(
        name: nameController.text,
        email: emailController.text.trim(),
        password: passwordController.text,
        location: _currentAddress,
        phoneNumber: null,
        id: "");

    ref.watch(addCollectionController).controlCollectionFunc(userModel: userModel);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: theColors.primaryColor,
      //resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: theColors.primaryColor,
        elevation: 0,
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(CupertinoIcons.back)),
      ),
      body: Padding(
        padding: EdgeInsets.all(w * 0.03),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  // Container(
                  //   height: w*0.4,
                  //   width: w*0.5,
                  //   color: colorTheme.fourthColor,
                  // ),
                  Center(
                      child: file != null
                          ? CircleAvatar(
                              backgroundColor: theColors.primaryColor,
                              radius: w * 0.2,
                              backgroundImage: FileImage(file))
                          : CircleAvatar(
                              radius: w * 0.2,
                              backgroundColor: theColors.secondary,
                              backgroundImage: AssetImage(theImages.beckham),
                            )),
                  Positioned(
                    left: w * 0.6,
                    bottom: w * 0.02,
                    child: InkWell(
                      onTap: () {
                        showCupertinoModalPopup(
                          context: context,
                          builder: (BuildContext context) => Material(
                            type: MaterialType.circle,
                            color: Colors.transparent,
                            child: CupertinoActionSheet(
                                actions: <Widget>[
                                  CupertinoActionSheetAction(
                                    child: const Text('Photo Gallery',
                                    style: TextStyle(
                                      color: theColors.third
                                    ),),
                                    onPressed: () {
                                      pickFile(ImageSource.gallery);
                                      Navigator.pop(context, 'One');
                                    },
                                  ),
                                  CupertinoActionSheetAction(
                                    child: const Text('Camera',
                                    style: TextStyle(
                                      color: theColors.third
                                    ),),
                                    onPressed: () {
                                      pickFile(ImageSource.camera);
                                      Navigator.pop(context, 'Two');
                                    },
                                  )
                                ],
                                cancelButton: CupertinoActionSheetAction(
                                  child: Text('Cancel',
                                  style: TextStyle(
                                    color: theColors.thirteen
                                  ),),
                                  isDefaultAction: true,
                                  onPressed: () {
                                    Navigator.pop(context, 'Cancel');
                                  },
                                )),
                          ),
                        );
                      },
                      child: Container(
                        height: w * 0.1,
                        width: w * 0.1,
                        decoration: BoxDecoration(
                          color: theColors.third,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(w * 0.05),
                              topRight: Radius.circular(
                                w * 0.05,
                              ),
                              bottomRight: Radius.circular(
                                w * 0.05,
                              ),
                              bottomLeft: Radius.circular(w * 0.05)),
                        ),
                        child: Icon(Icons.edit_outlined,
                            color: theColors.primaryColor),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: w * 0.05,
              ),
              Text(
                "Sign Up",
                style: TextStyle(fontSize: w * 0.06, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: w * 0.03,
              ),
              Text(
                "Enter your credentials to continue",
                style: TextStyle(color: theColors.eleventh),
              ),
              SizedBox(
                height: w * 0.05,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(w*0.03)
                ),
                child: TextFormField(
                  style: TextStyle(
                    color: theColors.secondary,
                  ),
                  controller: nameController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,

                  decoration: InputDecoration(
                    filled: true,
                    fillColor: theColors.third.withOpacity(0.08),
                    labelText: "Full Name",
                    labelStyle: TextStyle(
                        color: theColors.secondary
                    ),
                    hintText: "Enter the Full Name",
                    hintStyle: TextStyle(
                        color: theColors.secondary
                    ),
                    suffixIcon: Icon(CupertinoIcons.person),
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
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(w*0.03),
                      borderSide: BorderSide(
                          color: theColors.third
                      ),
                    ),
                    // focusedBorder: OutlineInputBorder(
                    //   borderRadius: BorderRadius.circular(width*0.03),
                    //     borderSide: BorderSide(
                    //         color: Colors.blue
                    //     )
                    // )
                  ),
                ),
              ),
              SizedBox(
                height: w * 0.05,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(w*0.03)
                ),
                child: TextFormField(
                  style: TextStyle(
                    color: theColors.secondary,
                  ),
                  controller: emailController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if(!emailValidation.hasMatch(value!))
                    {
                      return "Email";
                    }
                    else{
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: theColors.third.withOpacity(0.08),
                    labelText: "Email",
                    labelStyle: TextStyle(
                        color: theColors.secondary
                    ),
                    hintText: "Enter the Email",
                    hintStyle: TextStyle(
                        color: theColors.secondary
                    ),
                    suffixIcon: Icon(CupertinoIcons.mail),
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
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(w*0.03),
                      borderSide: BorderSide(
                          color: theColors.third
                      ),
                    ),
                    // focusedBorder: OutlineInputBorder(
                    //   borderRadius: BorderRadius.circular(width*0.03),
                    //     borderSide: BorderSide(
                    //         color: Colors.blue
                    //     )
                    // )
                  ),
                ),
              ),
              SizedBox(
                height: w * 0.05,
              ),
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(w*0.03)
                ),
                child: TextFormField(
                  style: TextStyle(
                    color: theColors.secondary,
                  ),
                  controller: passwordController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if(!passwordValidation.hasMatch(value!))
                    {
                      return "Password";
                    }
                    else{
                      return null;
                    }
                  },
                  obscureText: tap?true:false,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: theColors.third.withOpacity(0.08),
                    labelText: "Password",
                    labelStyle: TextStyle(
                        color: theColors.secondary
                    ),
                    hintText: "Enter the password",
                    hintStyle: TextStyle(
                        color: theColors.secondary
                    ),
                    suffixIcon: InkWell(
                        onTap: () {
                          tap=!tap;
                          setState(() {
                          });
                        },
                        child:tap==false? Icon(Icons.visibility,
                          color: theColors.secondary,):Icon(Icons.visibility_off,
                          color: theColors.secondary,)),
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
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(w*0.03),
                      borderSide: BorderSide(
                          color: theColors.third
                      ),
                    ),
                    // focusedBorder: OutlineInputBorder(
                    //   borderRadius: BorderRadius.circular(width*0.03),
                    //     borderSide: BorderSide(
                    //         color: Colors.blue
                    //     )
                    // )
                  ),
                ),
              ),
              SizedBox(
                height: w * 0.05,
              ),
              Column(
                children: [
                  Row(
                    children: [
                      Text(
                        "By continuing you agree to our ",
                        style: TextStyle(
                            fontSize: w * 0.035, color: theColors.secondary),
                      ),
                      Text(
                        "Terms of Service",
                        style:
                            TextStyle(fontSize: w * 0.03, color: theColors.third),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "and",
                        style: TextStyle(fontSize: w * 0.035),
                      ),
                      Text(
                        " Privacy Policy.",
                        style: TextStyle(
                          fontSize: w * 0.03,
                          color: theColors.third,
                        ),
                      )
                    ],
                  )
                ],
              ),
              SizedBox(
                height: w * 0.05,
              ),
              InkWell(
                onTap: () {
                  addNewUserFunc();
                  Navigator.push(context, CupertinoPageRoute(builder: (context) => selectLocationPage(),));
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Signup Successfully")));
                },
                child: Container(
                  height: w * 0.18,
                  width: w * 1,
                  decoration: BoxDecoration(
                      color: theColors.third,
                      borderRadius: BorderRadius.circular(w * 0.04)),
                  child: Center(
                    child: Text("Sign Up",
                        style: TextStyle(
                            color: theColors.primaryColor,
                            fontSize: w * 0.05,
                            fontWeight: FontWeight.w600)),
                  ),
                ),
              ),
              SizedBox(
                height: w * 0.05,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account?",
                    style: TextStyle(
                      color: theColors.secondary,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => signPage(),
                          ));
                    },
                    child: Text(
                      " Signup",
                      style: TextStyle(color: theColors.third),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
