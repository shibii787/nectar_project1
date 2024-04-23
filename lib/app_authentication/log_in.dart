import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nectar_project1/app_authentication/forgot_password.dart';
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
            icon: Icon(CupertinoIcons.back,)),
      ),
      body: Padding(
        padding: EdgeInsets.all(w * 0.03),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: w * 0.05,
              ),
              Center(
                child: Image.asset(theImages.orangeCarrot,
                height: w*0.2,),
              ),
              SizedBox(
                height: w*0.03,
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
                height: w * 0.03,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(),
                  Row(),
                  InkWell(
                    onTap: () {
                      Navigator.push(context, CupertinoPageRoute(builder: (context) => forgotPassword(),));
                    },
                    child: Text(
                      "Forgot Password?",
                      style: TextStyle(color: theColors.third),
                    ),
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
