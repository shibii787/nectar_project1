import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nectar_project1/app_body/bakery.dart';
import 'package:nectar_project1/app_body/beverages.dart';
import 'package:nectar_project1/app_body/cookingOil.dart';
import 'package:nectar_project1/app_body/dairyandeggs.dart';
import 'package:nectar_project1/app_body/fruitsAndveg.dart';
import 'package:nectar_project1/app_body/meatandfish.dart';
import 'package:nectar_project1/colors.dart';
import 'package:nectar_project1/images.dart';

import '../main.dart';

class ExplorePage extends StatefulWidget {
  const ExplorePage({super.key});

  @override
  State<ExplorePage> createState() => _ExplorePageState();
}

class _ExplorePageState extends State<ExplorePage> {
  // Gridview Datas is in the List of Map
  List datas=[
    {
      "image":theImages.fruitsAndveg,
      "title":"Fresh Fruits",
      "subtitle":"& Vegetables"
    },
    {
      "image":theImages.oil,
      "title":"Cooking Oil",
      "subtitle":"& Ghee"
    },
    {
      "image":theImages.meatAndfish,
      "title":"Meat & Fish",
      "subtitle":""


    },
    {
      "image":theImages.bakeryAndSnacks,
      "title":"Bakery & Snacks",
      "subtitle":""

    },
    {
      "image":theImages.dairyAndEggs,
      "title":"Dairy & Eggs",
      "subtitle":""

    },
    {
      "image":theImages.beverages,
      "title":"Beverages",
      "subtitle":""

    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: theColors.primaryColor,
        title: Text("Find Products",style: TextStyle(
          fontWeight: FontWeight.w900,),),

        centerTitle: true,
      ),
      body: Padding(
        padding:  EdgeInsets.all(w*0.03),
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                 borderRadius: BorderRadius.circular(w*0.03) ,
                  borderSide: BorderSide(color: theColors.sixth)
                ),
                prefixIcon: Icon(Icons.search),
                hintText: "Search Store"
              ),
            ),
            SizedBox(height: w*0.05,),
            Expanded(
              child: GridView.builder(
                itemCount: datas.length,

                physics: BouncingScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: w*0.03,
                  mainAxisSpacing: w*0.06,
                  childAspectRatio:0.8 ,
                ),
                itemBuilder: (BuildContext context, int index) {
                  return  InkWell(
                    onTap: () {
                      index==0?Navigator.push(context, MaterialPageRoute(builder: (context) => Fruits(),)):index;
                      index==1?Navigator.push(context, MaterialPageRoute(builder: (context) => CookingOil(),)):index;
                      index==2?Navigator.push(context, MaterialPageRoute(builder: (context) => MeatFish(),)):index;
                      index==3?Navigator.push(context, MaterialPageRoute(builder: (context) => Bakery(),)):index;
                      index==4?Navigator.push(context, MaterialPageRoute(builder: (context) => Dairy(),)):index;
                      index==5?Navigator.push(context, MaterialPageRoute(builder: (context) => Beverages(),)):index;
                    },
                    child: Column(
                      children: [
                        Container(
                          width: w*0.5,
                          height: w*0.55,
                          decoration: BoxDecoration(
                              color: theColors.third.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(w*0.05),
                            border: Border.all(width: w*0.002,color: theColors.third)
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                width: w*0.3,
                                  height: w*0.2,

                                  child: Image(image:  AssetImage(datas[index]["image"]),fit: BoxFit.fill)
                              ),
                              Column(
                                children: [
                                  Text(datas[index]["title"],textAlign: TextAlign.center,
                                    style:TextStyle(fontSize: w*0.04,
                                    fontWeight: FontWeight.w900) ,),

                              Text(datas[index]["subtitle"],textAlign: TextAlign.center,
                                style:TextStyle(fontSize: w*0.04,
                                    fontWeight: FontWeight.w900) ,)
                                ],
                              ),
                            ],

                          ),

                        ),
                      ],
                    ),
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
