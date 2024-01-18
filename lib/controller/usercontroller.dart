import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserController extends GetxController {
  GlobalKey<FormState> SignUpFormKey = GlobalKey<FormState>();

  final _isLoggedIn = false.obs;
  bool get isLoggedIn => _isLoggedIn.value;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  var selectedGender = 'Male'.obs;

  final FocusNode focusNode1 = FocusNode();
  final FocusNode focusNode2 = FocusNode();
  final FocusNode focusNode3 = FocusNode();
  final FocusNode focusNode4 = FocusNode();

  @override
  void onInit() {
    super.onInit();
    checkLoginStatus();
  }

  @override
  void onClose() {
    // Dispose of the controller when the controller is closed
    nameController.dispose();
    emailController.dispose();
    addressController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  String? validateEmail(String value) {
    if (value.isEmpty) {
      return "Check your email";
    }

    return null;
  }

  String? validateAll(String value) {
    if (value.isEmpty) {
      return "This field shouldn't be empty ";
    }

    return null;
  }

  String? validateMobile(String value) {
    if (value.length < 10) {
      return "Phone must be of 10 characters";
    }
    return null;
  }

  void checkSignUpForm() {
    final isValid = SignUpFormKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    SignUpFormKey.currentState!.save();
    Get.snackbar("su", "start method");
  }

  checkLoginStatus() async {
    await Future.delayed(Duration(seconds: 2));
    final prefs = await SharedPreferences.getInstance();
    final loggedIn = prefs.getBool('isLoggedIn') ?? false;
    _isLoggedIn.value = loggedIn;
    return loggedIn;
  }

  Future<void> login() async {
    // Perform login logic here (e.g., API call)
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', true);
    _isLoggedIn.value = true;
  }

  Future<void> register() async {
    // Perform registration logic here (e.g., API call)
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', true);
    _isLoggedIn.value = true;
  }

  Future<void> logout() async {
    // Perform logout logic here (e.g., API call)
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', false);
    _isLoggedIn.value = false;
  }
}
