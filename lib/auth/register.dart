import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gulugulutrip/auth/loginscreen.dart';
import 'package:gulugulutrip/controller/usercontroller.dart';
import 'package:gulugulutrip/widget/customefield.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _controller.SignUpFormKey,
        child: Column(
          children: <Widget>[
            CustomTextField(
              controller: _controller.nameController,
              keyboardType: TextInputType.text,
              borderColor: Colors.black,
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
            ElevatedButton(
              onPressed: () {
                final isValid =
                    _controller.SignUpFormKey.currentState!.validate();
                if (!isValid) {
                  Get.snackbar("Error", "shouldn't be empty field");
                } else {
                  _controller.checkSignUpForm();
                }
              },
              child: const Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}
