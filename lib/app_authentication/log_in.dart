import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nectar_project1/app_authentication/select_location_page.dart';
import 'package:nectar_project1/app_authentication/signup_page.dart';
import 'package:nectar_project1/core/common/colors.dart';
import 'package:nectar_project1/core/common/images.dart';

import '../main.dart';

class logIn extends StatefulWidget {
  const logIn({super.key});

  @override
  State<logIn> createState() => _logInState();
}

class _logInState extends State<logIn> {

  var file;

  String imageurl = "";

  bool tap = true;

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: theColors.primaryColor,
      //resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: theColors.primaryColor,
        automaticallyImplyLeading: false,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(CupertinoIcons.back)),
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
                "Log In",
                style: TextStyle(fontSize: w * 0.06, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: w * 0.03,
              ),
              Text(
                "Enter your email and password",
                style: TextStyle(color: theColors.eleventh),
              ),
              SizedBox(
                height: w * 0.05,
              ),
              TextFormField(
                style: TextStyle(color: theColors.secondary),
                // textCapitalization: TextCapitalization.characters,
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (!emailValidation.hasMatch(value!)) {
                    return "Enter the email";
                  } else {
                    return null;
                  }
                },
                decoration: InputDecoration(
                    filled: true,
                    fillColor: theColors.primaryColor,
                    hintText: " Email",
                    hintStyle: TextStyle(color: theColors.secondary),
                    suffixIcon:
                        Icon(Icons.email_outlined, color: theColors.secondary),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(w * 0.03),
                        borderSide: BorderSide.none),
                    // label: Text("Email",
                    //     style: TextStyle(
                    //         color: color.secondaryColor,
                    //         fontSize: w*0.05
                    //     )),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(w * 0.03),
                        borderSide: BorderSide(color: theColors.nine))),
              ),
              SizedBox(
                height: w * 0.05,
              ),
              TextFormField(
                style: TextStyle(
                  color: theColors.secondary,
                ),
                controller: passwordController,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (!passwordValidation.hasMatch(value!)) {
                    return "Enter the password";
                  } else {
                    return null;
                  }
                },
                obscureText: tap ? true : false,
                decoration: InputDecoration(
                  fillColor: theColors.primaryColor,
                  filled: true,
                  hintText: "Enter the password",
                  hintStyle: TextStyle(color: theColors.secondary),
                  suffixIcon: InkWell(
                      onTap: () {
                        tap = !tap;
                        setState(() {});
                      },
                      child: tap == false
                          ? Icon(
                              Icons.visibility,
                              color: theColors.secondary,
                            )
                          : Icon(
                              Icons.visibility_off,
                              color: theColors.secondary,
                            )),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(w * 0.03),
                    borderSide: BorderSide.none,
                  ),
                  // suffixIcon: Icon(CupertinoIcons.lock,
                  //   color: theColors.secondary,)
                  // label: Padding(
                  //   padding: EdgeInsets.all(w*0.025),
                  //   child: Text("Password",
                  //       style: TextStyle(
                  //           color: color.thirdColor,
                  //           fontSize: w*0.05
                  //       )),
                  // ),
                  // focusedBorder: OutlineInputBorder(
                  //   borderRadius: BorderRadius.circular(width*0.03),
                  //     borderSide: BorderSide(
                  //         color: Colors.blue
                  //     )
                  // )
                ),
              ),
              SizedBox(
                height: w * 0.03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(),
                  Row(),
                  Text(
                    "Forgot Password?",
                    style: TextStyle(color: theColors.third),
                  )
                ],
              ),
              SizedBox(
                height: w * 0.05,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context, CupertinoPageRoute(builder: (context) => selectLocationPage(),));
                },
                child: Container(
                  height: w * 0.18,
                  width: w * 1,
                  decoration: BoxDecoration(
                      color: theColors.third,
                      borderRadius: BorderRadius.circular(w * 0.04)),
                  child: Center(
                    child: Text("Log In",
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
                    "Don’t have an account?",
                    style: TextStyle(
                      color: theColors.secondary,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => signupPage(),
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
