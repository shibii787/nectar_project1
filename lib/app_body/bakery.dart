import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:nectar_project1/core/common/colors.dart';
import 'package:nectar_project1/core/common/icons.dart';

import '../main.dart';

class Bakery extends StatefulWidget {
  const Bakery({super.key});

  @override
  State<Bakery> createState() => _BakeryState();
}

class _BakeryState extends State<Bakery> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(CupertinoIcons.back,)),
        title: Text("Bakery & Snacks",style: TextStyle(
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
                                child: Image(image: NetworkImage("https://3.imimg.com/data3/KY/YT/MY-1714805/egg-puffs.jpg"),fit: BoxFit.fill,)
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Egg Puffs", style:TextStyle(fontSize: w*0.04,
                                  fontWeight: FontWeight.w900)),
                              Text("1 pcs, price",style:
                              TextStyle(
                                  fontSize: w*0.03,
                                  color: theColors.eleventh
                              ),)
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("₹ 30", style:TextStyle(fontSize: w*0.04,
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
