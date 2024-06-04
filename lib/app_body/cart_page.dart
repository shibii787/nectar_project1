import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nectar_project1/app_payment/payment1.dart';
import 'package:nectar_project1/app_profile/promocard.dart';
import 'package:nectar_project1/core/common/colors.dart';
import 'package:nectar_project1/core/common/images.dart';

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
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          "My Cart",
          style: TextStyle(color: theColors.eight),
        ),
        backgroundColor: theColors.primaryColor,
      ),
      body: Column(
        children: [
          Row(
            children: [
              SizedBox(width: w*0.03),
              Text("Delivery Address",style: TextStyle(
                color: theColors.secondary,fontWeight: FontWeight.w700,

              ),),
            ],
          ),
          Padding(
            padding:  EdgeInsets.all(w*0.02),
            child: Container(
              height: w*0.15,
              width: w*1,
              decoration: BoxDecoration(
                color: theColors.nine.withOpacity(0.2),
                borderRadius: BorderRadius.circular(w*0.02)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: w*0.15,
                    width: w*0.75,
                    child: Padding(
                      padding:  EdgeInsets.all(w*0.02),
                      child: Text("13B, Sobha Dream Acres,Panathur Road,Panathur,Banglore.",style:
                        TextStyle(
                          fontWeight: FontWeight.w500
                        ),),
                    ),
                  ),
                  Container(
                    height: w*0.06,
                    width: w*0.2,
                    child:SvgPicture.asset(theImages.pen),
                  ),
                ],
              ),
            ),
          ),
          Row(
            children: [
              SizedBox(width: w*0.03),
              Text("Delivery Date",style:
                TextStyle(
                  fontWeight: FontWeight.w700
                ),),
            ],
          ),
          Padding(
            padding:  EdgeInsets.all(w*0.02),
            child: Column(
              children: [
                Container(
                  height: w*0.1,
                  width: w*1,
                  decoration: BoxDecoration(
                      color: theColors.nine.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(w*0.02)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: w*0.15,
                        width: w*0.75,
                        child: Padding(
                          padding:  EdgeInsets.all(w*0.02),
                          child: Text("Sat,Jun 12 2019",style:
                          TextStyle(
                              fontWeight: FontWeight.w500
                          ),),
                        ),
                      ),
                      Container(
                        height: w*0.06,
                        width: w*0.2,
                          child: SvgPicture.asset(theImages.pen),
                      ),
                    ],
                  ),
                ),
                Divider(
                  color: theColors.primaryColor,
                  height: w*0.01,
                ),
                Container(
                  height:w*0.06 ,
                  width: w*1,
                    decoration: BoxDecoration(
                        color: theColors.nine.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(w*0.02)
                    ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RichText(
                        text: TextSpan(
                        children: [
                          TextSpan(
                            text: " Order will be delivered before",
                            style: TextStyle(
                              fontSize: w*0.032,
                              color: theColors.secondary
                            )
                          ),
                          TextSpan(
                            text: " 7AM",
                              style: TextStyle(
                                  color: theColors.secondary,
                                fontWeight: FontWeight.w600
                              )
                          ),
                          TextSpan(
                            text: " and the service charge is",
                              style: TextStyle(
                                  fontSize: w*0.032,
                                color: theColors.secondary
                              )
                          ),
                          TextSpan(
                            text: " ₹2",
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                                color: theColors.secondary
                              )
                          ),
                        ]
                      ),

                      ),
                    ],
                  )
                ),
              ],
            ),
          ),
          Padding(
            padding:  EdgeInsets.only(
              left: w*0.02,
              right: w*0.02
            ),
            child: Container(
              height: w*0.11,
              width:w*1,
              decoration: BoxDecoration(
                color: theColors.nine.withOpacity(0.2),
                borderRadius: BorderRadius.circular(w*0.02)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: w*0.1,
                    width: w*0.2,
                    decoration: BoxDecoration(
                      color: theColors.third,
                      borderRadius: BorderRadius.circular(w*0.02)
                    ),
                    child: Column(
                      children: [
                        Text("Total",style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: w*0.03)),
                        Text(
                          "\$12.96",
                            style:
                            TextStyle(
                            fontWeight: FontWeight.w600,
                              color: theColors.primaryColor
                        ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: w*0.1,
                    width: w*0.5,
                    decoration: BoxDecoration(
                        color: theColors.third,
                        borderRadius: BorderRadius.circular(w*0.02)
                    ),
                    child: Center(
                      child: Text("Go to Checkout",
                        style:
                        TextStyle(
                            fontWeight: FontWeight.w600,
                            color: theColors.primaryColor
                        ),),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: w*1.1,
              child: ListView.builder(
                itemCount: 5,
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: w * 0.45,
                    width: w * 1,
                    decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                      color: theColors.seventh,
                    ))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: w * 0.4,
                          width: w * 0.3,
                          child: Image.asset(theImages.Redbell),
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
                                        borderRadius:
                                            BorderRadius.circular(w * 0.04),
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
                                        borderRadius:
                                            BorderRadius.circular(w * 0.04),
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
                                ))),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),

          // Padding(
          //   padding:  EdgeInsets.all(w*0.02),
          //   child:InkWell(
          //       onTap: () {
          //         showModalBottomSheet(
          //           elevation: 0,
          //           shape: RoundedRectangleBorder(
          //               borderRadius: BorderRadius.only(
          //                   topLeft: Radius.circular(w * 0.08),
          //                   topRight: Radius.circular(w * 0.08))),
          //           context: context,
          //           builder: (context) {
          //             return Container(
          //               height: w * 1.4,
          //               width: w * 1,
          //               child: Padding(
          //                 padding: EdgeInsets.all(w * 0.03),
          //                 child: Column(
          //                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //                   children: [
          //                     Container(
          //                       height: w * 0.2,
          //                       width: w * 1,
          //                       child: Row(
          //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //                         children: [
          //                           Text(
          //                             "Checkout",
          //                             style: TextStyle(
          //                               fontWeight: FontWeight.w600,
          //                               color: theColors.eight,
          //                               fontSize: w * 0.05,
          //                             ),
          //                           ),
          //                           InkWell(
          //                               onTap: () {
          //                                 Navigator.pop(context);
          //                               },
          //                               child: Icon(Icons.clear))
          //                         ],
          //                       ),
          //                     ),
          //                     Row(
          //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //                       children: [
          //                         Text(
          //                           "Delivery",
          //                           style: TextStyle(
          //                               color: theColors.tenth,
          //                               fontWeight: FontWeight.w600),
          //                         ),
          //                         Container(
          //                           height: w * 0.1,
          //                           width: w * 0.4,
          //                           child: Row(
          //                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //                             children: [
          //                               Text(
          //                                 "Default Address",
          //                                 style: TextStyle(
          //                                     color: theColors.eight,
          //                                     fontWeight: FontWeight.w600),
          //                               ),
          //                             ],
          //                           ),
          //                         )
          //                       ],
          //                     ),
          //                     Row(
          //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //                       children: [
          //                         Text(
          //                           "Promo Code",
          //                           style: TextStyle(
          //                               color: theColors.tenth,
          //                               fontWeight: FontWeight.w600),
          //                         ),
          //                         InkWell(
          //                           onTap: () {
          //                             Navigator.push(context, CupertinoPageRoute(builder: (context) => promocard(),));
          //                           },
          //                           child: Container(
          //                             height: w * 0.1,
          //                             width: w * 0.4,
          //                             child: Row(
          //                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //                               children: [
          //                                 Text(
          //                                   "Pick discount",
          //                                   style: TextStyle(
          //                                       color: theColors.eight,
          //                                       fontWeight: FontWeight.w600),
          //                                 ),
          //                                 Icon(Icons.navigate_next)
          //                               ],
          //                             ),
          //                           ),
          //                         )
          //                       ],
          //                     ),
          //                     Row(
          //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //                       children: [
          //                         Text(
          //                           "Total Cost",
          //                           style: TextStyle(
          //                               color: theColors.tenth,
          //                               fontWeight: FontWeight.w600),
          //                         ),
          //                         Container(
          //                           height: w * 0.1,
          //                           width: w * 0.29,
          //                           child: Row(
          //                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //                             children: [
          //                               Text(
          //                                 "\$13.97",
          //                                 style: TextStyle(
          //                                     color: theColors.eight,
          //                                     fontWeight: FontWeight.w600),
          //                               ),
          //                             ],
          //                           ),
          //                         )
          //                       ],
          //                     ),
          //                     Container(
          //                       height: w * 0.15,
          //                       width: w * 1,
          //                       child: Column(
          //                         crossAxisAlignment: CrossAxisAlignment.start,
          //                         children: [
          //                           // RichText(
          //                           //     text: TextSpan(
          //                           //       text: "By placing an order you agree to our"
          //                           //     ))
          //                           RichText(
          //                             text: new TextSpan(
          //                               text: 'By placing an order you agree to our \n',
          //                               style: TextStyle(
          //                                   color: theColors.tenth,
          //                                   fontWeight: FontWeight.w600),
          //                               children: <TextSpan>[
          //                                 new TextSpan(
          //                                   text: 'Terms',
          //                                   style: new TextStyle(
          //                                       color: theColors.secondary,
          //                                       fontWeight: FontWeight.w600),
          //                                 ),
          //                                 new TextSpan(
          //                                     text: ' And',
          //                                     style: TextStyle(
          //                                         color: theColors.tenth,
          //                                         fontWeight: FontWeight.w600)),
          //                                 new TextSpan(
          //                                     text: ' Conditions',
          //                                     style: TextStyle(
          //                                         color: theColors.secondary,
          //                                         fontWeight: FontWeight.w600)),
          //                               ],
          //                             ),
          //                           ),
          //                         ],
          //                       ),
          //                     ),
          //                     InkWell(
          //                       onTap: () {
          //                         Navigator.push(context, MaterialPageRoute(builder: (context) =>SelectPayment() ,));
          //                       },
          //                       child: Container(
          //                         height: w * 0.15,
          //                         width: w * 0.9,
          //                         decoration: BoxDecoration(
          //                             color: theColors.third,
          //                             borderRadius: BorderRadius.circular(w * 0.04)),
          //                         child: Center(
          //                           child: Text("Continue",
          //                               style: TextStyle(
          //                                   color: theColors.primaryColor,
          //                                   fontSize: w * 0.05,
          //                                   fontWeight: FontWeight.w600)),
          //                         ),
          //                       ),
          //                     ),
          //                   ],
          //                 ),
          //               ),
          //             );
          //           },
          //         );
          //       },
          //     child: Stack(
          //       children: [
          //         Container(
          //           height: w*0.17,
          //           width: w*1,
          //           decoration: BoxDecoration(
          //             color: theColors.third,
          //             borderRadius: BorderRadius.circular(w*0.04),
          //           ),
          //           child: Center(child: Text("Go to CheckOut",
          //             style: TextStyle(
          //                 color: theColors.primaryColor,
          //                 fontSize: w*0.05,
          //                 fontWeight: FontWeight.w600
          //             ),)),
          //         ),
          //         Positioned(
          //           top: w*0.06,
          //           right: w*0.08,
          //             child: Container(
          //           height: w*0.06,
          //           width: w*0.13,
          //           decoration: BoxDecoration(
          //             color:theColors.fourteen,
          //             borderRadius: BorderRadius.circular(w*0.01)
          //           ),
          //               child: Center(
          //                 child: Text("\$12.96",style: TextStyle(
          //                   color: theColors.primaryColor,
          //                  fontWeight: FontWeight.w600
          //                 ),),
          //               ),
          //         ))
          //       ]
          //     ),
          //   ),
          // )
        ],
      ),
    );
  }
}
