import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nectar_project1/app_body/bottom_nav.dart';
import 'package:nectar_project1/app_into/onboarding.dart';
import 'package:nectar_project1/core/common/colors.dart';
import 'package:nectar_project1/core/common/images.dart';
import 'package:nectar_project1/model/userModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';

class splashscreen extends StatefulWidget {
  const splashscreen({super.key});

  @override
  State<splashscreen> createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {

  Future<void> getLoggedIn()async{
    SharedPreferences login = await SharedPreferences.getInstance();
    userName=login.getString("name") ?? "";
    userEmail=login.getString("email") ?? "";

    print("USERNAME --------- $userName");
    print("USER EMAIL --------- $userEmail");

    await Future.delayed(Duration(seconds: 3));
    if(userEmail == null || userEmail.isEmpty){

      getData();

      Navigator.pushReplacement(context, CupertinoPageRoute(builder: (context) => onboardingPage(),));
    }else{
      getData();
      Navigator.pushReplacement(context, CupertinoPageRoute(builder: (context) => bottomNav(),));
    }
  }

  getData()async{
    print(userEmail);
    if(userEmail != null){
      var data = await FirebaseFirestore.instance.collection("account").where('email', isEqualTo: userEmail).get();
      currentUserModel = UserModel.fromMap(data.docs[0].data()!);
    }
  }

  @override
  void initState() {
    getLoggedIn();
    print("USERMODEL ------- $currentUserModel");
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
        backgroundColor: theColors.third,
        body: Center(
          child: Container(
            height: h * 0.12,
            width: w * 0.8,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    height: w * 0.2,
                    width: w * 0.2,
                    child: SvgPicture.asset(theImages.whiteCarrot)),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "nectar",
                      style: TextStyle(
                          color: theColors.primaryColor,
                          fontWeight: FontWeight.w700,
                          fontSize: w * 0.12,
                          shadows: [
                            Shadow(
                                color: theColors.secondary.withOpacity(0.9),
                                blurRadius: w * 0.01,
                                offset: Offset(0, 3))
                          ]),
                    ),
                    Text(
                      "online groceries",
                      style: TextStyle(
                        color: theColors.primaryColor,
                        fontSize: w * 0.035,
                        letterSpacing: w * 0.01,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
