import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nectar_project1/core/common/colors.dart';
import 'package:nectar_project1/core/common/images.dart';

import '../main.dart';

class paymentmethods extends StatefulWidget {
  const paymentmethods({super.key});

  @override
  State<paymentmethods> createState() => _paymentmethodsState();
}
class _paymentmethodsState extends State<paymentmethods> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: theColors.primaryColor,
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(CupertinoIcons.back)),
        centerTitle: true,
        title: Text("Payment Methods",style: TextStyle(
            color: theColors.eight
        ),),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              InkWell(
                onTap: () {

                },
                child: Container(
                  height: w*0.25,
                  width: w*0.25,
                  decoration: BoxDecoration(
                      color: theColors.primaryColor,
                      borderRadius: BorderRadiusDirectional.circular(w*0.03),
                      boxShadow: [
                        BoxShadow(
                            color: theColors.secondary.withOpacity(0.13),
                            blurRadius:9,
                            offset: Offset(0, 4),
                            spreadRadius:6
                        )
                      ]
                  ),
                  child:Image.asset(theImages.gpay),
                ),
              ),
              InkWell(
                onTap: () {

                },
                child: Container(
                  height: w*0.25,
                  width: w*0.25,
                  decoration: BoxDecoration(
                      color: theColors.primaryColor,
                      borderRadius: BorderRadiusDirectional.circular(w*0.03),
                      boxShadow: [
                        BoxShadow(
                            color: theColors.secondary.withOpacity(0.13),
                            blurRadius:9,
                            offset: Offset(0, 4),
                            spreadRadius:6
                        )
                      ]
                  ),
                  child: Image.asset(theImages.cardlogo),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
