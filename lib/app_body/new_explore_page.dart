import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nectar_project1/core/common/colors.dart';


import '../main.dart';
import 'new_category_page.dart';

class newExplorePage extends StatefulWidget {
  const newExplorePage({super.key});

  @override
  State<newExplorePage> createState() => _newExplorePageState();
}

class _newExplorePageState extends State<newExplorePage> {

  //This list is to represent the pictures of the provided categories
  // List categoryImages = [
  //   "https://t3.ftcdn.net/jpg/01/18/84/52/360_F_118845283_n9uWnb81tg8cG7Rf9y3McWT1DT1ZKTDx.jpg", //meat and fish
  //   "https://img.freepik.com/free-photo/colorful-soda-drinks-macro-shot_53876-18225.jpg", // beverage
  //   "https://t3.ftcdn.net/jpg/06/09/78/34/360_F_609783461_HfpzFpb908IhXOR1PSKXGChoZZhXzRBH.jpg", // fruits and vegetables
  //   "https://www.foodnavigator.com/var/wrbm_gb_food_pharma/storage/images/9/1/5/7/907519-1-eng-GB/Spanish-research-aims-to-overcome-milk-egg-allergies.jpg", // milk and eggs
  //   "https://qph.cf2.quoracdn.net/main-qimg-771d07b3c07f38b1679174c4ffedcf4f-lq", // cooking oil and ghee
  //   "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTd_f_-VlTcmkMH8bl5ZW2Rg7GwHf6lpw-eXlW-SWog6g&s", // bakery and snacks
  // ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: theColors.primaryColor,
      appBar: AppBar(
        backgroundColor: theColors.primaryColor,
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text("Categories",style: TextStyle(
          fontWeight: FontWeight.w500,color: theColors.secondary
        ),),
      ),
      body: Padding(
        padding: EdgeInsets.all(w*0.03),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance.collection("categories").orderBy("time",descending: false).snapshots(),
                  builder: (context, snapshot) {
                    if(!snapshot.hasData){
                      return Center(child: CircularProgressIndicator()) ;
                    }
                    var details = snapshot.data!.docs;
                    return details.length == 0?
                        Center(child: CircularProgressIndicator()) :
                        GridView.builder(
                          itemCount: details.length,
                            physics: BouncingScrollPhysics(),
                            scrollDirection: Axis.vertical,
                            shrinkWrap: true,
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                              crossAxisSpacing: w * 0.03,
                              mainAxisSpacing: w * 0.06,
                              childAspectRatio: 0.7,
                            ),
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  Navigator.push(context, CupertinoPageRoute(builder: (context) => newCategoryPage(
                                    id: details[index].id,
                                    title: details[index]["item"],
                                  ),));
                                },
                                child: Container(
                                  height: w*0.55,
                                  width: w*0.35,
                                  padding: EdgeInsets.all(w*0.03),
                                  margin: EdgeInsets.all(w*0.03),
                                  decoration: BoxDecoration(
                                    color: theColors.third.withOpacity(0.2),
                                    borderRadius: BorderRadius.circular(w * 0.05),
                                    border: Border.all(width: w * 0.002, color: theColors.third),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Image(image:NetworkImage(details[index]["image"]),
                                      errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                                        return Container(
                                          height: w*0.2,
                                        width: w*0.4,
                                        decoration: BoxDecoration(
                                          color: theColors.primaryColor,
                                          borderRadius: BorderRadius.circular(w*0.03)
                                        ),
                                        child: Center(
                                        child: Column(
                                         mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Text(
                                            'Image not found',
                                            style: TextStyle(
                                            fontSize: 14,
                                            color: theColors.secondary,
                                            fontWeight: FontWeight.bold,

                                            ),
                                            ),
                                            Text(
                                            '!Checkout your internet connection',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                            fontSize: 8,
                                            color: theColors.thirteen,
                                            fontWeight: FontWeight.bold,

                                            ),
                                            ),
                                          ],
                                        ),
                                        ),
                                        );},
                                      ),
                                      Center(
                                        child: Text(details[index]["item"],style: TextStyle(
                                               fontWeight: FontWeight.w600
                                        ),),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },);
                  },)
            ],
          ),
        ),
      ),
    );
  }
}
