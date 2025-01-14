import 'package:dstmobileapp/routes.dart';
import 'package:dstmobileapp/widgets/dstbuttons.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.red, Colors.white]),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "DSTMobile",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 30),
              ),
              const SizedBox(
                height: 20,
              ),
              const Image(
                image: AssetImage('assets/images/spashimage.png'),
                height: 40.0,
                fit: BoxFit.fill,
              ),
              const SizedBox(height: 10),
              MyButton(
                label: "GET STARTED",
                onPressed: () {
                  Get.toNamed(GetRoutes.login);
                },
              ),
              const SizedBox(
                height: 80.0,
              ),
              const Image(
                image: AssetImage('assets/images/logo_transparent.png'),
                height: 50.0,
                fit: BoxFit.fill,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
