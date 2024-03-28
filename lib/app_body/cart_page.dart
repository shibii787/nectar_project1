import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:nectar_project1/colors.dart';
import 'package:nectar_project1/images.dart';

import '../main.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: theColors.primaryColor,
      floatingActionButton: Container(
        height: w * 0.15,
        width: w * 0.9,
        decoration: BoxDecoration(
            color: theColors.third,
            borderRadius: BorderRadius.circular(w * 0.04)),
        child: Center(
          child: Text("Go to Checkout",
            style: TextStyle(
                color: theColors.primaryColor,
                fontSize: w*0.05,
                fontWeight: FontWeight.w600)),
        ),
      ),

      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "My Cart",
          style: TextStyle(color: theColors.eight),
        ),
        backgroundColor: theColors.primaryColor,
      ),
      body:  Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: 5,
              scrollDirection: Axis.vertical,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: w * 0.45,
                  width: w * 1,
                  decoration: BoxDecoration(
                    border:Border(
                      bottom: BorderSide(
                        color:theColors.seventh,
                      )
                    )
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: w * 0.4,
                        width: w * 0.3,
                        child: Image.asset(theImages.RedBell),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                              height: w * 0.2,
                              width: w * 0.45,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Bell Pepper Red",
                                    style: TextStyle(color: theColors.eight),
                                  ),
                                  Text(
                                    "1kg, Price",
                                    style: TextStyle(color: theColors.tenth),
                                  ),
                                ],
                              )),
                          Container(
                            height: w * 0.2,
                            width: w * 0.3,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  height: w * 0.1,
                                  width: w * 0.1,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(w * 0.04),
                                      border: Border.all(
                                          color: theColors.seventh,
                                          width: w * 0.003)),
                                  child: Icon(
                                    Icons.remove,
                                    color: theColors.nine,
                                  ),
                                ),
                                Text(
                                  "1",
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                ),
                                Container(
                                  height: w * 0.1,
                                  width: w * 0.1,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(w * 0.04),
                                      border: Border.all(
                                          color: theColors.seventh,
                                          width: w * 0.003)),
                                  child: Icon(
                                    Icons.add,
                                    color: theColors.third,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                              height: w * 0.2,
                              width: w * 0.2,
                              child: Icon(
                                Icons.close,
                                color: theColors.nine,
                              )),
                          Container(
                              height: w * 0.2,
                              width: w * 0.2,
                              child: Center(
                                  child: Text(
                                    "\$1.99",
                                    style: TextStyle(),
                                  )))
                        ],
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
