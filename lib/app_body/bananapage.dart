import 'package:animated_rating_stars/animated_rating_stars.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nectar_project1/core/common/colors.dart';
import 'package:nectar_project1/core/common/images.dart';

import '../main.dart';

class bananapage extends StatefulWidget {
  const bananapage({super.key});

  @override
  State<bananapage> createState() => _bananapageState();
}

class _bananapageState extends State<bananapage> {
  bool more =false;
  int banana=1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Container(
        height: w*0.15,
        width: w*0.9,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(w*0.04),
          color: theColors.third,
        ),
        child: Center(
          child: Text("Add To Cart",style: TextStyle(
            color: theColors.primaryColor,
            fontSize: w*0.045,
            fontWeight: FontWeight.w500
          )),
        ),
      ),
      appBar: AppBar(
        actions: [
          Icon(Icons.file_upload_outlined,color: theColors.secondary),
        ],
        backgroundColor: theColors.sixth,
        elevation: 0,
        leading:  InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(CupertinoIcons.back,color: theColors.secondary,)),
      ),
      body: Padding(
        padding:  EdgeInsets.all(w*0.03),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: h*0.35,
                width: w*1,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(w*0.03),
                      bottomRight: Radius.circular(w*0.03),
                    ),
                    color: theColors.sixth
                ),
                child: Image.asset(theImages.banana),
              ),
              SizedBox(height: w*0.03,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text("Banana",style: TextStyle(
                          fontWeight: FontWeight.w600,fontSize: w*0.035
                      ),),
                      Text("1kg,Price")
                    ],
                  ),
                  InkWell(
                      onTap: () {

                      },
                      child: Icon(Icons.favorite_border_outlined))
                ],
              ),
              SizedBox(height: h*0.03),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Container(
            height: h*0.05,
            width: w*0.5,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(w*0.03),
                color: theColors.sixth
            ),
              child: Row(
                children: [
                  InkWell(
                    onTap:() {
                      banana==1?1:banana--;
                      setState(() {

                      });
                    },
                      child: Icon(Icons.remove)),
                  Container(
                      height: h*0.04,
                      width: w*0.1,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(w*0.03),
                          color: theColors.primaryColor
                      ),
                      child: Center(
                        child: Text(banana.toString(),style: TextStyle(
                            fontWeight: FontWeight.w500
                        ),),
                      )),
                  InkWell(
                    onTap: () {
                      banana++;
                      setState(() {

                      });
                    },
                      child: Icon(Icons.add))
                ],
              ),
            ),
              Text("Price :",style: TextStyle(
                  fontWeight: FontWeight.w500
              ),),
            ],
          ),
              SizedBox(height: w*0.03),
               InkWell(
                 onTap: () {
                   more=!more;
                   setState(() {

                   });
                 },
               child: more==true? Container(
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
                          Icon(CupertinoIcons.chevron_down)
                        ],
                      ),
                      Text("Banana are nutritious.They are good for health. It promotes weight loss and it is good for your heart.")
                    ],
                  ),
                ):Container(
                 height: h*0.05,
                 width: w*1,
                 decoration: BoxDecoration(
                     border: Border(
                         top: BorderSide(
                             color: theColors.secondary,
                             width: w*0.002
                         ),
                     ),
                 ),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     Text("Product Details"),
                     Icon(CupertinoIcons.chevron_down)
                   ],
                 ),
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
                    AnimatedRatingStars(
                      initialRating: 3.5,
                      minRating: 0.0,
                      maxRating: 5.0,
                      filledColor: Colors.amber,
                      emptyColor: Colors.grey,
                      filledIcon: Icons.star,
                      halfFilledIcon: Icons.star_half,
                      emptyIcon: Icons.star_border,
                      onChanged: (double rating) {
                        // Handle the rating change here
                        print('Rating: $rating');
                      },
                      displayRatingValue: true,
                      interactiveTooltips: true,
                      customFilledIcon: Icons.star,
                      customHalfFilledIcon: Icons.star_half,
                      customEmptyIcon: Icons.star_border,
                      starSize: 30.0,
                      animationDuration: Duration(milliseconds: 300),
                      animationCurve: Curves.easeInOut,
                      readOnly: false,
                    )
                  ],
                ),
              ),
              SizedBox(height: h*0.05),
            ],

          ),
        ),
      )
    );
  }
}
