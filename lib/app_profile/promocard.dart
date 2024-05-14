import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:nectar_project1/core/common/colors.dart';

class promocard extends StatefulWidget {
  const promocard({super.key});

  @override
  State<promocard> createState() => _promocardState();
}

class _promocardState extends State<promocard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: theColors.primaryColor,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: theColors.primaryColor,
        title: Text("Promo Card",style: TextStyle(
          color: theColors.secondary
        )),
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
            child: Icon(CupertinoIcons.back,color: theColors.secondary)),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset("assets/icons/Animation - 1715679709474.json")
        ],
      ),
    );
  }
}
