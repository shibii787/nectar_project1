import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nectar_project1/core/common/colors.dart';

import '../main.dart';

class newCategoryPage extends StatefulWidget {
  final String title;
  final String id;
  const newCategoryPage({super.key,
    required this.id,
    required this.title
  });

  @override
  State<newCategoryPage> createState() => _newCategoryPageState();
}

class _newCategoryPageState extends State<newCategoryPage> {
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
        centerTitle: true,
        title: Text(widget.title,style: TextStyle(
          fontWeight: FontWeight.w600
        ),),
      ),
      body: Column(
        children: [
      StreamBuilder(
      stream: FirebaseFirestore.instance.collection("categories").doc(widget.id).collection("subItems").snapshots(),
        builder: (context, snapshot) {
          if(!snapshot.hasData){
            return Text("No data");
          }
          var newDetails = snapshot.data!.docs;
          return newDetails.length==0?
          Center(
              child: CircularProgressIndicator()) :
          Expanded(
            child: GridView.builder(
            itemCount: newDetails.length,
              physics: BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                crossAxisSpacing: w * 0.03,
                mainAxisSpacing: w * 0.06,
                childAspectRatio: 0.65,
              ),
              itemBuilder: (context, index) {
                return Container(
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      Container(
                        height: w*0.3,
                          width: w*0.5,

                          child: Image.network(newDetails[index]["image"])),
                      Text(newDetails[index]["name"],style: TextStyle(
                          fontWeight: FontWeight.w600,

                      ),),
                      Text("Quantity : ${newDetails[index]["qty"]}".toString(),style: TextStyle(
                          fontWeight: FontWeight.w600
                      ),),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("₹${newDetails[index]["price"]} ".toString(),style: TextStyle(
                              fontWeight: FontWeight.w600,
                            fontSize: w*0.055
                          ),),
                          Container(
                            height: w*0.1,
                            width: w*0.1,
                            decoration: BoxDecoration(
                                borderRadius:
                                BorderRadius.circular(w * 0.04),
                                color: theColors.third,
                                border: Border.all(
                                    color: theColors.seventh,
                                    width: w * 0.003)),
                            child:  Icon(
                              Icons.add,
                              color: theColors.primaryColor,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                );
              },),
          );
        }
      )
        ],
      ),
    );
  }
}
