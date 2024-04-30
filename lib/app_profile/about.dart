import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nectar_project1/core/common/colors.dart';


class about extends StatefulWidget {
  const about({super.key});

  @override
  State<about> createState() => _aboutState();
}

class _aboutState extends State<about> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: theColors.primaryColor,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: theColors.primaryColor,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
            child: Icon(CupertinoIcons.back,color: theColors.secondary,)),
        title: Text("About",style: TextStyle(
            color: theColors.secondary
        )),
      ),
    );
  }
}
