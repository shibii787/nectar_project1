import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nectar_project1/core/common/colors.dart';



class help extends StatefulWidget {
  const help({super.key});

  @override
  State<help> createState() => _helpState();
}

class _helpState extends State<help> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: theColors.primaryColor,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: theColors.primaryColor,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
            child: Icon(CupertinoIcons.back,color: theColors.secondary,)),
        title: Text("Help",style: TextStyle(
            color: theColors.secondary
        )),
      ),
    );
  }
}
