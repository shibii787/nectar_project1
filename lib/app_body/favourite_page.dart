import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:nectar_project1/core/common/colors.dart';

import '../main.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({super.key});

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {

  // To remove favourite
  bool tap = false;
  removeFav(){
    tap=!tap;
    setState(() {

    });
  }

  @override
  void initState() {
    userId = currentUserModel!.id;
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: theColors.primaryColor,
      floatingActionButton: Container(
        height: w * 0.15,
        width: w * 0.9,
        decoration: BoxDecoration(
            color: theColors.third,
            borderRadius: BorderRadius.circular(w * 0.04)),
        child: Center(
          child: Text("Add All To Cart",
              style: TextStyle(
                  color: theColors.primaryColor,
                  fontSize: w*0.045,
                  fontWeight: FontWeight.w500)),
        ),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        elevation: 0,
        title: Text("Favourites"),
        backgroundColor: theColors.primaryColor,
      ),
      body: Padding(
        padding: EdgeInsets.all(w*0.03),
        child: SingleChildScrollView(
          child: Column(
            children: [
              StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
                  stream: FirebaseFirestore.instance.collection("account").doc(userId).snapshots(),
                  builder: (context, snapshot) {
                    if(!snapshot.hasData){
                      return Center(child: CircularProgressIndicator());
                    }
                     DocumentSnapshot<Map<String, dynamic>> data = snapshot.data!;
                    //List<dynamic> fav = snapshot.data!.data()!['favourites'] ?? [];
                     List<dynamic> fav = data.data()!["favourites"] ?? [];
                      return GridView.builder(
                        itemCount: fav.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        physics: BouncingScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                          mainAxisSpacing: h*0.01,
                          crossAxisSpacing: w*0.01,
                          childAspectRatio: 0.8
                        ),
                        itemBuilder: (context, index) {
                        return Container(
                          height: h*0.1,
                          width: w*0.1,
                          margin: EdgeInsets.all(w*0.01),
                          padding: EdgeInsets.all(w*0.01),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(w*0.03),
                            color: theColors.third.withOpacity(0.2),
                            border: Border.all(
                                color: theColors.third
                            ),
                          ),
                          child: AnimationLimiter(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: AnimationConfiguration.toStaggeredList(
                                  childAnimationBuilder: (widget) {
                                    return SlideAnimation(
                                        child: FadeInAnimation(
                                          duration: Duration(seconds: 1),
                                            child: widget));
                                  }, children: [
                                Image.network(fav[index]["image"],
                                  errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                                    return Container(
                                      height: w*0.1,
                                      width: w*1,
                                      decoration: BoxDecoration(
                                          color: theColors.primaryColor,
                                          borderRadius: BorderRadius.circular(w*0.03)
                                      ),
                                      child: Center(
                                        child: Text(
                                          '!Check your internet connection',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: theColors.thirteen,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                                Text(fav[index]["name"],
                                style: TextStyle(
                                  fontWeight: FontWeight.w500
                                ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Text("${fav[index]["price"].toString()} ₹",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        removeFav();
                                      },
                                      child: tap == true
                                          ? Icon(Icons.favorite, color: Colors.red)
                                          : Icon(Icons.favorite_border_outlined),
                                    )

                                  ],
                                ),
                              ])
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
