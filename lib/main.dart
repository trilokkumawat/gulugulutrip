import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gulugulutrip/auth/loginscreen.dart';
import 'package:gulugulutrip/controller/usercontroller.dart';
import 'package:gulugulutrip/gethelp/approute.dart';
import 'package:gulugulutrip/screen/splash.dart';
import 'package:gulugulutrip/widget/errorwidget.dart';
import 'package:gulugulutrip/widget/navigationbar.dart';
import 'package:gulugulutrip/widget/themcolor.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final UserController userController = Get.put(UserController());

    return GetMaterialApp(
      title: 'Tripechalo',
      theme: ThemeData(
        primarySwatch: mycolor,
      ),
      home: const SplashScreen(),
    );
  }
}
