import 'package:animated_rating_stars/animated_rating_stars.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nectar_project1/core/common/colors.dart';
import 'package:nectar_project1/model/exclusive_model.dart';

import '../main.dart';

class exclusiveViewPage extends StatefulWidget {
  final ExclusiveModel exclusiveModel;
  const exclusiveViewPage({super.key,
    required this.exclusiveModel
  });

  @override
  State<exclusiveViewPage> createState() => _exclusiveViewPageState();
}

class _exclusiveViewPageState extends State<exclusiveViewPage> {

  int count = 1;
  bool more = false;

  //for favourite
  bool tap = false;
  checkTap() async {
    final document = await FirebaseFirestore.instance.collection("account").doc(userId).get();
    if(document["favourites"] != null){
      final favourites = document["favourites"] as List;
      setState(() {
        tap = favourites.any((element) => element["name"] == widget.exclusiveModel.name);
      });
    }
  }

  double price = 0;
  double total = 0;

  @override
  void initState() {
    userId = currentUserModel!.id;
    price = widget.exclusiveModel.price;
    checkTap();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: InkWell(
        onTap: () {

        },
        child: Container(
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
                height: h*0.3,
                width: w*1,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(w*0.03),
                      bottomRight: Radius.circular(w*0.03),
                    ),
                    image: DecorationImage(image: NetworkImage(widget.exclusiveModel.image),fit: BoxFit.cover),
                    color: theColors.sixth,
                ),
              ),
              SizedBox(height: h*0.03),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text("${widget.exclusiveModel.name}",style: TextStyle(
                          fontWeight: FontWeight.w600,fontSize: w*0.035
                      ),),
                      Text("1kg,Price")
                    ],
                  ),
                  InkWell(
                      onTap: () {
                        tap=!tap;

                        if(tap == true){
                          FirebaseFirestore.instance.collection("account").doc(userId).update({
                            "favourites" : FieldValue.arrayUnion([
                              {
                                "name": widget.exclusiveModel.name,
                                "price" : widget.exclusiveModel.price,
                                "qty" : widget.exclusiveModel.qty,
                                "image" : widget.exclusiveModel.image
                              }
                            ])
                          });
                        }else{
                          FirebaseFirestore.instance.collection("account").doc(userId).update({
                            "favourites" : FieldValue.arrayRemove([
                              {
                                "name": widget.exclusiveModel.name,
                                "price" : widget.exclusiveModel.price,
                                "qty" : widget.exclusiveModel.qty,
                                "image" : widget.exclusiveModel.image
                              }
                            ])
                          });
                        }

                        setState(() {

                        });
                      },
                      child: tap == true ?Icon(Icons.favorite,color: Colors.red)
                          :
                      Icon( Icons.favorite_border_outlined))
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
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        InkWell(
                            onTap: () {
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
                            child: Icon(Icons.add)),
                      ],
                    ),
                  ),
                  Text("Price : ${widget.exclusiveModel.price*count}",style: TextStyle(
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
                  height: h*0.22,
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
                      Text("${widget.exclusiveModel.description}")
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
      ),
    );
  }
}
