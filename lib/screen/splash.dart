// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gulugulutrip/auth/loginscreen.dart';
import 'package:gulugulutrip/controller/usercontroller.dart';
import 'package:gulugulutrip/widget/navigationbar.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final UserController userController = Get.put(UserController());

  Future<void> redirect() async {
    bool isLogin = await userController.checkLoginStatus();
    if (isLogin) {
      Get.off(() => const Navigationbar());
    } else {
      Get.off(() => const LoginScreen());
    }
  }

  @override
  void initState() {
    super.initState();
    redirect();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: FlutterLogo(
          size: 200,
        ),
      ),
    );
  }
}
