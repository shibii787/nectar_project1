import 'package:flutter/material.dart';
import 'package:nectar_project1/colors.dart';
import 'package:nectar_project1/images.dart';

import '../main.dart';

class splashscreen extends StatefulWidget {
  const splashscreen({super.key});

  @override
  State<splashscreen> createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(Duration(seconds: 2));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: theColors.third,
      body: Padding(
        padding: EdgeInsets.all(w * 0.03),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Center(
                    child: Container(
                        height: w * 0.2,
                        width: w * 0.2,
                        child:
                            Image(image: AssetImage(theImages.whiteCarrot)))),
                Container(
                  child: Column(
                    children: [
                      Text(
                        "nectar",
                        style: TextStyle(
                            color: theColors.primaryColor,
                            fontWeight: FontWeight.w700,
                            fontSize: w * 0.2),
                      ),
                      Text(
                        "online groceries",
                        style: TextStyle(
                            color: theColors.primaryColor,
                            fontSize: w * 0.05,
                            letterSpacing: w * 0.01),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
