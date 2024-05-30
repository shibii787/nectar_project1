import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nectar_project1/core/common/colors.dart';
import 'package:package_info_plus/package_info_plus.dart';
//import 'package:package_info_plus/package_info_plus.dart';
// import 'package:package_info_plus/package_info_plus.dart';

import '../main.dart';

class About extends StatefulWidget {
  const About({super.key});

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {

  String? _packageInfoText;

    getInfoPressed() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String appName = packageInfo.appName;
    String packageName = packageInfo.packageName;
    String version = packageInfo.version;
    String buildNumber = packageInfo.buildNumber;
    setState(() {
      _packageInfoText = "App name: $appName\n"
          "Package name: $packageName\n"
          "Version: $version\n"
          "Build number: $buildNumber\n";
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: theColors.primaryColor,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: theColors.primaryColor,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(CupertinoIcons.back, color: theColors.secondary),
        ),
        title: Text("About", style: TextStyle(color: theColors.secondary)),
      ),
      body: Padding(
        padding:  EdgeInsets.all(w*0.03),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                getInfoPressed();
              },
              child: Text("Get info"),
            ),
            SizedBox(height: w * 0.04),
            _packageInfoText != null
                ? Text(
              _packageInfoText!,
              style: TextStyle(fontSize: w * 0.05),
            )
                : Container(),
          ],
        ),
      ),
    );
  }
}