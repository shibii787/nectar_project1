import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_flip_card/controllers/flip_card_controllers.dart';
import 'package:flutter_flip_card/flipcard/flip_card.dart';
import 'package:flutter_flip_card/modal/flip_side.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nectar_project1/app_body/order_accepted.dart';
import 'package:nectar_project1/core/common/colors.dart';
import 'package:nectar_project1/core/common/images.dart';

import '../main.dart';

class CardPayment extends StatefulWidget {
  const CardPayment({super.key});

  @override
  State<CardPayment> createState() => _CardPaymentState();
}

class _CardPaymentState extends State<CardPayment> {
  FlipCardController card=FlipCardController();
  TextEditingController nameController=TextEditingController();
  TextEditingController numberController=TextEditingController();
  TextEditingController dateController=TextEditingController();
  TextEditingController cvvController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:theColors.primaryColor,
      appBar: AppBar(
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
            child: Icon(CupertinoIcons.back)),
        backgroundColor: theColors.primaryColor,
        title: Text("New Card",style: TextStyle(fontWeight: FontWeight.w700,
            color: theColors.secondary),),
      ),
      body: Form(
       // key: formKey,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding:  EdgeInsets.all(w*0.04),
                child: FlipCard(
                  rotateSide: RotateSide.right,
                    controller: card,
                  onTapFlipping: true, //When enabled, the card will flip automatically when touched.
                  axis: FlipAxis.vertical,
                 // controller: card,
                  frontWidget:Stack(
                    children: [
                      Container(
                        height: w*0.58,
                        width: w*1,
                       decoration: BoxDecoration( color: theColors.third,
                         borderRadius: BorderRadius.circular(w*0.04)),
                      ),
                      Positioned(
                        left: w*0.06,
                        top: w*0.08,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Balance",style: TextStyle(
                              color: theColors.primaryColor,fontSize: w*0.06,
                            ),),
                            SizedBox(height: w*0.03),
                            Text("\₹ 50,000",style: TextStyle(
                                color:theColors.primaryColor,fontWeight: FontWeight.w600,fontSize: w*0.09
                            ),),
                          ],
                        ),
                      ),
                      Positioned(
                        top: w*0.06,
                        left: w*0.7,
                        child: Container(
                            height: w*0.18,
                            width: w*0.18,
                            child: SvgPicture.asset(theImages.payment)
                        ),
                      ),
                      Positioned(
                        left: w*0.05,
                        top: w*0.43,
                        child: Text(nameController.text,style: TextStyle(
                            fontSize: w*0.05,fontWeight: FontWeight.w600,color:theColors.primaryColor
                        ),),
                      ),
                      Positioned(
                        left: w*0.75,
                        top: w*0.35,
                        child: Text(dateController.text,style: TextStyle(
                            fontSize: w*0.06,fontWeight: FontWeight.w600,
                          color: theColors.primaryColor,
                        )),
                      ),
                      Positioned(
                        left: w*0.45,
                        top: w*0.49,
                        child: Text(numberController.text,style: TextStyle(
                            fontSize: w*0.045,fontWeight: FontWeight.w600,
                          color: theColors.primaryColor,
                        ),),
                      ),
                    ],
                  ),
                  backWidget: Stack(
                    children: [
                      Container(
                        height: w*0.58,
                        width: w*1,
                        decoration: BoxDecoration(
                          color: theColors.third,
                            borderRadius: BorderRadius.circular(w*0.03)),
                      ),
                      Positioned(
                        top: w*0.08,
                        child: Container(
                          height: w*0.1,
                          width: w*1,
                          color:theColors.secondary,
                        ),
                      ),
                      Positioned(
                          top: w*0.19,
                          left: w*0.61,
                          child: Container(
                            height: w*0.08,
                            width: w*0.15,
                            decoration: BoxDecoration(
                              color:theColors.third,
                                borderRadius: BorderRadius.circular(w*0.03),
                              border: Border.all(color: theColors.secondary)
                            ),
                            child: Center(
                              child: Text(cvvController.text,style: TextStyle(
                                  color:theColors.primaryColor,fontSize: w*0.05,
                                  fontWeight: FontWeight.w600
                              )),
                            ),
                          )
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: w*0.05,
              ),
              Column(
                children: [
                  Padding(
                    padding:  EdgeInsets.all(w*0.03),
                    child: TextFormField(
                      onChanged: (value) {
                        setState(() {
                          nameController.text=value;
                        });
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      textCapitalization: TextCapitalization.characters,
                      keyboardType: TextInputType.name,
                      style: TextStyle(color:theColors.secondary),
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(w*0.04),
                            borderSide: BorderSide(color: theColors.secondary)
                        ),
                        fillColor:theColors.primaryColor,
                        filled: true,
                        labelText: "Full Name",labelStyle: TextStyle(
                          color: theColors.secondary,fontWeight: FontWeight.w500
                      ),
                      ),
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.all(w*0.03),
                    child: TextFormField(
                      onChanged: (value) {
                        setState(() {
                          numberController.text=value;
                        });
                      },
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      keyboardType: TextInputType.number,
                      maxLength: 16,
                      style: TextStyle(color: theColors.secondary),
                      decoration: InputDecoration(
                        counterText: "",
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(w*0.04),
                            borderSide: BorderSide()
                        ),
                        fillColor:theColors.primaryColor ,
                        filled: true,
                        labelText: "Card Number",labelStyle: TextStyle(
                          color:theColors.secondary,fontWeight: FontWeight.w500
                      ),
                      ),
                    ),
                  ),
                ],
              ),
              Center(
                child: Container(
                  padding: EdgeInsets.only(left: w*0.03,),
                  height: w*0.18,
                  width: w*1,
                  child: Row(
                    children: [
                      Container(
                        height: w*0.15,
                        width: w*0.45,
                        decoration: BoxDecoration(
                          color: theColors.primaryColor,
                          borderRadius: BorderRadius.circular(w*0.03),
                        ),
                        child: TextFormField(
                          onChanged: (value) {
                            setState(() {
                              dateController.text=value;
                            });
                          },
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          keyboardType: TextInputType.datetime,
                          style: TextStyle(color:theColors.secondary),
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(w*0.03),
                                borderSide: BorderSide(color:theColors.secondary)
                            ),
                            fillColor:theColors.primaryColor,
                            filled: true,
                            labelText: "Date",labelStyle: TextStyle(
                              color: theColors.secondary,fontWeight: FontWeight.w500
                          ),
                          ),
                        ),
                      ),
                      SizedBox(width: w*0.034),
                      Container(
                        height: w*0.15,
                        width: w*0.45,
                        decoration: BoxDecoration(
                          color: theColors.primaryColor,
                          borderRadius: BorderRadius.circular(w*0.04),
                        ),
                        child: TextFormField(
                          onChanged: (value) {
                            setState(() {
                              cvvController.text=value;
                            });
                          },
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          maxLength: 3,
                          keyboardType: TextInputType.number,
                          style: TextStyle(color:theColors.secondary),
                          decoration: InputDecoration(
                            counterText: "",
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(w*0.04),
                                borderSide: BorderSide(color: theColors.secondary)
                            ),
                            fillColor:theColors.primaryColor,
                            filled: true,
                            labelText: "CVV",labelStyle: TextStyle(
                              color:theColors.secondary,fontWeight: FontWeight.w500
                          ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: w*0.25),
              Center(
                child: InkWell(
                  // onTap: () {
                  //   setState(() {
                  //     if(
                  //     nameController.text!=""&&
                  //         numberController.text!=""&&
                  //         dateController.text!=""&&
                  //         cvvController.text!=""&&
                  //         formKey.currentState!.validate()
                  //     )
                  //     {
                  //       Navigator.push(context, MaterialPageRoute(builder: (context) => paymentNewPage(number: numberController.text,
                  //       ),));
                  //     }
                  //     else{
                  //       nameController.text==""?ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please enter your name"))):
                  //       numberController.text==""?ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please enter your number"))):
                  //       dateController.text==""?ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please enter your date"))):
                  //       cvvController.text==""?ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please enter your cvv"))):
                  //       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please enter your valid details") ));
                  //
                  //     }
                  //   });
                  // },
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => OrderAccepted(),));
                  },

                  child: Container(
                    height: w*0.13,
                    width: w*0.5,
                    decoration: BoxDecoration(color: theColors.third,
                        borderRadius: BorderRadius.circular(w*0.03)
                    ),
                    child: Center(
                        child: Text("Place Order",style: TextStyle(fontWeight: FontWeight.w600,
                          fontSize: w*0.05,
                          color: theColors.primaryColor,

                      ),),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
