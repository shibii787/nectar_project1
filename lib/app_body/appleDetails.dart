import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nectar_project1/colors.dart';
import 'package:nectar_project1/images.dart';

import '../main.dart';

class appleDetails extends StatefulWidget {
  const appleDetails({super.key});

  @override
  State<appleDetails> createState() => _appleDetailsState();
}

class _appleDetailsState extends State<appleDetails> {

  bool more=false; //to show product details
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(
        height: w * 0.15,
        width: w * 0.9,
        decoration: BoxDecoration(
            color: theColors.third,
            borderRadius: BorderRadius.circular(w * 0.04)),
        child: Center(
          child: Text("Add To Cart",
              style: TextStyle(
                  color: theColors.primaryColor,
                  fontSize: w*0.045,
                  fontWeight: FontWeight.w500)),
        ),
      ),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: theColors.sixth,
        automaticallyImplyLeading: false,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
            child: Icon(CupertinoIcons.back)),
        actions: [
          Icon(Icons.file_upload_outlined)
        ],
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.only(
            left: w*0.01,
            right: w*0.01,
            bottom: w*0.03,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: h*0.5,
                width: w*1,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(w*0.03),
                      bottomRight: Radius.circular(w*0.03),
                    ),
                    color: theColors.sixth.withOpacity(0.5)
                ),
                child: Image.asset(theImages.apple),
              ),
              SizedBox(height: h*0.03),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text("Red Apple",style: TextStyle(
                        fontWeight: FontWeight.w600,fontSize: w*0.035
                      ),),
                      Text("1kg,Price")
                    ],
                  ),
                  Icon(Icons.favorite_border_outlined)
                ],
              ),
              SizedBox(height: h*0.03),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: h*0.08,
                    width: w*0.5,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(w*0.03),
                      color: theColors.sixth
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(Icons.remove),
                        Container(
                          height: h*0.06,
                            width: w*0.1,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(w*0.03),
                              color: theColors.primaryColor
                            ),
                            child: Text("",style: TextStyle(
                              fontWeight: FontWeight.w500
                            ),)),
                       Icon(Icons.add),
                      ],
                    ),
                  ),
                  Text("Price :",style: TextStyle(
                    fontWeight: FontWeight.w500
                  ),)
                ],
              ),
              SizedBox(height: h*0.03),
              InkWell(
                onTap: () {
                  more=!more;
                  setState(() {

                  });
                },
                child: more==true?Container(
                  height: h*0.09,
                  width: w*1,
                  decoration: BoxDecoration(
                      border: Border(
                          top: BorderSide(
                              color: theColors.secondary,
                              width: w*0.002
                          )
                      )
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Product Details"),
                          Icon(CupertinoIcons.chevron_down),
                        ],
                      ),
                      Text("Apples are nutritious. They are good for health. It promotes weight loss and it is good for your heart.")
                    ],
                  ),
                ) :Container(
                height: h*0.05,
                width: w*1,
                decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                      color: theColors.secondary,
                      width: w*0.002
                    )
                  )
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Product Details"),
                    Icon(CupertinoIcons.chevron_down)
                  ],
                ),
              ),),
              SizedBox(height: h*0.02),
              Container(
                height: h*0.05,
                width: w*1,
                decoration: BoxDecoration(
                    border: Border(
                        top: BorderSide(
                            color: theColors.secondary,
                            width: w*0.002
                        )
                    )
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Nutrition"),
                    Container(
                      color: theColors.sixth,
                        child: Text("100 G")),
                  ],
                ),
              ),
              SizedBox(height: h*0.02),
              Container(
                height: h*0.05,
                width: w*1,
                decoration: BoxDecoration(
                    border: Border(
                        top: BorderSide(
                            color: theColors.secondary,
                            width: w*0.002
                        )
                    )
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Review"),
                  ],
                ),
              ),
              SizedBox(height: h*0.05),
            ],
          ),
        ),
      ),
    );
  }
}
