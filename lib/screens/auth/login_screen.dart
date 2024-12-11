import 'package:dstmobileapp/controllers/logincontroller.dart';
import 'package:dstmobileapp/routes.dart';
import 'package:dstmobileapp/widgets/dstbuttons.dart';
import 'package:dstmobileapp/widgets/dsttextfields.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final logincontroller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 120.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "DST Login",
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 30,
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 30), // Space below the title
              Container(
                padding: const EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 5,
                      blurRadius: 10,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: GetBuilder<LoginController>(builder: (controller) {
                  return Column(
                    children: [
                      // ignore: prefer_const_constructors
                      MyTextBox(
                        hint: 'AUUID',
                        icon: Icons.person,
                        controller: controller.loginAuuidController,
                      ),

                      const SizedBox(height: 20),
                      // Password TextFormField
                      // ignore: prefer_const_constructors
                      MyTextBox(
                        hint: "Password",
                        obscureText: true,
                        icon: Icons.lock,
                        controller: controller.loginPasswordController,
                      ),

                      const SizedBox(height: 30),

                      MyButton(
                        label: "Login",
                        onPressed: () {
                          controller.checkLogin();
                        },
                      ),

                      const SizedBox(height: 20),

                      const Image(
                        image: AssetImage('assets/images/airtel.png'),
                        height: 60,
                        fit: BoxFit.contain,
                      ),

                      Text.rich(
                        TextSpan(
                          children: [
                            const TextSpan(
                              text: "Have no account? ",
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: "Poppins",
                                color: Colors.black,
                              ),
                            ),
                            TextSpan(
                              text: "Sign-Up",
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Get.toNamed(GetRoutes.signup);
                                },
                              style: const TextStyle(
                                fontSize: 16,
                                fontFamily: "Poppins",
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
