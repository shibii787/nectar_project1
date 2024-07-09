import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nectar_project1/core/common/colors.dart';
import 'package:nectar_project1/feature/addingDetails/controller/addController.dart';
import 'package:nectar_project1/grocery/grocery_item.dart';

import '../main.dart';

class grocerypage extends ConsumerStatefulWidget {
  const grocerypage({super.key});

  @override
  ConsumerState<grocerypage> createState() => _grocerypageState();
}

class _grocerypageState extends ConsumerState<grocerypage> {
  @override

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(CupertinoIcons.back,color: Colors.black,)),
          backgroundColor: theColors.primaryColor,
          title: Text("Groceries", style: TextStyle(
            color: theColors.secondary, fontWeight: FontWeight.w600,
          ),),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: w*0.03,),
              ref.watch(groceryStreamprovider)
                  .when(
                data: (data){
                  return Container(
                    height: h*1,
                    width: w*1,
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
                          child:Container(
                            height: h*0.2,
                            width: w*0.4,
                            padding: EdgeInsets.all(w*0.03),
                            margin: EdgeInsets.all(w*0.03),
                            decoration: BoxDecoration(
                              color: theColors.third.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(w * 0.05),
                              border: Border.all(width: w * 0.002, color: theColors.third),
                            ),
                            child: Padding(
                              padding: EdgeInsets.all(w * 0.02),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    height: w * 0.17,
                                    width: w * 0.17,
                                    child: Image.network(data[index].image,fit: BoxFit.fill,),
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
                                            fontSize: w*0.06
                                          ),),
                                        Container(
                                          height: w * 0.09,
                                          width: w * 0.09,
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


