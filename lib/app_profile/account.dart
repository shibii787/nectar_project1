import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nectar_project1/app_authentication/log_in.dart';
import 'package:nectar_project1/app_authentication/sign_page.dart';
import 'package:nectar_project1/app_profile/about.dart';
import 'package:nectar_project1/app_profile/delivery%20address.dart';
import 'package:nectar_project1/app_profile/help.dart';
import 'package:nectar_project1/app_profile/my%20order.dart';
import 'package:nectar_project1/app_profile/mydetails.dart';
import 'package:nectar_project1/app_profile/notification.dart';
import 'package:nectar_project1/app_profile/payment%20methods.dart';
import 'package:nectar_project1/app_profile/premocard.dart';
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
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                                  radius: w * 0.15,
                                  backgroundImage: FileImage(file))
                              : CircleAvatar(
                                  radius: w * 0.15,
                                  backgroundColor: theColors.secondary,
                                  backgroundImage:
                                      AssetImage(theImages.beckham),
                                )),
                      Positioned(
                        left: w * 0.18,
                        bottom: w * 0.001,
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
                                          child: const Text('Photo Gallery'),
                                          onPressed: () {
                                            pickFile(ImageSource.gallery);
                                            Navigator.pop(context, 'One');
                                          },
                                        ),
                                        CupertinoActionSheetAction(
                                          child: const Text('Camera'),
                                          onPressed: () {
                                            pickFile(ImageSource.camera);
                                            Navigator.pop(context, 'Two');
                                          },
                                        )
                                      ],
                                      cancelButton: CupertinoActionSheetAction(
                                        child: Text('Cancel'),
                                        isDefaultAction: true,
                                        onPressed: () {
                                          Navigator.pop(context, 'Cancel');
                                        },
                                      )),
                                ),
                              );
                            },
                            child: CircleAvatar(
                              radius: w * 0.04,
                              backgroundColor: theColors.third,
                              child: Center(
                                  child: Icon(
                                CupertinoIcons.pen,
                                color: theColors.primaryColor,
                              )),
                            )),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "Afsar Hossen",
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: w * 0.05),
                          ),
                          SizedBox(width: w * 0.02),
                          Icon(CupertinoIcons.pencil),
                        ],
                      ),
                      Text("Imshuvo97@gmail.com"),
                    ],
                  ),
                ],
              ),
              Container(
                height: h * 0.52,
                width: w * 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(context, CupertinoPageRoute(builder: (context) =>myorder() ,));
                      },
                      child: Container(
                        height: h * 0.05,
                        width: w * 1,
                        decoration: BoxDecoration(
                            border: Border(
                          bottom: BorderSide(
                              color: theColors.secondary.withOpacity(0.5)),
                        )),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // SvgPicture.asset(theImages.bag),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(CupertinoIcons.bag),
                                SizedBox(width: w*0.05),
                                Text(
                                  'Orders',
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),

                            SizedBox(
                              width: w * 0.2,
                            ),
                            Icon(Icons.arrow_forward_ios),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(context, CupertinoPageRoute(builder: (context) =>mydetails() ,));
                      },
                      child: Container(
                        height: h * 0.05,
                        width: w * 1,
                        decoration: BoxDecoration(
                            border: Border(
                          bottom: BorderSide(
                              color: theColors.secondary.withOpacity(0.5)),
                        )),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // SvgPicture.asset(theImages.tv),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(Icons.card_giftcard_outlined),
                                SizedBox(width: w*0.05,),
                                Text(
                                  'My Details',
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                            Icon(Icons.arrow_forward_ios),
                          ],
                        ),
                        // margin: EdgeInsets.all(w*0.03),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(context, CupertinoPageRoute(builder: (context) =>deliveryaddress() ,));
                      },
                      child: Container(
                        height: h * 0.05,
                        width: w * 1,
                        decoration: BoxDecoration(
                            border: Border(
                          bottom: BorderSide(
                              color: theColors.secondary.withOpacity(0.5)),
                        )),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Icon(CupertinoIcons.location_solid),
                                SizedBox(width: w*0.05),
                                Text(
                                  'Delivery Address',
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                            Icon(Icons.arrow_forward_ios),
                          ],
                        ),
                        // margin: EdgeInsets.all(w*0.03),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(context, CupertinoPageRoute(builder: (context) =>paymentmethods() ,));
                      },
                      child: Container(
                        height: h * 0.05,
                        width: w * 1,
                        decoration: BoxDecoration(
                            border: Border(
                          bottom: BorderSide(
                              color: theColors.secondary.withOpacity(0.5)),
                        )),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Icon(Icons.add_card_outlined),
                                SizedBox(width: w*0.05,),
                                Text(
                                  'Payment Methods',
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                            Icon(Icons.arrow_forward_ios),
                          ],
                        ),
                        // margin: EdgeInsets.all(w*0.03),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(context, CupertinoPageRoute(builder: (context) =>promocard() ,));
                      },
                      child: Container(
                        height: h * 0.05,
                        width: w * 1,
                        decoration: BoxDecoration(
                            border: Border(
                          bottom: BorderSide(
                              color: theColors.secondary.withOpacity(0.5)),
                        )),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Icon(Icons.airplane_ticket_outlined),
                                SizedBox(width: w*0.05,),
                                Text(
                                  'Promo Cord',
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                            Icon(Icons.arrow_forward_ios),
                          ],
                        ),
                        // margin: EdgeInsets.all(w*0.03),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(context, CupertinoPageRoute(builder: (context) =>notification() ,));
                      },
                      child: Container(
                        height: h * 0.05,
                        width: w * 1,
                        decoration: BoxDecoration(
                            border: Border(
                          bottom: BorderSide(
                              color: theColors.secondary.withOpacity(0.5)),
                        )),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Icon(CupertinoIcons.bell),
                                SizedBox(width: w*0.05,),
                                Text(
                                  'Notifications ',
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                            Icon(Icons.arrow_forward_ios),
                          ],
                        ),
                        // margin: EdgeInsets.all(w*0.03),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(context, CupertinoPageRoute(builder: (context) =>help() ,));
                      },
                      child: Container(
                        height: h * 0.05,
                        width: w * 1,
                        decoration: BoxDecoration(
                            border: Border(
                          bottom: BorderSide(
                              color: theColors.secondary.withOpacity(0.5)),
                        )),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Icon(Icons.help_center_outlined),
                                SizedBox(width: w*0.05,),
                                Text(
                                  'Help ',
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                            Icon(Icons.arrow_forward_ios),
                          ],
                        ),
                        // margin: EdgeInsets.all(w*0.03),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(context, CupertinoPageRoute(builder: (context) =>about() ,));
                      },
                      child: Container(
                        height: h * 0.05,
                        width: w * 1,
                        decoration: BoxDecoration(
                            border: Border(
                          bottom: BorderSide(
                              color: theColors.secondary.withOpacity(0.5)),
                        )),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Icon(Icons.error_outline),
                                SizedBox(width: w*0.05,),
                                Text(
                                  'About  ',
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),

                            SizedBox(
                              width: w * 0.2,
                            ),
                            Icon(Icons.arrow_forward_ios),
                          ],
                        ),
                        // margin: EdgeInsets.all(w*0.03),
                      ),
                    ),
                  ],
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
                                      builder: (context) => signPage(),
                                    ),
                                    (route) => false);
                                setState(() {});
                              },
                              child: Container(
                                height: h * 0.05,
                                width: w * 0.2,
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
                                width: w * 0.2,
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
                      color: theColors.third),
                  child: Center(
                    child: Text(
                      "Log Out",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: w * 0.05,
                          color: theColors.primaryColor),
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
