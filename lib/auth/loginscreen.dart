import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gulugulutrip/auth/loginscreen.dart';
import 'package:gulugulutrip/controller/usercontroller.dart';
import 'package:gulugulutrip/widget/customefield.dart';
import 'package:gulugulutrip/widget/navigationbar.dart';
import 'package:gulugulutrip/widget/themcolor.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  // ignore: unused_field
  final UserController _controller = Get.put(UserController());
  @override
  void initState() {
    super.initState();
    _controller.nameController.text = '';
    _controller.emailController.text = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(title: const Text("Login")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _controller.SignUpFormKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Agent Login",
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              Text("Let's get started",
                  style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: 25),
              const Text(
                "Sign in to continue.",
                style: TextStyle(fontWeight: FontWeight.w300, fontSize: 18),
              ),
              const SizedBox(height: 10),

              CustomTextField(
                controller: _controller.nameController,
                labelplaceholername: const Text("Email Address"),
                borderColor: mycolor,
                keyboardType: TextInputType.emailAddress,
                focusNode: _controller.focusNode1,
                onSubmitted: (value) {
                  FocusScope.of(context).requestFocus(_controller.focusNode2);
                },
                validator: (value) {
                  return _controller.validateAll(value!);
                },
              ),
              const SizedBox(height: 10),

              CustomTextField(
                controller: _controller.emailController,
                labelplaceholername: const Text("Password"),
                keyboardType: TextInputType.text,
                borderColor: Colors.black,
                focusNode: _controller.focusNode2,
                onSubmitted: (value) {
                  _controller.focusNode2.unfocus();
                },
                validator: (value) {
                  return _controller.validateEmail(value!);
                },
              ),
              // Other input fields (email, address, gender, password) go here

              const SizedBox(height: 20),
              Align(
                alignment: Alignment.center,
                child: ElevatedButton(
                  onPressed: () async {
                    final isValid =
                        _controller.SignUpFormKey.currentState!.validate();
                    if (!isValid) {
                      Get.snackbar("Error", "shouldn't be empty field");
                    } else {
                      // _controller.checkSignUpForm();
                      await _controller.login();
                      if (_controller.isLoggedIn) {
                        Get.off(() => const Navigationbar());
                      } else {
                        Get.snackbar("Login Failed",
                            "Invalid credentials. Please try again.");
                      }
                    }
                  },
                  child: const Text('Submit'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
