import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nectar_project1/core/common/colors.dart';

import '../main.dart';

class notification extends StatefulWidget {
  const notification({super.key});

  @override
  State<notification> createState() => _notificationState();
}

class _notificationState extends State<notification> {
  bool toggle = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: theColors.primaryColor,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: theColors.primaryColor,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
            child: Icon(CupertinoIcons.back,color: theColors.secondary,)),
        title: Text("Notifications",style: TextStyle(
          color: theColors.secondary
        )),
      ),
      body: Padding(
        padding:  EdgeInsets.all(w*0.03),
        child: Column(
          children: [
            SizedBox(height: w*0.07),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Theme",style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: w*0.04
                ),),
                Stack(
                  children: [
                    InkWell(
                      onTap: () {
                        toggle = !toggle;

                        setState(() {});
                      },
                      child: Container(
                        height: w * 0.08,
                        width: w * 0.17,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(w * 0.08),
                          color: toggle == true ? Colors.green : Colors.grey,
                        ),
                      ),
                    ),
                    AnimatedPositioned(
                      duration: Duration(milliseconds: 200),
                      left: toggle == true ? w * 0.1 : 0,
                      right: toggle == true ? 0 : w * 0.1,
                      child: InkWell(
                        onTap: () {
                          toggle = !toggle;

                          setState(() {});
                        },
                        child: AnimatedContainer(
                          duration: Duration(milliseconds: 200),
                          height: w * 0.08,
                          width: w * 0.08,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, color: Colors.white),
                        ),
                      ),
                    ),
                    // AnimatedPositioned(
                    //   duration: Duration(
                    //     milliseconds: 200,
                    //   ),
                    //   left: toggle == true ? width * 0.01 : width * 0.13,
                    //   right: toggle == true ? width * 0.13 : width * 0.01,
                    //   top: width * 0.013,
                    //   child: InkWell(
                    //     onTap: () {
                    //       toggle = !toggle;
                    //
                    //       setState(() {});
                    //     },
                    //
                    //     // child: Text(
                    //
                    //     //   toggle == true ? "on" : "off",
                    //
                    //     //   style: TextStyle(
                    //
                    //     //       color: toggle == true ? Colors.white : Colors.black
                    //
                    //     //   ),
                    //     // ),
                    //   ),
                    // ),
                  ],
                ),
              ],
            ),
            Divider(
              height: w*0.03,
              color: theColors.seventh,
              indent: w*0.03,
              endIndent: w*0.02,
            )
          ],
        ),
      ),
    );
  }
}
