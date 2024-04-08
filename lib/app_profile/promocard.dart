import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nectar_project1/colors.dart';

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
            child: Icon(CupertinoIcons.back,color: theColors.secondary)),
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
