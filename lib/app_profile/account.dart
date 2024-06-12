import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nectar_project1/app_authentication/sign_page.dart';
import 'package:nectar_project1/app_profile/about.dart';
import 'package:nectar_project1/app_profile/help.dart';
import 'package:nectar_project1/app_profile/my%20order.dart';
import 'package:nectar_project1/app_profile/mydetails.dart';
import 'package:nectar_project1/app_profile/notification.dart';
import 'package:nectar_project1/app_profile/payment%20methods.dart';
import 'package:nectar_project1/app_profile/promocard.dart';
import 'package:nectar_project1/core/common/colors.dart';
import 'package:nectar_project1/core/common/images.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';

class account extends StatefulWidget {
  const account({super.key});

  @override
  State<account> createState() => _accountState();
}

class _accountState extends State<account> {

  var file;
  String imageurl = "";
  String name = "";
  String email = "";

  getLogInAndOut() async {
    SharedPreferences logInAndOut = await SharedPreferences.getInstance();
    logInAndOut.setString("name", userName);
    logInAndOut.setString("email", userEmail);
  }

  pickFile(ImageSource) async {
    final pickedFile =
        await ImagePicker.platform.pickImage(source: ImageSource);
    file = File(pickedFile!.path);
    if (mounted) {
      setState(() {
        file = File(pickedFile.path);
      });
      uploadFile(file);
    }
  }

  uploadFile(File file) async {
    if(file != null){
      var image = await FirebaseStorage.instance
          .ref("profile_image")
          .child("${DateTime.now()}")
          .putFile(file!,
          SettableMetadata(
              contentType: "image/jpg"
          ));

      imageurl = await image.ref.getDownloadURL();

      setState(() {

      });
    }
  }

  TextEditingController nameController = TextEditingController();

  updateName(){
    if (currentUserModel != null) {
      // Update the Firestore document with the new name
           FirebaseFirestore.instance
          .collection("account")
          .doc(currentUserModel!.id)
          .update(currentUserModel!.copyWith(name: nameController.text).tomap())
          .then((_) {
        print("Name updated successfully: ${nameController.text}");
      })
          .catchError((error) {
        print("Failed to update name: $error");
      });
    } else {
      print("Current user model is null");
    }
  }

  @override
  void initState() {
    getLogInAndOut();
    nameController.text = userName.toString();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:theColors.primaryColor ,
        automaticallyImplyLeading: false,
        elevation: 0,
        centerTitle: true,
        title: Text("Profile",style: TextStyle(
          fontWeight: FontWeight.w500,
          color: theColors.secondary,
        )),
      ),
        body: SafeArea(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.all(w*0.03),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Stack(
                        children: [
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
                                            child: Text('Cancel',style: TextStyle(
                                              color: theColors.thirteen
                                            )),
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
                              Container(
                                width: w*0.56,
                                child: TextFormField(
                                  controller: nameController,
                                  textInputAction: TextInputAction.done,
                                  onFieldSubmitted: (value) {

                                    // FirebaseFirestore.instance.collection("account").doc(currentUserModel?.id).update(
                                    //   currentUserModel?.copyWith(
                                    //     name: nameController.text
                                    //   ) as Map<String, dynamic>
                                    // );
                                    // print(nameController.text);

                                    // final updateUserModel = currentUserModel?.copyWith(
                                    //   name: nameController.text
                                    // );
                                    //
                                    // FirebaseFirestore.instance.collection("account").doc(currentUserModel?.id).update(
                                    //     updateUserModel!.tomap()
                                    // );
                                    // print(nameController.text);

                                    updateName();

                                  },
                                  decoration: InputDecoration(
                                    suffixIcon: Icon(CupertinoIcons.pencil),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Text(userEmail.toString()),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: w*0.03,),
                  Container(
                    height: h * 0.55,
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
                                      'Promo Card',
                                      style: TextStyle(fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                                Icon(Icons.arrow_forward_ios),
                              ],
                            ),
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
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(context, CupertinoPageRoute(builder: (context) =>About() ,));
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
                                Icon(Icons.arrow_forward_ios),
                              ],
                            ),
                            // margin: EdgeInsets.all(w*0.03),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: w*0.03),
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
                                  onTap: () async {

                                    //for logging a user out
                                    SharedPreferences logOut = await SharedPreferences.getInstance();
                                    logOut.clear();
                                    GoogleSignIn().signOut();

                                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => signPage(),), (route) => false);
                                    setState(() {

                                    });
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
            ),
          ),
        ));
  }

  
}
