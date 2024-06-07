import 'package:flutter/material.dart';

import '../main.dart';

class groceryitemPage extends StatefulWidget {
  const groceryitemPage({super.key});

  @override
  State<groceryitemPage> createState() => _groceryitemPageState();
}

class _groceryitemPageState extends State<groceryitemPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(
  centerTitle: true,
  title: Text("Grocery Item"),
  elevation: 0,
),
      body: Column(
        children: [
          Container(
            height: w*0.8,
            width: w*1,
            color: Colors.red,
          )
        ],
      ),




    );
  }
}
