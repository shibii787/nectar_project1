import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nectar_project1/colors.dart';
import 'package:nectar_project1/images.dart';

import '../main.dart';

class paymentmethods extends StatefulWidget {
  const paymentmethods({super.key});

  @override
  State<paymentmethods> createState() => _paymentmethodsState();
}
class _paymentmethodsState extends State<paymentmethods> {

  List pay=[
    "assets/images/googlepay.png",
    "assets/images/images.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: theColors.primaryColor,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
            child: Icon(CupertinoIcons.back,color: theColors.secondary,size: w*0.09)),
        title: Text("Payment Methods",style: TextStyle(
          color: theColors.secondary
        )),
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              physics: BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: pay.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisSpacing: 0.5,
                    childAspectRatio: 1,
                    crossAxisSpacing: 0.5,
                    crossAxisCount: 2,
                ),
                itemBuilder: (context, index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: w*0.4,
                       width: w*0.4,
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(w*0.03),
                       ),
                       child: Image(image: AssetImage(pay[index]),fit: BoxFit.fill),
                        ),
                    ],
                  );
                },),
          ),
        ],
      ),
    );
  }
}
