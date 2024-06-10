import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nectar_project1/app_authentication/select_location_page.dart';
import 'package:nectar_project1/app_body/bottom_nav.dart';
import 'package:nectar_project1/app_body/home_page.dart';
// import 'package:nectar_project1/app_profile/delivery%20address.dart';
import 'package:nectar_project1/app_profile/promocard.dart';
import 'package:nectar_project1/firebase_options.dart';
import 'package:nectar_project1/grocery/grocery_item.dart';
import 'package:nectar_project1/pages_showing_items/bananapage.dart';
import 'package:nectar_project1/pages_showing_items/pulses_view page.dart';
import 'package:nectar_project1/pulses/pulses_page.dart';
import 'app_into/splashscreen.dart';
import 'app_payment/Payment_card.dart';
import 'model/userModel.dart';

var h; //variable for height
var w; //variable for width

UserModel? currentUserModel;

var userName;
var userEmail;
var userImage;
var userphoneNumber;
var pincode;
var address;
var userLocation;

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
        home:splashscreen(),
      ),
    );
  }
}
