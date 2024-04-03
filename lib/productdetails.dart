import 'package:flutter/material.dart';
import 'package:nectar_project1/colors.dart';
import 'package:nectar_project1/images.dart';

import 'main.dart';

class productdetails extends StatefulWidget {
  const productdetails({super.key});

  @override
  State<productdetails> createState() => _productdetailsState();
}

class _productdetailsState extends State<productdetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: theColors.primaryColor,
        actions: [
         Icon(Icons.file_upload_outlined,size: w*0.07,color: theColors.secondary,),
        ],
        leading: Icon(Icons.keyboard_arrow_left_sharp,
            size: w*0.1,
            color: theColors.secondary),
      ),
      body: Padding(
        padding:  EdgeInsets.all(w*0.02),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: w*0.01),
            Container(
              height: h*0.4,
                decoration:BoxDecoration(
                  color: theColors.sixth,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(w*0.03),
                    bottomRight: Radius.circular(w*0.03),
                  ),
                ) ,
                child: Image(image: AssetImage(theImages.apple))),
            Row(
              children: [
                SizedBox(height: w*0.04),
                Text("Naturel Red Apple",style: TextStyle(
                  fontSize: w*0.05,
                  fontWeight: FontWeight.w700
                ),),
                SizedBox(width: w*0.36),
                Icon(Icons.favorite_border,color: theColors.nine,),
              ],
            ),
            Text("1kg, Price",style: TextStyle(
              color: theColors.tenth,
            ),),
            SizedBox(height: w*0.02,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: w*0.14,
                  width: w*0.22,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(w*0.03),
                    color:theColors.primaryColor,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(Icons.remove),
                      Text("1"),
                      Icon(Icons.add,color: theColors.third),
                    ],
                  ),
                ),
                Text("\$4.99",style: TextStyle(
                  fontWeight: FontWeight.w800
                ),),
              ],
            )
          ],
        ),
      ),
    );
  }
}
