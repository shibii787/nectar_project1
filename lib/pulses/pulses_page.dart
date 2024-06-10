import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nectar_project1/core/common/colors.dart';
import 'package:nectar_project1/feature/addingDetails/controller/addController.dart';
import 'package:nectar_project1/pages_showing_items/pulses_view page.dart';


import '../main.dart';

class pulses extends ConsumerStatefulWidget {
  const pulses({super.key});

  @override
  ConsumerState<pulses> createState() => _pulsesState();
}
class _pulsesState extends ConsumerState<pulses> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: theColors.primaryColor,
        title: Text("Pulses",style: TextStyle(
          fontSize: w*0.07,
           color: theColors.secondary,
        )),
        leading:InkWell(
          onTap: () {
            Navigator.pop(context);
          },
            child: Icon(CupertinoIcons.back,color: theColors.secondary)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.all(w*0.01),
          child: Column(
            children: [
                ref.watch(pulsesStreamprovider).when(
                    data: (data) {
                      return Container(
                        height: h*1,
                        width: w*1,
                        // color: Colors.red,
                        child: GridView.builder(
                        shrinkWrap: true,
                        physics: BouncingScrollPhysics(),
                        itemCount: data.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount:2,
                        crossAxisSpacing: w*0.03,
                        mainAxisSpacing: w*0.03,
                        childAspectRatio: 0.75,
                        ),
                        itemBuilder: (context, index) {
                    return    InkWell(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context) =>greengrems(
                            image: data[index].image,
                            price:data[index].price.toString(),
                            qty: data[index].qty.toString(),
                            name: data[index].name,
                            discription: data[index].description,
                          ) ,));
                        },
                        child: Container(
                            height: h*0.20,
                            width: w*0.4,
                            padding: EdgeInsets.all(w*0.03),
                            margin: EdgeInsets.all(w*0.03),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(w*0.03),
                              border: Border.all(
                                  color: theColors.eleventh
                              ),
                            ),
                            child: Column(
                              children: [
                                Image.asset(data[index].image,height: w*0.3,),
                                Text(data[index].name,style: TextStyle(
                                  fontWeight: FontWeight.w700
                                )),
                                Text(data[index].qty.toString(),style: TextStyle(
                                  fontWeight: FontWeight.w600
                                ),),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text("₹${data[index].price}".toString(),style: TextStyle(
                                      fontWeight: FontWeight.w600
                                    ),),
                                    Container(
                                      height: w*0.09,
                                      width: w*0.09,
                                      decoration: BoxDecoration(
                                          color: theColors.fourteen,
                                        borderRadius: BorderRadius.circular(w*0.03)
                                      ),
                                       child: Icon(Icons.add,color: theColors.primaryColor),
                                    )
                                  ],
                                ),

                              ],
                            ),
                        ),
                          );
                        },),
                      );
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
  ]),
        ),
      )
    );
  }
}
