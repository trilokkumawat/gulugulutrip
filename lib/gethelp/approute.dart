import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:gulugulutrip/auth/loginscreen.dart';
import 'package:gulugulutrip/screen/home.dart';

class AppRoutes {
  static const initial = '/';
  static const home = '/home';
  static const other = '/other';
  static const login = '/login';

  static final routes = [
    GetPage(name: initial, page: () => LoginScreen()),
    GetPage(name: login, page: () => LoginScreen()),
    GetPage(name: home, page: () => const MyHomePage()),
  ];
}
