import 'package:animated_rating_stars/animated_rating_stars.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nectar_project1/core/common/colors.dart';
import 'package:nectar_project1/core/common/images.dart';

import '../main.dart';

class groceryitemPage extends StatefulWidget {
  const groceryitemPage({super.key});

  @override
  State<groceryitemPage> createState() => _groceryitemPageState();
}

class _groceryitemPageState extends State<groceryitemPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(
  centerTitle: true,
  title: Text("Grocery Item",style: TextStyle(fontWeight: FontWeight.w600,
      fontSize: w*0.05),),
  elevation: 0,
),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: w*0.8,
              width: w*1,
              child: Image.asset(theImages.daawatrice)
            ),
            Container(
              height: w*0.4,
              width: w*1,
              child: Padding(
                padding:  EdgeInsets.all(w*0.02),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Natural Red Apple"
                          ,style: TextStyle(fontWeight: FontWeight.w600,
                            fontSize: w*0.05),),
                        InkWell(
                          onTap: () {
                            
                          },
                          child: Padding(
                            padding:  EdgeInsets.only(right: w*0.03),
                            child: Icon(Icons.favorite_border,
                            ),
                          ),
                        )
                      ],
                    ),
                    Text("1kg,Price",style: TextStyle(fontSize:w*0.03),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: w * 0.2,
                          width: w * 0.2,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                             InkWell(
                                 onTap:() {
                        
                                 },
                                 child: Icon(Icons.remove,size: w*0.04)),
                              Container(
                                height: w*0.06,
                                width: w*0.06,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: theColors.nine,
                                  ),
                                  borderRadius: BorderRadius.circular(w*0.02)
                                ),
                                child: Center(
                                  child: Text(
                                    "1",
                                    style: TextStyle(fontWeight: FontWeight.w600),
                                  ),
                                ),
                              ),
                              InkWell(
                                  onTap: () {
                        
                                  },
                                  child: Icon(Icons.add,size: w*0.04,))
                            ],
                          ),
                        ),
                        Padding(
                          padding:  EdgeInsets.only(right: w*0.03),
                          child: Text("\$4.99",style: TextStyle(
                            fontSize: w*0.06,
                            fontWeight: FontWeight.w700
                          ),),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            Divider(
              color: theColors.nine,
              indent:w*0.05,
              endIndent: w*0.05,
            ),
            Padding(
              padding:  EdgeInsets.all(w*0.02),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Product Details",style: TextStyle(fontWeight: FontWeight.w700,
                      fontSize: w*0.05),
                      ),
                      InkWell(
                          onTap: () {

                          },
                          child: Icon(CupertinoIcons.chevron_down))
                    ],
                  ),
                  SizedBox(
                    height: w*0.03,
                  ),
                  Text("Apples are nutritious.Apples may be good for weight loss. apples may be good for your heart. As part of a healtful and varied diet.",
                    textAlign: TextAlign.justify,),
                  Divider(
                    color: theColors.nine,
                    indent:w*0.05,
                    endIndent: w*0.05,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Nutritions",
                        style: TextStyle(fontWeight: FontWeight.w600,
                            fontSize: w*0.05),),
                      Container(
                        height: w*0.1,
                        width: w*0.2,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: w*0.06,
                              width: w*0.13,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(w*0.02),
                                color: theColors.nine.withOpacity(0.4),
                              ),
                              child: Center(child: Text("100gr",style: TextStyle(
                                fontSize:w*0.03
                              ),)),
                            ),
                            InkWell(
                              onTap: () {

                              },
                                child: Icon(CupertinoIcons.chevron_right))
                          ],
                        ),
                      )
                    ],
                  ),
                  Divider(
                    color: theColors.nine,
                    indent:w*0.05,
                    endIndent: w*0.05,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Review",style: TextStyle(fontWeight: FontWeight.w600,
                          fontSize: w*0.05),),
                      Container(
                        height: w*0.1,
                        width: w*0.55,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
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
                            ),
                            InkWell(
                                onTap: () {

                                },
                                child: Icon(CupertinoIcons.chevron_right))
                          ],
                        ),

                      ),

                    ],
                  ),
                  Divider(
                    color: theColors.nine,
                    indent:w*0.05,
                    endIndent: w*0.05,
                  ),

                ],
              ),
            ),

          ],
        ),
      ),




    );
  }
}
