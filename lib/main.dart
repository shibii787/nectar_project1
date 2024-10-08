import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nectar_project1/firebase_options.dart';
import 'app_into/splashscreen.dart';
import 'model/userModel.dart';

var h; //variable for height
var w; //variable for width

UserModel? currentUserModel;

var userName;
var userEmail;
var userImage;
var userId;
var userPhoneNumber;
var userPincode;
var userAddress;
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
