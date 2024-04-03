import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:nectar_project1/colors.dart';
import 'package:nectar_project1/images.dart';

import '../main.dart';

class OrderAccepted extends StatefulWidget {
  const OrderAccepted({super.key});

  @override
  State<OrderAccepted> createState() => _OrderAcceptedState();
}

class _OrderAcceptedState extends State<OrderAccepted> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Container(
          height: h * 1,
          width: w * 1,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(theImages.backgroundpayment),
                  fit: BoxFit.fill)),
        ),
        Positioned(
            top: w * 0.05,
            bottom: w * 0.5,
            left: w * 0.05,
            right: w * 0.05,
            child: Lottie.asset(theImages.sucess)),
        Positioned(
            top: w * 1.1,
            left: w * 0.13,
            child: Text(
              "Your Order has been \n accepted",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: w * 0.06),
            )),
        Positioned(
            top: w * 1.3,
            left: w * 0.13,
            child: Text(
              "Your items has been placed and is on \n it’s way to being processed",
              textAlign: TextAlign.center,
              style: TextStyle(color: theColors.tenth),
            )),
        Positioned(
          top: w * 1.7,
          left: w * 0.05,
          child: Container(
            height: w * 0.15,
            width: w * 0.9,
            decoration: BoxDecoration(
                color: theColors.third,
                borderRadius: BorderRadius.circular(w * 0.04)),
            child: Center(
              child: Text("Track Order",
                  style: TextStyle(
                      color: theColors.primaryColor,
                      fontSize: w * 0.05,
                      fontWeight: FontWeight.w500)),
            ),
          ),
        ),

        Positioned(
          top: w * 1.88,
          left: w * 0.05,
          child: Container(
            height: w * 0.15,
            width: w * 0.9,
            decoration: BoxDecoration(
                // color: theColors.third,
                borderRadius: BorderRadius.circular(w * 0.04)),
            child: Center(
              child: Text("Back to home",
                  style: TextStyle(
                      color: theColors.secondary,
                      fontSize: w * 0.05,
                      fontWeight: FontWeight.w500)),
            ),
          ),
        ),
        //Positioned(child: child),
      ]),
    );
  }
}
