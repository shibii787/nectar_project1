import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nectar_project1/colors.dart';
import 'package:nectar_project1/images.dart';

import 'main.dart';

class onboarding extends StatefulWidget {
  const onboarding({super.key});

  @override
  State<onboarding> createState() => _onboardingState();
}

class _onboardingState extends State<onboarding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: h*1,
                width: w*1,
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage(""),fit: BoxFit.fill),
                ),
              ),
              Container(
                height: h*1,
                width: w*1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(height: h*0.5),
                    Container(
                      height: w*0.2,
                      width: w*0.3,
                      child: Positioned(
                        bottom: w*0.32,
                          top: w*0.2,
                          child: SvgPicture.asset(theImages.whitecarrotsvg)),
                    ),
                    Text("Welcome",style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: w*0.09,
                      color: theColors.primaryColor
                    ),),
                    Text("to our store",style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: w*0.09,
                      color: theColors.primaryColor
                    ),),
                    SizedBox(height: w*0.05),
                    Text("Ger your groceries in as fast as one hour",style: TextStyle(
                      color: theColors.primaryColor
                    ),),
                    SizedBox(height: w*0.01),
                    Container(
                      height: w*0.2,
                      width: w*0.9,
                      decoration: BoxDecoration(
                          color: theColors.third,
                        borderRadius: BorderRadius.circular(w*0.03)
                      ),
                      child: Center(
                        child: Text("Get Started",style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: w*0.06,
                          color: theColors.primaryColor
                        )),
                      ),
                    )
                  ],
                ),
              ),

            ],
          ),
        ],
      ),
    );
  }
}
