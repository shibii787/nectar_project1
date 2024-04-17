import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nectar_project1/core/common/colors.dart';

import '../main.dart';

class mydetails extends StatefulWidget {
  const mydetails({super.key});

  @override
  State<mydetails> createState() => _mydetailsState();
}

class _mydetailsState extends State<mydetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: theColors.primaryColor,
      appBar: AppBar(
        backgroundColor: theColors.primaryColor,
        centerTitle: true,
        title: Text("My Details",style: TextStyle(
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
