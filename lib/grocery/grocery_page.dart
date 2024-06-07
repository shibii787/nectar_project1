import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nectar_project1/core/common/colors.dart';
import 'package:nectar_project1/core/common/images.dart';

import '../main.dart';

class grocerypage extends StatefulWidget {
  const grocerypage({super.key});

  @override
  State<grocerypage> createState() => _grocerypageState();
}

class _grocerypageState extends State<grocerypage> {
  List Grocery=[
    {
      "image" : theImages.daawatrice,
      "name" : "Daawat Rice",
      "qty" : 1,
      "price" : 560,
      "description" :"good rice"
    }
  ];
  addGroceryList() async {
    for(int i =0; i<Grocery.length; i++){
      await FirebaseFirestore.instance.collection("grocery").add(Grocery[i]);
    }
  }
  @override
  // void initState() {
  //   addGroceryList();
  //   // TODO: implement initState
  //   super.initState();
  // }


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
        backgroundColor: theColors.primaryColor,
        title: Text("Groceries",style: TextStyle(
          color: theColors.secondary,fontWeight: FontWeight.w600,
        ),),
      ),
      body: Padding(
        padding:  EdgeInsets.all(w*0.02),
        child: Column(
          children: [
            Container(
              height: w*0.6,
              width: w*0.4,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(w*0.03),
                border: Border.all( color: theColors.nine)
              ),
              child: Padding(
                padding:  EdgeInsets.all(w*0.02),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: w*0.31,
                      width: w*0.4,
                     child: Image.asset(theImages.daawatrice),
                    ),
                    Container(
                      height: w*0.14,
                      width: w*0.4,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Daawat Rice",style: TextStyle(
                            fontWeight: FontWeight.w600
                          ),),
                          Text("10kg Bag",style: TextStyle(
                            color: theColors.eleventh,
                            fontSize: w*0.03
                          ),),
                        ],
                      ),
                    ),
                    Container(
                      height: w*0.1,
                      width: w*0.4,
                      child:Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("\$2.34",
                          style: TextStyle(
                            fontWeight: FontWeight.w600
                          ),),
                          Container(
                            height: w*0.1,
                            width: w*0.1,
                            decoration: BoxDecoration(
                                borderRadius:
                                BorderRadius.circular(w * 0.04),
                                color: theColors.third,
                                border: Border.all(
                                    color: theColors.seventh,
                                    width: w * 0.003)),
                            child:  Icon(
                              Icons.add,
                              color: theColors.primaryColor,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
