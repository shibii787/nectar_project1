import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nectar_project1/core/common/colors.dart';
import 'package:nectar_project1/core/common/images.dart';
import 'package:nectar_project1/feature/addingDetails/controller/addController.dart';
import 'package:nectar_project1/grocery/grocery_item.dart';

import '../main.dart';

class grocerypage extends ConsumerStatefulWidget {
  const grocerypage({super.key});

  @override
  ConsumerState<grocerypage> createState() => _grocerypageState();
}

class _grocerypageState extends ConsumerState<grocerypage> {
  List Grocery = [
    {
      "image": theImages.daawatrice,
      "name": "Daawat Rice",
      "qty": 1,
      "price": 560,
      "description": "good rice"
    }
  ];

  addGroceryList() async {
    for (int i = 0; i < Grocery.length; i++) {
      await FirebaseFirestore.instance.collection("grocery").add(Grocery[i]);
    }
  }

  @override
  void initState() {
    //   addGroceryList();
    //   // TODO: implement initState
    super.initState();
     }


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
          title: Text("Groceries", style: TextStyle(
            color: theColors.secondary, fontWeight: FontWeight.w600,
          ),),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ref.watch(groceryStreamprovider)
                  .when(
                data: (data){
                  return Container(
                    height: h,
                    width: w,
                    child: GridView.builder(
                      shrinkWrap: true,
                      itemCount: data.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: w * 0.03,
                        mainAxisSpacing: w * 0.03,
                        childAspectRatio: 0.75,

                      ),
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(context,
                                MaterialPageRoute(
                                  builder: (context) => groceryitemPage(
                                    name:data[index].name,
                                    price:double.parse(data[index].price.toString()),
                                    qty:int.parse(data[index].qty.toString()),
                                    description: data[index].description,
                                    image:data[index].image,),
                                ));
                          },
                          child: Container(
                            height: w * 0.6,
                            width: w * 0.4,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(w * 0.03),
                                border: Border.all(color: theColors.nine)
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(w * 0.02),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    height: w * 0.31,
                                    width: w * 0.4,
                                    child: Image.asset(theImages.daawatrice),
                                  ),
                                  Container(
                                    height: w * 0.14,
                                    width: w * 0.4,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(data[index].name.toUpperCase(), style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                          fontSize: w*0.04
                                        ),),
                                        Text(data[index].qty.toString(), style: TextStyle(
                                            color: theColors.eleventh,
                                            fontSize: w * 0.05
                                        ),),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    height: w * 0.1,
                                    width: w * 0.4,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment
                                          .spaceBetween,
                                      children: [
                                        Text(data[index].price.toString(),
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                            fontSize: w*0.06
                                          ),),
                                        Container(
                                          height: w * 0.1,
                                          width: w * 0.1,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                              BorderRadius.circular(w * 0.04),
                                              color: theColors.third,
                                              border: Border.all(
                                                  color: theColors.seventh,
                                                  width: w * 0.003)),
                                          child: Icon(
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
                          ),
                        );
                      },
                    ),
                  );
                },
                error: (error, stackTrace) {
                  return Text(error.toString());
                },
                loading:(){
                  return
                      Center(child: CircularProgressIndicator());
                },
              )


            ],
          ),
        ),
      );
    }
  }


