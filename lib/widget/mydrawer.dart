import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gulugulutrip/auth/loginscreen.dart';
import 'package:gulugulutrip/controller/usercontroller.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  final UserController _controller = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(padding: EdgeInsets.zero, children: [
      const UserAccountsDrawerHeader(
        currentAccountPicture: CircleAvatar(
          backgroundImage: NetworkImage(
              'https://images.unsplash.com/photo-1485290334039-a3c69043e517?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwxfDB8MXxyYW5kb218MHx8fHx8fHx8MTYyOTU3NDE0MQ&ixlib=rb-1.2.1&q=80&utm_campaign=api-credit&utm_medium=referral&utm_source=unsplash_source&w=300'),
        ),
        accountEmail: Text('jane.doe@example.com'),
        accountName: Text(
          'Tk Developer',
          style: TextStyle(fontSize: 24.0),
        ),
        decoration: BoxDecoration(
          color: Colors.black87,
        ),
      ),
      ListTile(
        leading: const Icon(Icons.house),
        title: const Text(
          'Home',
        ),
        onTap: () {},
      ),
      ListTile(
        leading: const Icon(Icons.house),
        title: const Text(
          'Logout',
        ),
        onTap: () async {
          await _controller.logout();
          if (!_controller.isLoggedIn) {
            Get.off(() => const LoginScreen());
          }
        },
      ),
    ]));
  }
}
