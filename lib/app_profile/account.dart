import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nectar_project1/app_authentication/log_in.dart';
import 'package:nectar_project1/colors.dart';
import 'package:nectar_project1/images.dart';

import '../main.dart';

class account extends StatefulWidget {
  const account({super.key});

  @override
  State<account> createState() => _accountState();
}

class _accountState extends State<account> {
  var file;
  Pickfile(ImageSource) async {
    final imgFile=await ImagePicker.platform.pickImage(source: ImageSource);
    file=File(imgFile!.path);
    if(mounted){
      setState(() {
        file=File(imgFile!.path);
      });
    }
  }
  final emailvalidation = RegExp(
      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");

  final email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: theColors.primaryColor,
        appBar: AppBar(
          backgroundColor: theColors.primaryColor,
          elevation: 0,
        ),
        body: Padding(
          padding: EdgeInsets.all(w * 0.03),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Stack(
                    children: [
                     file!=null? Container(
                        height: h*0.4,
                        width: w*0.4,
                        decoration: BoxDecoration(
                          image: DecorationImage(image: FileImage(file,),fit: BoxFit.fill)
                        ),
                      )
                      :Container(
                          child: Image(image: AssetImage(theImages.account))),
                      Positioned(
                           left: w * 0.14,
                          bottom: w*0.09,
                          right: w*0.12,
                          top: w*0.1,
                          child:InkWell(
                            onTap: () {
                              showModalBottomSheet(
                                showDragHandle: true,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadiusDirectional.circular(w*0.03)
                                  ),
                                  context: context,
                                  builder: (context) {
                                    return Container(
                                      height: w*0.6,
                                      child: Column(
                                        children: [
                                          Text("choose a file from"),
                                          Container(
                                            width: w*1,
                                            height: w*0.4,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(w*0.03),
                                            ),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                SizedBox(height: w*0.1),
                                                Column(
                                                  children: [
                                                    SizedBox(height: w*0.03,),
                                                    InkWell(
                                                        onTap: () {
                                                          Pickfile(ImageSource.camera);
                                                        },
                                                        child: Center(child: Container(
                                                            height: w*0.25,
                                                            width: w*0.26,
                                                            color: Colors.red,
                                                            child: Icon(Icons.photo_camera,size:w*0.25,color: theColors.primaryColor,)))),
                                                    // Text("camera")
                                                  ],
                                                ),
                                                SizedBox(width: w*0.3),
                                                SizedBox(height: w*0.7),
                                                Column(
                                                  children: [

                                                    SizedBox(height: w*0.03,),
                                                    InkWell(
                                                      onTap: () {
                                                        Pickfile(ImageSource.gallery);
                                                      },
                                                      child: Container(
                                                          height: w*0.25,
                                                          width: w*0.25,
                                                          color: Colors.red,
                                                          child: Icon(Icons.photo,size:w*0.25,color: theColors.primaryColor,)),
                                                    ),
                                                    // Text("gallery")
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                              );
                            },
                            child: Container(
                              height: h*0.05,
                                width: w*0.05,
                                child: Icon(Icons.camera_alt_rounded,color: theColors.secondary,)),
                          )),
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "Afsar Hossen",
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SvgPicture.asset(theImages.pen),
                        ],
                      ),
                      Text("Imshuvo97@gmail.com")
                    ],
                  ),
                  SizedBox(
                    width: w * 0.05,
                  )
                ],
              ),
              // SizedBox(height: w*0.05),
              Divider(
                endIndent: w * 0.06,
                thickness: w * 0.001,
                color: Colors.black26,
                height: h * 0.04,
                indent: h * 0.05,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset(theImages.bag),
                    Text(
                      'Orders',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      width: w * 0.2,
                    ),
                    Icon(Icons.arrow_forward_ios),
                  ],
                ),
                // margin: EdgeInsets.all(w*0.03),
              ),
              Divider(
                endIndent: w * 0.06,
                thickness: w * 0.001,
                color: Colors.black26,
                height: h * 0.04,
                indent: h * 0.05,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset(theImages.tv),
                    Text(
                      'My Details',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      width: w * 0.2,
                    ),
                    Icon(Icons.arrow_forward_ios),
                  ],
                ),
                // margin: EdgeInsets.all(w*0.03),
              ),
              Divider(
                endIndent: w * 0.06,
                thickness: w * 0.001,
                color: Colors.black26,
                height: h * 0.04,
                indent: h * 0.05,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset(theImages.location),
                    Text(
                      'Delivery Address',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      width: w * 0.2,
                    ),
                    Icon(Icons.arrow_forward_ios),
                  ],
                ),
                // margin: EdgeInsets.all(w*0.03),
              ),
              Divider(
                endIndent: w * 0.06,
                thickness: w * 0.001,
                color: Colors.black26,
                height: h * 0.04,
                indent: h * 0.05,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset(theImages.payment),
                    Text(
                      'Payment Methods',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      width: w * 0.2,
                    ),
                    Icon(Icons.arrow_forward_ios),
                  ],
                ),
                // margin: EdgeInsets.all(w*0.03),
              ),
              Divider(
                endIndent: w * 0.06,
                thickness: w * 0.001,
                color: Colors.black26,
                height: h * 0.04,
                indent: h * 0.05,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset(theImages.card),
                    Text(
                      'Promo Cord',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      width: w * 0.2,
                    ),
                    Icon(Icons.arrow_forward_ios),
                  ],
                ),
                // margin: EdgeInsets.all(w*0.03),
              ),
              Divider(
                endIndent: w * 0.06,
                thickness: w * 0.001,
                color: Colors.black26,
                height: h * 0.04,
                indent: h * 0.05,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset(theImages.bell),
                    Text(
                      'Notifications ',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      width: w * 0.2,
                    ),
                    Icon(Icons.arrow_forward_ios),
                  ],
                ),
                // margin: EdgeInsets.all(w*0.03),
              ),
              Divider(
                endIndent: w * 0.06,
                thickness: w * 0.001,
                color: Colors.black26,
                height: h * 0.04,
                indent: h * 0.05,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset(theImages.help),
                    Text(
                      'Help ',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      width: w * 0.2,
                    ),
                    Icon(Icons.arrow_forward_ios),
                  ],
                ),
                // margin: EdgeInsets.all(w*0.03),
              ),
              Divider(
                endIndent: w * 0.06,
                thickness: w * 0.001,
                color: Colors.black26,
                height: h * 0.04,
                indent: h * 0.05,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset(theImages.about),
                    Text(
                      'About  ',
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      width: w * 0.2,
                    ),
                    Icon(Icons.arrow_forward_ios),
                  ],
                ),
                // margin: EdgeInsets.all(w*0.03),
              ),
              Container(
                height: h * 0.06,
                width: w * 0.03,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(w * 0.03),
                ),
              ),
              InkWell(
                onTap: () {
                  showDialog(
                    context: context,
                    barrierDismissible: false,
                    builder: (context) {
                      return AlertDialog(
                        title: Text("Are you sure you want to exit ?",
                            style: TextStyle(
                              fontSize: w * 0.04,
                            )),
                        content: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => logIn(),
                                    ),
                                    (route) => false);
                                setState(() {});
                              },
                              child: Container(
                                height: h * 0.05,
                                width: w * 0.13,
                                child: Center(child: Text("Yes")),
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
                                width: w * 0.13,
                                child: Center(child: Text("No")),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(w * 0.03),
                                  color: theColors.third,
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  );
                },
                child: Container(
                  height: h * 0.08,
                  width: w * 0.9,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(w * 0.03),
                      color: theColors.sixth),
                  child: Row(
                    children: [
                      Icon(
                        Icons.login,
                        size: w * 0.07,
                        color: theColors.third,
                      ),
                      SizedBox(width: w * 0.28),
                      Text(
                        "Log Out",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: w * 0.05,
                            color: theColors.third),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
