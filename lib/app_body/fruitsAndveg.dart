import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nectar_project1/core/common/colors.dart';
import 'package:nectar_project1/core/common/icons.dart';

import '../main.dart';

class categories extends StatefulWidget {
  final String category;
  const categories({super.key, required this.category});

  @override
  State<categories> createState() => _categoriesState();
}

class _categoriesState extends State<categories> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        elevation: 0,
        backgroundColor: theColors.primaryColor,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
            child: Icon(CupertinoIcons.back,)),
        title: Text(widget.category,style: TextStyle(
          fontWeight: FontWeight.w900,),),
        centerTitle: true,
        actions: [
          InkWell(
            onTap: () {

            },
              child: SvgPicture.asset(theIcons.filterIcon)),
          SizedBox(width: w*0.03,)
        ],
      ),
      body: Padding(
        padding:  EdgeInsets.all(w*0.03),
        child: Column(
          children: [
            Expanded(
              child: GridView.builder(
                itemCount:1,

                physics: BouncingScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: w*0.03,
                  mainAxisSpacing: w*0.06,
                  childAspectRatio:0.8 ,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    width: w*0.5,
                    height: w*0.55,
                    decoration: BoxDecoration(
                        color: theColors.primaryColor,
                        borderRadius: BorderRadius.circular(w*0.05),
                        border: Border.all(width: w*0.002,color: theColors.eleventh)
                    ),
                    child:Padding(
                      padding:  EdgeInsets.only(left: w*0.03,right: w*0.03),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Container(
                              width: w*0.3,
                                height: w*0.3,
                                child: Image(image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQwHOLSsljNVyrQ4u46Zmhk9sIKkQ30WEnAND84y0S_MA&s"),fit: BoxFit.fill,)
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(widget.category, style:TextStyle(fontSize: w*0.04,
                                  fontWeight: FontWeight.w900)),
                              Text("1kg, price",style:
                              TextStyle(
                                  fontSize: w*0.03,
                                color: theColors.eleventh
                              ),)
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("₹ 70", style:TextStyle(fontSize: w*0.04,
                                  fontWeight: FontWeight.w900)),
                              Container(
                                width: w*0.12,
                                height: w*0.12,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(w*0.05),
                                  color: theColors.third,
                                ),
                                child: Icon(Icons.add,
                                  color: theColors.primaryColor,),

                              )
                            ],
                          )

                        ],
                      ),
                    ) ,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
