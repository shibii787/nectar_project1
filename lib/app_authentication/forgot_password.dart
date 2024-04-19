import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nectar_project1/app_authentication/signup_page.dart';
import 'package:nectar_project1/core/common/colors.dart';

import '../main.dart';

class forgotPassword extends StatefulWidget {
  const forgotPassword({super.key});

  @override
  State<forgotPassword> createState() => _forgotPasswordState();
}

class _forgotPasswordState extends State<forgotPassword> {

  bool tick=false;

  TextEditingController passwordController=TextEditingController();
  TextEditingController passwordController2=TextEditingController();

  final passwordValidation = RegExp(r"^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$");

  bool tap=true;
  bool tap2=true;

  final formKey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: theColors.primaryColor,
        elevation: 0,
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
            icon: Icon(CupertinoIcons.back)),
        title: Text("Create New Password",
            style: TextStyle(
                fontSize: w*0.06,
                fontWeight: FontWeight.w500
            )
        ),
        leadingWidth: w*0.05,
      ),
      backgroundColor: theColors.primaryColor,
      body: Padding(
        padding:  EdgeInsets.all(w*0.05),
        child: SingleChildScrollView(
          child: Container(
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: w*0.85),
                  Text("Create Your New Password",
                    style: TextStyle(
                        color: theColors.secondary,
                        fontSize: w*0.04
                    ),),
                  SizedBox(height: w*0.06,),
                  Container(
                    decoration: BoxDecoration(
                        color: theColors.third,
                        borderRadius: BorderRadius.circular(w*0.03)
                    ),
                    child: TextFormField(
                      style: TextStyle(
                          color: theColors.primaryColor
                      ),
                      controller: passwordController2,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if(!passwordValidation.hasMatch(value!))
                        {
                          return "Enetr the password";
                        }
                        else{
                          return null;
                        }
                      },
                      obscureText: tap?true:false,
                      decoration: InputDecoration(
                        hintText: "Enter the password",
                        hintStyle: TextStyle(
                            color: theColors.thirteen
                        ),
                        prefixIcon: InkWell(
                            onTap: () {
                              tap=!tap;
                              setState(() {
                              });
                            },
                            child:tap==false? Icon(Icons.visibility,
                              color: theColors.primaryColor,):Icon(Icons.visibility_off,
                              color: theColors.primaryColor,)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(w*0.03),
                          borderSide: BorderSide.none,
                        ),
                        label: Padding(
                          padding: EdgeInsets.all(w*0.025),
                          child: Text("Password",
                              style: TextStyle(
                                  color: theColors.primaryColor,
                                  fontSize: w*0.05
                              )),
                        ),
                        // focusedBorder: OutlineInputBorder(
                        //   borderRadius: BorderRadius.circular(width*0.03),
                        //     borderSide: BorderSide(
                        //         color: Colors.blue
                        //     )
                        // )
                      ),
                    ),
                  ),
                  SizedBox(height: w*0.03,),
                  Container(
                    decoration: BoxDecoration(
                        color: theColors.third,
                        borderRadius: BorderRadius.circular(w*0.03)
                    ),
                    child: TextFormField(
                      style: TextStyle(
                          color: theColors.primaryColor
                      ),
                      controller: passwordController,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if(!passwordValidation.hasMatch(value!))
                        {
                          return "Enetr the password";
                        }
                        else{
                          return null;
                        }
                      },
                      obscureText: tap2?true:false,
                      decoration: InputDecoration(
                        hintText: "Enter the password",
                        hintStyle: TextStyle(
                            color: theColors.thirteen
                        ),
                        prefixIcon: InkWell(
                            onTap: () {
                              tap2=!tap2;
                              setState(() {
                              });
                            },
                            child:tap2==false? Icon(Icons.visibility,
                              color: theColors.primaryColor,):Icon(Icons.visibility_off,
                              color: theColors.primaryColor,)),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(w*0.03),
                          borderSide: BorderSide.none,
                        ),
                        label: Padding(
                          padding: EdgeInsets.all(w*0.11),
                          child: Text("New Password",
                              style: TextStyle(
                                  color: theColors.primaryColor,
                                  fontSize: w*0.05
                              )),
                        ),
                        // focusedBorder: OutlineInputBorder(
                        //   borderRadius: BorderRadius.circular(width*0.03),
                        //     borderSide: BorderSide(
                        //         color: Colors.blue
                        //     )
                        // )
                      ),
                    ),
                  ),
                  SizedBox(height: w*0.03,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Checkbox(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(w*0.01),
                        ),
                        activeColor: theColors.third,
                        side: BorderSide(
                            color: theColors.third,
                            width: w*0.006
                        ),
                        value: tick, onChanged: (value) {
                        setState(() {
                          tick=value!;
                        });
                      },),
                      Text("Remember me",
                        style: TextStyle(
                            color: theColors.secondary,
                            fontSize: w*0.05
                        ),),
                    ],
                  ),
                  SizedBox(height: w*0.1,),
                  InkWell(
                    onTap: () {
                      if(
                      passwordController.text!=""&&
                          passwordController2.text!=""&&
                          passwordController.text==passwordController2.text&&
                          formKey.currentState!.validate()
                      )
                      {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => signupPage(),));
                      }
                      else{

                        passwordController.text==""?ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please enter your password"))):
                        passwordController2.text==""?ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please enter your Newpassword"))):
                        passwordController2.text!=passwordController.text?ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Passwords do not match!!!"))):
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please enter your valid details") ));
                      }
                    },
                    child: Container(
                      height:w*0.16,
                      width: w*0.9,
                      decoration: BoxDecoration(
                        color: theColors.third,
                        borderRadius: BorderRadius.circular(w*1),
                      ),
                      child: Center(
                        child: Text("Continue",
                            style: TextStyle(
                                color: theColors.primaryColor,
                                fontSize: w*0.05,
                                fontWeight: FontWeight.w400
                            )),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
