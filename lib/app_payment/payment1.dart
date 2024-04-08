import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nectar_project1/app_payment/Payment_card.dart';
import 'package:nectar_project1/colors.dart';
import 'package:nectar_project1/images.dart';

import '../main.dart';

class SelectPayment extends StatefulWidget {
  const SelectPayment({super.key});

  @override
  State<SelectPayment> createState() => _SelectPaymentState();
}

class _SelectPaymentState extends State<SelectPayment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
            child: Icon(CupertinoIcons.back)),
        centerTitle: true,
        title: Text("Select Payment",style: TextStyle(
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
                  Navigator.push(context, MaterialPageRoute(builder: (context) => CardPayment(),));
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
