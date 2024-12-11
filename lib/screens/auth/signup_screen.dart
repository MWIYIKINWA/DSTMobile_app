import 'package:dstmobileapp/controllers/signupcontroller.dart';
import 'package:dstmobileapp/routes.dart';
import 'package:dstmobileapp/widgets/dstbuttons.dart';
import 'package:dstmobileapp/widgets/dsttextfields.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});

  final signupController = Get.put(SignupController());

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
                "Sign up",
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
                child: GetBuilder<SignupController>(builder: (controller) {
                  return Column(
                    children: [
                      // ignore: prefer_const_constructors
                      MyTextBox(
                        hint: 'AUUID',
                        icon: Icons.person,
                        controller: controller.auuidController,
                      ),

                      const SizedBox(height: 20),

                      MyTextBox(
                        hint: 'Email',
                        icon: Icons.email,
                        controller: controller.emailController,
                      ),

                      const SizedBox(height: 20),

                      MyTextBox(
                        hint: 'User name',
                        icon: Icons.person,
                        controller: controller.usernameController,
                      ),

                      const SizedBox(height: 20),
                      // Password TextFormField

                      MyTextBox(
                        hint: "Phone",
                        icon: Icons.phone,
                        controller: controller.phoneController,
                      ),

                      const SizedBox(height: 20),

                      MyTextBox(
                        hint: "Password",
                        obscureText: true,
                        icon: Icons.lock,
                        controller: controller.passwordController,
                      ),

                      const SizedBox(height: 30),

                      MyButton(
                        label: "SignUp",
                        onPressed: () {
                          controller.checkSignup();
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
                              text: "Already have an account? ",
                              style: TextStyle(
                                fontSize: 16,
                                fontFamily: "Poppins",
                                color: Colors.black,
                              ),
                            ),
                            TextSpan(
                              text: "Login",
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Get.toNamed(GetRoutes.login);
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
