import 'package:country_code_picker/country_code_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:nectar_project1/app_authentication/forgot_password.dart';
import 'package:nectar_project1/app_authentication/select_location_page.dart';
import 'package:nectar_project1/app_authentication/signup_page.dart';
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

  bool tap = true;

  TextEditingController numberController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final emailValidation =
  RegExp(r"^[a-z0-9.a-z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-z0-9]+\.[a-z]+");
  final passwordValidation =
  RegExp(r"^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$");

  final phoneValidation = RegExp(r"[0-9]{10}$");

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
              left: w * 0.03, right: w * 0.03, bottom: w * 0.03),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(theImages.signimage),
                Text(
                  "Get your groceries \n with nectar",
                  style:
                      TextStyle(fontSize: w * 0.06, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: w * 0.03),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(w*0.03)
                  ),
                  child: TextFormField(
                    style: TextStyle(
                      color: theColors.secondary,
                    ),
                    controller: emailController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if(!emailValidation.hasMatch(value!))
                      {
                        return "Email";
                      }
                      else{
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: theColors.third.withOpacity(0.08),
                      labelText: "Email",
                      labelStyle: TextStyle(
                          color: theColors.secondary
                      ),
                      hintText: "Enter the Email",
                      hintStyle: TextStyle(
                          color: theColors.secondary
                      ),
                      suffixIcon: Icon(CupertinoIcons.mail),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(w*0.03),
                        borderSide: BorderSide(
                            color: theColors.third
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(w*0.03),
                        borderSide: BorderSide(
                            color: theColors.third
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(w*0.03),
                        borderSide: BorderSide(
                            color: theColors.third
                        ),
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
                SizedBox(
                  height: w * 0.03,
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(w*0.03)
                  ),
                  child: TextFormField(
                    style: TextStyle(
                      color: theColors.secondary,
                    ),
                    controller: passwordController,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: (value) {
                      if(!passwordValidation.hasMatch(value!))
                      {
                        return "Password";
                      }
                      else{
                        return null;
                      }
                    },
                    obscureText: tap?true:false,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: theColors.third.withOpacity(0.08),
                      labelText: "Password",
                      labelStyle: TextStyle(
                          color: theColors.secondary
                      ),
                      hintText: "Enter the password",
                      hintStyle: TextStyle(
                          color: theColors.secondary
                      ),
                      suffixIcon: InkWell(
                          onTap: () {
                            tap=!tap;
                            setState(() {
                            });
                          },
                          child:tap==false? Icon(Icons.visibility,
                            color: theColors.secondary,):Icon(Icons.visibility_off,
                            color: theColors.secondary,)),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(w*0.03),
                        borderSide: BorderSide(
                            color: theColors.third
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(w*0.03),
                        borderSide: BorderSide(
                            color: theColors.third
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(w*0.03),
                        borderSide: BorderSide(
                            color: theColors.third
                        ),
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
                SizedBox(
                  height: w * 0.03,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(),
                    Row(),
                    InkWell(
                      onTap: () {
                        Navigator.push(context, CupertinoPageRoute(builder: (context) => forgotPassword(),));
                      },
                      child: Text(
                        "Forgot Password?",
                        style: TextStyle(color: theColors.third),
                      ),
                    )
                  ],
                ),
                SizedBox(height: w*0.03,),
                InkWell(
                  onTap: () {
                    Navigator.push(context, CupertinoPageRoute(builder: (context) => selectLocationPage(),));
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
                Center(
                  child: Text(
                    "Or connect with social media",
                    style: TextStyle(
                      color: theColors.eleventh,
                    ),
                  ),
                ),
                SizedBox(height: w*0.02,),
                InkWell(
                  onTap: () {
                    signInWithGoogle().then((value) => Navigator.pushReplacement(context, CupertinoPageRoute(builder: (context) => selectLocationPage(),)));
                  },
                  child: Container(
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
                ),
                SizedBox(height: w*0.03,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don’t have an account?",
                      style: TextStyle(
                        color: theColors.secondary,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => signupPage(),
                            ));
                      },
                      child: Text(
                        " Signup",
                        style: TextStyle(color: theColors.third),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
