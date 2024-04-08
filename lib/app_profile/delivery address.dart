import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nectar_project1/colors.dart';

import '../main.dart';

class deliveryaddress extends StatefulWidget {
  const deliveryaddress({super.key});

  @override
  State<deliveryaddress> createState() => _deliveryaddressState();
}

class _deliveryaddressState extends State<deliveryaddress> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: theColors.primaryColor,
        centerTitle: true,
        title: Text("Delivery Address",style: TextStyle(
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
