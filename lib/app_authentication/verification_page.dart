import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nectar_project1/app_authentication/select_location_page.dart';
import 'package:nectar_project1/core/common/colors.dart';
import 'package:pinput/pinput.dart';
import 'package:timer_count_down/timer_count_down.dart';

import '../main.dart';

class verificationPage extends StatefulWidget {
  const verificationPage({super.key});

  @override
  State<verificationPage> createState() => _verificationPageState();
}

class _verificationPageState extends State<verificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: theColors.primaryColor,
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
        child: Column(
          children: [
            Text(
              "Enter your 4-digit code",
              style:
                  TextStyle(fontSize: w * 0.055, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: w * 0.05),
            FractionallySizedBox(
                child: Pinput(
              errorTextStyle: TextStyle(color: theColors.tenth),
              closeKeyboardWhenCompleted: true,
            )),
            SizedBox(
              height: w * 0.05,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Resend code in",
                    style: TextStyle(
                        color: theColors.secondary, fontSize: w * 0.04)),
                SizedBox(width: w*0.02),
                Countdown(
                  seconds: 60,
                  build: (p0, p1) {
                    return Text(
                      "$p1",
                      style: TextStyle(color: theColors.third),
                    );
                  },
                ),
                Text("s",
                    style:
                        TextStyle(color: theColors.third, fontSize: w * 0.04)),
              ],
            ),
            SizedBox(height: w * 0.5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {

                  },
                  child: Text(
                    "Resend Code",
                    style: TextStyle(
                        color: theColors.third, fontWeight: FontWeight.w500),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context, CupertinoPageRoute(builder: (context) => selectLocationPage(),));
                  },
                  child: CircleAvatar(
                    backgroundColor: theColors.third,
                    radius: w * 0.09,
                    child: Icon(Icons.navigate_next,
                        color: theColors.primaryColor, size: w * 0.08),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
