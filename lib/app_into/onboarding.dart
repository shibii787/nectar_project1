import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nectar_project1/app_authentication/sign_page.dart';
import 'package:nectar_project1/core/common/colors.dart';
import 'package:nectar_project1/core/common/images.dart';

import '../main.dart';

class onboardingPage extends StatelessWidget {
  const onboardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            height: h * 1,
            width: w * 1,
            padding: EdgeInsets.all(w * 0.05),
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(theImages.onboarding), fit: BoxFit.fill),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: w * 0.15,
                  width: w * 0.2,
                  child: SvgPicture.asset(theImages.whiteCarrot),
                ),
                SizedBox(height: h * 0.03),
                Text(
                  "Welcome",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: w * 0.075,
                      color: theColors.primaryColor),
                ),
                Text(
                  "to our store",
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: w * 0.075,
                      color: theColors.primaryColor),
                ),
                SizedBox(height: w * 0.02),
                Text(
                  "Get your groceries in as fast as one hour",
                  style: TextStyle(color: theColors.primaryColor),
                ),
                SizedBox(height: h * 0.03),
                InkWell(
                  onTap: () {
                    Navigator.pushAndRemoveUntil(context,  CupertinoPageRoute(builder: (context) =>signPage() ,), (route) => false);
                  },
                  child: Container(
                    height: w * 0.15,
                    width: w * 0.9,
                    decoration: BoxDecoration(
                        color: theColors.third,
                        borderRadius: BorderRadius.circular(w * 0.03)),
                    child: Center(
                      child: Text("Get Started",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: w * 0.045,
                              color: theColors.primaryColor)),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

