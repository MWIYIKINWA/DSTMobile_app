//import 'package:dstmobileapp/models/dstresizing.dart';
import 'package:dstmobileapp/screens/auth/login_screen.dart';
import 'package:dstmobileapp/screens/auth/signup_screen.dart';
import 'package:dstmobileapp/screens/home/first_page.dart';
import 'package:dstmobileapp/screens/home/home_screen.dart';
import 'package:dstmobileapp/screens/pages/orders/addorder.dart';
import 'package:dstmobileapp/screens/pages/orders/orders.dart';
import 'package:dstmobileapp/screens/pages/profile.dart';
import 'package:dstmobileapp/screens/pages/reports.dart';
import 'package:dstmobileapp/screens/pages/resizing/addresizing.dart';
import 'package:dstmobileapp/screens/pages/resizing/resizing.dart';
import 'package:get/get_navigation/get_navigation.dart';

class GetRoutes {
  static const String splash = "/splash";
  static const String login = "/login";
  static const String signup = "/signup";
  static const String home = "/home";
  static const String orders = "/orders";
  static const String addorders = "/addorders";
  static const String resizing = "/resizing";
  static const String addresizing = "/addresizing";
  static const String profilepage = "/profile";
  static const String reportspage = "/reports";

  static List<GetPage> routes = [
    GetPage(name: GetRoutes.splash, page: () => const SplashScreen()),
    GetPage(name: GetRoutes.login, page: () => LoginScreen()),
    GetPage(name: GetRoutes.signup, page: () => SignupScreen()),
    GetPage(name: GetRoutes.home, page: () => const Dashboard()),
    GetPage(name: GetRoutes.orders, page: () => Orders()),
    GetPage(name: GetRoutes.resizing, page: () => const ResizingPage()),
    GetPage(name: GetRoutes.addorders, page: () => const AddOrder()),
    GetPage(name: GetRoutes.addresizing, page: () => AddResizing()),
    GetPage(name: GetRoutes.profilepage, page: () => const Profile()),
    GetPage(name: GetRoutes.reportspage, page: () => const Reports()),
  ];
}
