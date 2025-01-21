import 'package:dstmobileapp/controllers/logincontroller.dart';
import 'package:dstmobileapp/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  Get.put(LoginController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'DSTMobile',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
      ),
      initialRoute: GetRoutes.splash,
      getPages: GetRoutes.routes,
      debugShowCheckedModeBanner: false,
    );
  }
}
