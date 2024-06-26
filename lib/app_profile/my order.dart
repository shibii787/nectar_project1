import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nectar_project1/core/common/colors.dart';

import '../main.dart';

class myorder extends StatefulWidget {
  const myorder({super.key});

  @override
  State<myorder> createState() => _myorderState();
}

class _myorderState extends State<myorder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: theColors.primaryColor,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: theColors.primaryColor,
       title: Text("My Order",style: TextStyle(
         color: theColors.secondary
       )),
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
            child: Icon(CupertinoIcons.back,color: theColors.secondary)),
      ),
    );
  }
}
