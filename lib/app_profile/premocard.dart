import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nectar_project1/colors.dart';

import '../main.dart';

class promocard extends StatefulWidget {
  const promocard({super.key});

  @override
  State<promocard> createState() => _promocardState();
}

class _promocardState extends State<promocard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: theColors.primaryColor,
        title: Text("Promo Card",style: TextStyle(
          color: theColors.secondary
        )),
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
            child: Icon(CupertinoIcons.back,color: theColors.secondary,size: w*0.09)),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
              image: NetworkImage("https://cdni.iconscout.com/illustration/premium/thumb/oops-page-not-found-3702353-3119142.png"))
        ],
      ),
    );
  }
}
