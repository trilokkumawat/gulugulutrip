import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:get/get.dart';
import 'package:gulugulutrip/auth/register.dart';
import 'package:gulugulutrip/screen/home.dart';
import 'package:gulugulutrip/widget/mydrawer.dart';

class Navigationbar extends StatefulWidget {
  const Navigationbar({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _NavigationbarState createState() => _NavigationbarState();
}

class _NavigationbarState extends State<Navigationbar> {
  int _selectedPage = 0;
  final List<Widget> _pages = [
    const RegisterScreen(),
    const MyHomePage(),
    const Page3(),
  ];

  gettitle(status) {
    final Map<int, String> statusDec = <int, String>{
      0: "Register",
      1: "Home",
      2: "Page3",
    };

    return statusDec[status];
  }

  int _backButtonPressedCount = 0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // final isFirstRouteInCurrentTab = Get.isDialogOpen! &&
        //     !await Get.key.currentState!
        //         .maybePop(); // Check if you're at the root route
        // return isFirstRouteInCurrentTab;
        final isDialogClosed = Get.isDialogOpen!;
        if (isDialogClosed) {
          _backButtonPressedCount = 0;
          return false;
        } else {
          _backButtonPressedCount++;
          if (_backButtonPressedCount == 2) {
            // If back button is pressed twice, exit the app
            return true;
          } else {
            Get.snackbar('Exit', 'Press back again to exit',
                snackPosition: SnackPosition.BOTTOM);
            Future.delayed(const Duration(seconds: 2), () {
              setState(() {
                _backButtonPressedCount = 0;
              });
            });
            return false;
          }
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('${gettitle(_selectedPage)}'),
        ),
        drawer: const MyDrawer(),
        body: _pages[_selectedPage],
        bottomNavigationBar: CurvedNavigationBar(
          index: _selectedPage,
          backgroundColor: Colors.grey,
          items: const <Widget>[
            Icon(Icons.home, size: 30),
            Icon(Icons.search, size: 30),
            Icon(Icons.settings, size: 30),
          ],
          onTap: (index) {
            setState(() {
              _selectedPage = index;
            });
          },
        ),
      ),
    );
  }
}

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Page 1 Content'),
    );
  }
}

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Page 2 Content'),
    );
  }
}

class Page3 extends StatelessWidget {
  const Page3({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Page 3 Content'),
    );
  }
}
