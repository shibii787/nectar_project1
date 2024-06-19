import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nectar_project1/core/common/colors.dart';
import 'package:nectar_project1/feature/addingDetails/controller/addController.dart';


import '../main.dart';
import 'new_category_page.dart';

class newExplorePage extends ConsumerStatefulWidget {
  const newExplorePage({super.key});

  @override
  ConsumerState<newExplorePage> createState() => _newExplorePageState();
}

class _newExplorePageState extends ConsumerState<newExplorePage> {

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

              ref.watch(addCategoryProvider).when(
                  data: (data) {
                    return GridView.builder(
                      itemCount: data.length,
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
                              id: data[index].id,
                              title: data[index].name,
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
                                Image(image:NetworkImage(data[index].image),
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
                                              '!Check your internet connection',
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
                                    );
                                    },
                                ),
                                Center(
                                  child: Text(data[index].name,style: TextStyle(
                                      fontWeight: FontWeight.w600
                                  ),),
                                )
                              ],
                            ),
                          ),
                        );
                      },);
                  },
                  error: (error, stackTrace) {
                    return Text(error.toString());
                  },
                  loading: () {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  },
              )

              // StreamBuilder<QuerySnapshot>(
              //     stream: FirebaseFirestore.instance.collection("categories").orderBy("time",descending: false).snapshots(),
              //     builder: (context, snapshot) {
              //       if(!snapshot.hasData){
              //         return Center(child: CircularProgressIndicator()) ;
              //       }
              //       var details = snapshot.data!.docs;
              //       return details.length == 0?
              //           Center(child: CircularProgressIndicator()) :
              //           GridView.builder(
              //             itemCount: details.length,
              //               physics: BouncingScrollPhysics(),
              //               scrollDirection: Axis.vertical,
              //               shrinkWrap: true,
              //               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //                   crossAxisCount: 2,
              //                 crossAxisSpacing: w * 0.03,
              //                 mainAxisSpacing: w * 0.06,
              //                 childAspectRatio: 0.7,
              //               ),
              //               itemBuilder: (context, index) {
              //                 return InkWell(
              //                   onTap: () {
              //                     Navigator.push(context, CupertinoPageRoute(builder: (context) => newCategoryPage(
              //                       id: details[index].id,
              //                       title: details[index]["item"],
              //                     ),));
              //                   },
              //                   child: Container(
              //                     height: w*0.55,
              //                     width: w*0.35,
              //                     padding: EdgeInsets.all(w*0.03),
              //                     margin: EdgeInsets.all(w*0.03),
              //                     decoration: BoxDecoration(
              //                       color: theColors.third.withOpacity(0.2),
              //                       borderRadius: BorderRadius.circular(w * 0.05),
              //                       border: Border.all(width: w * 0.002, color: theColors.third),
              //                     ),
              //                     child: Column(
              //                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              //                       children: [
              //                         Image(image:NetworkImage(details[index]["image"]),
              //                         errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
              //                           return Container(
              //                             height: w*0.2,
              //                           width: w*0.4,
              //                           decoration: BoxDecoration(
              //                             color: theColors.primaryColor,
              //                             borderRadius: BorderRadius.circular(w*0.03)
              //                           ),
              //                           child: Center(
              //                           child: Column(
              //                            mainAxisAlignment: MainAxisAlignment.center,
              //                             children: [
              //                               Text(
              //                               'Image not found',
              //                               style: TextStyle(
              //                               fontSize: 14,
              //                               color: theColors.secondary,
              //                               fontWeight: FontWeight.bold,
              //
              //                               ),
              //                               ),
              //                               Text(
              //                               '!Check your internet connection',
              //                               textAlign: TextAlign.center,
              //                               style: TextStyle(
              //                               fontSize: 8,
              //                               color: theColors.thirteen,
              //                               fontWeight: FontWeight.bold,
              //
              //                               ),
              //                               ),
              //                             ],
              //                           ),
              //                           ),
              //                           );},
              //                         ),
              //                         Center(
              //                           child: Text(details[index]["item"],style: TextStyle(
              //                                  fontWeight: FontWeight.w600
              //                           ),),
              //                         )
              //                       ],
              //                     ),
              //                   ),
              //                 );
              //               },);
              //     },)

            ],
          ),
        ),
      ),
    );
  }
}
