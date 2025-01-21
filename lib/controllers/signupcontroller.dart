import 'dart:convert';

import 'package:dstmobileapp/utils/baseurl.dart';
import 'package:dstmobileapp/utils/customsnarkbar.dart';
import 'package:dstmobileapp/widgets/loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../routes.dart';

class SignupController extends GetxController {
  late TextEditingController usernameController;
  late TextEditingController auuidController;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController phoneController;

  @override
  void onInit() {
    super.onInit();

    usernameController = TextEditingController();
    auuidController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    phoneController = TextEditingController();
  }

  @override
  void onClose() {
    super.onClose();

    usernameController.dispose();
    auuidController.dispose();
    emailController.dispose();
    passwordController.dispose();
    phoneController.dispose();
  }

  checkSignup() {
    if (usernameController.text.isEmpty) {
      customSnarkbar("Error", "Name is Required", "error");
      return;
    } else if (auuidController.text.isEmpty) {
      customSnarkbar("Error", "AUUID is Required", "error");
      return;
    } else if (emailController.text.isEmpty ||
        GetUtils.isEmail(emailController.text) == false) {
      customSnarkbar("Error", "Email is Required", "error");
      return;
    } else if (phoneController.text.isEmpty) {
      customSnarkbar("Error", "Phone Number is Required", "error");
      return;
    } else if (passwordController.text.isEmpty) {
      customSnarkbar("Error", "Password is Required", "error");
      return;
    } else {
      Get.showOverlay(
          asyncFunction: () => signup(), loadingWidget: const Loader());
    }
  }

  signup() async {
    try {
      var response = await http.post(
        Uri.parse("${baseurl}action.dst.php"),
        body: {
          "auuid": auuidController.text,
          "dst_name": usernameController.text,
          "dst_email": emailController.text,
          "dst_phone": phoneController.text,
          "dst_pwd": passwordController.text,
          "add_dst": "1",
        },
      );

      var res = jsonDecode(response.body);
      if (res["success"]) {
        customSnarkbar("Success", res["message"], "success");
        Get.offAllNamed(GetRoutes.login);
      } else {
        customSnarkbar("Oops", res["message"], "error");
      }
    } catch (e) {
      // Handle exceptions such as network issues
      customSnarkbar("Error", "Something went wrong: $e", "error");
    }
  }
}
