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

  TextEditingController pincodeController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  @override
  void initState() {
    addressController.text = userAddress.toString();
    pincodeController.text = userPincode.toString();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: theColors.primaryColor,
      appBar: AppBar(
        elevation: 0,
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
      body: Padding(
        padding:  EdgeInsets.all(w*0.03),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: h*0.55,
                width: w*1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(userName,style: TextStyle(
                        fontSize: w*0.05
                    )),
                    Text(userEmail,style: TextStyle(
                    ),),
                    Divider(
                      indent: w*0.03,
                      endIndent: w*0.03,
                    ),
                    Text("Location"),
                    TextFormField(
                      controller: addressController,
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.emailAddress,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: theColors.primaryColor,
                        suffixIcon: Icon(CupertinoIcons.pencil),
                        hintText: "Enter Your Address",
                        labelText: "Address",
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(w*0.03)),
                      ),
                    ),
                    TextFormField(
                      controller: pincodeController,
                      textInputAction: TextInputAction.next,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      decoration: InputDecoration(
                          fillColor: theColors.primaryColor,
                          filled: true,
                          suffixIcon: Icon(CupertinoIcons.number_circle),
                          hintText: "Enter Your Pincode",
                          labelText: "Pincode",
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(w*0.03)),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
