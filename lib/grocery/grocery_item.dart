import 'package:animated_rating_stars/animated_rating_stars.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nectar_project1/core/common/colors.dart';

import '../main.dart';

class groceryitemPage extends StatefulWidget {
  final String name;
  final double price;
  final int qty;
  final String description;
  final String image;
  const groceryitemPage({super.key,
    required this.name,
    required this.price,
    required this.qty,
    required this.description,
    required this.image,


  });

  @override
  State<groceryitemPage> createState() => _groceryitemPageState();
}

class _groceryitemPageState extends State<groceryitemPage> {
   int count=1;
   bool updwn=false;
   bool fav=true;

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
  centerTitle: true,
  backgroundColor: theColors.primaryColor,
  title: Text("Grocery Item",style: TextStyle(fontWeight: FontWeight.w600,
      color: theColors.secondary,
      fontSize: w*0.05),),
  elevation: 0,
  leading: InkWell(
    onTap: () {
      Navigator.pop(context);
    },
      child: Icon(CupertinoIcons.back,color: theColors.secondary)),
),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.all(w*0.03),
          child: Column(
            children: [
              Container(
                height: w*0.8,
                width: w*1,
                child: Image.network(widget.image)
              ),
              Container(
                height: w*0.4,
                width: w*1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("${widget.name}"
                          ,style: TextStyle(fontWeight: FontWeight.w600,
                            fontSize: w*0.05),),
                        InkWell(
                          onTap: () {
                            setState(() {
                              fav=!fav;
                            });
                          },
                          child: Icon(fav==false?Icons.favorite_border:Icons.favorite,
                            color: theColors.thirteen,
                          ),
                        )
                      ],
                    ),
                    Text("1kg,Price",style: TextStyle(fontSize:w*0.03),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Container(
                  height: h*0.05,
                  width: w*0.5,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(w*0.03),
                      color: theColors.twelfth
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                          onTap:() {
                            count==1?1:count--;
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
                            child: Text(count.toString(),style: TextStyle(
                                fontWeight: FontWeight.w500
                            ),),
                          )),
                      InkWell(
                          onTap: () {
                            count++;
                            setState(() {

                            });
                          },
                          child: Icon(Icons.add))
                    ],
                  ),
                ),
                        Text("${widget.price}",style: TextStyle(
                          fontSize: w*0.06,
                        ),)
                      ],
                    )
                  ],
                ),
              ),
              InkWell(
                onTap: () {
                  updwn=!updwn;
                  setState(() {

                  });
                },
                child: updwn==true? Container(
                  height: h*0.14,
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
                      Text("${widget.description}")
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
            ],
          ),
        ),
      ),
    );
  }
}
