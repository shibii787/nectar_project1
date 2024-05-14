import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nectar_project1/app_authentication/forgot_password.dart';
import 'package:nectar_project1/app_authentication/select_location_page.dart';
import 'package:nectar_project1/app_authentication/sign_page.dart';
import 'package:nectar_project1/app_authentication/signup_page.dart';
import 'package:nectar_project1/app_authentication/verification_page.dart';
import 'package:nectar_project1/app_body/cart_page.dart';
import 'package:nectar_project1/app_body/order_accepted.dart';
import 'package:nectar_project1/pages_showing_items/appleDetails.dart';
import 'package:nectar_project1/app_into/splashscreen.dart';
import 'package:nectar_project1/app_profile/about.dart';
import 'package:nectar_project1/app_profile/account.dart';
import 'package:nectar_project1/app_profile/delivery%20address.dart';
import 'package:nectar_project1/app_profile/help.dart';
import 'package:nectar_project1/app_profile/my%20order.dart';
import 'package:nectar_project1/app_profile/mydetails.dart';
import 'package:nectar_project1/app_profile/notification.dart';
import 'package:nectar_project1/app_profile/payment%20methods.dart';
import 'package:nectar_project1/app_profile/promocard.dart';
import 'package:nectar_project1/app_body/new_explore_page.dart';
import 'package:nectar_project1/firebase_options.dart';
import 'package:nectar_project1/pages_showing_items/bananapage.dart';
import 'app_body/bottom_nav.dart';
import 'app_payment/Payment_card.dart';
import 'app_payment/payment1.dart';

var h; //variable for height
var w; //variable for width

Future<void> main() async {
 WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp(
   options: DefaultFirebaseOptions.currentPlatform
 );
  // to stop tilting the app
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp
  ]);

  runApp(ProviderScope(
      child: MyApp()));
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
        home: bananapage(),
      ),
    );
  }
}
