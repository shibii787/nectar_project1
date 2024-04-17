import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nectar_project1/app_authentication/log_in.dart';
import 'package:nectar_project1/app_authentication/verification_page.dart';
import 'package:nectar_project1/core/common/colors.dart';
import 'package:nectar_project1/core/common/images.dart';

import '../main.dart';

class signPage extends StatefulWidget {
  const signPage({super.key});

  @override
  State<signPage> createState() => _signPageState();
}

class _signPageState extends State<signPage> {
  TextEditingController numberController = TextEditingController();

  final phoneValidation = RegExp(r"[0-9]{10}$");

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
              left: w * 0.03, right: w * 0.03, bottom: w * 0.03),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(theImages.signimage),
              SizedBox(
                height: w * 0.04,
              ),
              Text(
                "Get your groceries \n with nectar",
                style:
                    TextStyle(fontSize: w * 0.06, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: w * 0.03),
              Container(
                decoration: BoxDecoration(
                    color: theColors.primaryColor,
                    borderRadius: BorderRadius.circular(w * 0.03)),
                child: TextFormField(
                  onFieldSubmitted: (value) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => verificationPage(),
                        ));
                  },
                  style: TextStyle(color: theColors.secondary),
                  maxLength: 10,
                  controller: numberController,
                  keyboardType: TextInputType.number,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (!phoneValidation.hasMatch(value!)) {
                      return "Enter valid number";
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    counterText: "",
                    hintText: "Enter the number",
                    hintStyle: TextStyle(color: theColors.secondary),
                    suffixIconConstraints: BoxConstraints(minWidth: w * 0.2),
                    suffixIcon: Container(
                      width: w * 0.07,
                      height: w * 0.07,
                      child: Center(
                          child: Icon(
                        CupertinoIcons.phone,
                        color: theColors.secondary,
                        size: w * 0.06,
                      )),
                    ),
                    prefixIcon: CountryCodePicker(
                      flagDecoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(w * 0.02)),
                      initialSelection: "IN",
                      showDropDownButton: true,
                      showFlagMain: true,
                      showFlag: true,
                      showCountryOnly: false,
                      hideMainText: true,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(w * 0.03),
                        borderSide: BorderSide.none),
                    label: Text("Number",
                        style: TextStyle(color: theColors.secondary)),
                    // focusedBorder: OutlineInputBorder(
                    //   borderRadius: BorderRadius.circular(width*0.03),
                    //     borderSide: BorderSide(
                    //         color: Colors.blue
                    //     )
                    // )
                  ),
                ),
              ),
              SizedBox(
                height: w * 0.03,
              ),
              Center(
                child: Text(
                  "Or connect with social media",
                  style: TextStyle(
                    color: theColors.eleventh,
                  ),
                ),
              ),
              SizedBox(
                height: w * 0.03,
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context, CupertinoPageRoute(builder: (context) => logIn(),));
                },
                child: Container(
                  height: w * 0.15,
                  width: w * 1,
                  decoration: BoxDecoration(
                      color: theColors.third.withOpacity(0.8),
                      borderRadius: BorderRadius.circular(w * 0.04)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Icon(Icons.login_outlined,color: theColors.primaryColor,),
                      Text(
                        "Log In",
                        style: TextStyle(
                            color: theColors.primaryColor, fontSize: w * 0.045),
                      ),
                      Row()
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: w * 0.02,
              ),
              Container(
                height: w * 0.15,
                width: w * 1,
                decoration: BoxDecoration(
                    color: theColors.fourth,
                    borderRadius: BorderRadius.circular(w * 0.04)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                        child: Image.asset(
                      theImages.googleimage,
                      height: w * 0.075,
                    )),
                    Text(
                      "Continue with Google",
                      style: TextStyle(
                          color: theColors.primaryColor, fontSize: w * 0.045),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: w * 0.02,
              ),
              Container(
                height: w * 0.15,
                width: w * 1,
                decoration: BoxDecoration(
                    color: theColors.fifth,
                    borderRadius: BorderRadius.circular(w * 0.04)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                        child: Image.asset(
                      theImages.fbimage,
                      height: w * 0.075,
                    )),
                    Text(
                      "Continue with Facebook",
                      style: TextStyle(
                          color: theColors.primaryColor, fontSize: w * 0.045),
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
