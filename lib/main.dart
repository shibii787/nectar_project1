import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nectar_project1/app_authentication/log_in.dart';
import 'package:nectar_project1/app_authentication/sign_page.dart';
import 'package:nectar_project1/app_authentication/signup_page.dart';
import 'package:nectar_project1/app_authentication/verification_page.dart';
import 'package:nectar_project1/app_body/cart_page.dart';
import 'package:nectar_project1/app_body/order_accepted.dart';
import 'package:nectar_project1/app_body/appleDetails.dart';
import 'package:nectar_project1/app_into/splashscreen.dart';
import 'package:nectar_project1/app_profile/about.dart';
import 'package:nectar_project1/app_profile/account.dart';
import 'package:nectar_project1/app_profile/delivery%20address.dart';
import 'package:nectar_project1/app_profile/help.dart';
import 'package:nectar_project1/app_profile/my%20order.dart';
import 'package:nectar_project1/app_profile/mydetails.dart';
import 'package:nectar_project1/app_profile/notification.dart';
import 'package:nectar_project1/app_profile/payment%20methods.dart';
import 'package:nectar_project1/app_profile/premocard.dart';
import 'app_body/bottom_nav.dart';
import 'app_payment/Payment_card.dart';
import 'app_payment/payment1.dart';

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
            textTheme: GoogleFonts.poppinsTextTheme()
        ),
        debugShowCheckedModeBanner: false,
        home: splashscreen(),
      ),
    );
  }
}
