
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nectar_project1/account.dart';
import 'package:nectar_project1/app_authentication/log_in.dart';
import 'package:nectar_project1/app_authentication/sign_page.dart';
import 'package:nectar_project1/app_authentication/verification_page.dart';
import 'package:nectar_project1/app_body/cart_page.dart';
import 'package:nectar_project1/app_into/splashscreen.dart';

import 'app_body/bottom_nav.dart';

var h; //variable for height
var w; //variable for width

void main(){

  // to stop tilting the app
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp
  ]);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    h=MediaQuery.of(context).size.height;
    w=MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus!.unfocus();
      },
      child: MaterialApp(
        theme: ThemeData(
            textTheme: GoogleFonts.pontanoSansTextTheme()
        ),
        debugShowCheckedModeBanner: false,
        home: account(),
      ),
    );
  }
}
