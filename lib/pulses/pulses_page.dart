import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nectar_project1/core/common/colors.dart';
import 'package:nectar_project1/core/common/images.dart';

import '../main.dart';

class pulses extends StatefulWidget {
  const pulses({super.key});

  @override
  State<pulses> createState() => _pulsesState();
}
class _pulsesState extends State<pulses> {
  List pulses=[
    {
      "name":"green gram",
      "image":theImages.greengrees,
      "qty":1,
      "price": 45,
      "description":"Greengram are nutritious.They are good for health. It promotes weight gain and helps to improve heart health and digestion",
    },
    {
      "name":"black gram",
      "image":theImages.blackgreens,
      "qty":1,
      "price":55,
      "description":"Blackgreen are nutritious.They are good for health. It promotes weight gain and helps to improve heart health and digestion"
    },
    {
      "name":"Lime beans",
      "image":theImages.limebeans,
      "qty":1,
      "price":65,
      "description":"Lime beans are nutritious.They are good for health. It promotes weight gain and helps to improve heart health and digestion"
    }
  ];
  addpulseslist() async {
    for(int i=0;i<pulses.length;i++){
      await FirebaseFirestore.instance.collection("pulses").add(pulses[i]);
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: theColors.primaryColor,
        title: Text("Pulses",style: TextStyle(
          fontSize: w*0.07,
           color: theColors.secondary,
        )),
        centerTitle: true,
        leading: Icon(CupertinoIcons.back),
      ),
      body: Column(
        children: [
          Container(
            height: w*0.5,
            width: w*0.35,
            decoration: BoxDecoration(
                color: Colors.black,
              borderRadius: BorderRadius.circular(w*0.04)
            ),
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Container(
                      height: h*0.15,
                      width: w*0.4,
                      padding: EdgeInsets.all(w*0.03),
                  margin: EdgeInsets.all(w*0.03),
                  decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(w*0.03),
                  border: Border.all(
                  color: theColors.eleventh
                  ),
                  ),
                    child: Column(
                      children: [
                        Image.asset(pulses[index]["image"])
                      ],
                    ),
                  );
                  
                },
            ),
          )
        ],
      )

    );
  }
}
