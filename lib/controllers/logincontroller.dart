import 'dart:convert';

import 'package:dstmobileapp/models/dstprofile.dart';
import 'package:dstmobileapp/routes.dart';
import 'package:dstmobileapp/utils/baseurl.dart';
import 'package:dstmobileapp/utils/customsnarkbar.dart';
import 'package:dstmobileapp/utils/sharedprefs.dart';
import 'package:dstmobileapp/widgets/loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class LoginController extends GetxController {
  late TextEditingController loginAuuidController;
  late TextEditingController loginPasswordController;

  @override
  void onInit() {
    super.onInit();
    loginAuuidController = TextEditingController();
    loginPasswordController = TextEditingController();
  }

  @override
  void onClose() {
    // Dispose only if they are not null and active
    try {
      loginAuuidController.dispose();
      loginPasswordController.dispose();
    } catch (e) {
      //print("Controller already disposed: $e");
    }
    super.onClose();
  }

  var dstname = ''.obs;

  checkLogin() {
    if (loginAuuidController.text.isEmpty) {
      customSnarkbar("Error", "AUUID is Required", "error");
      return;
    } else if (loginPasswordController.text.isEmpty) {
      customSnarkbar("Error", "Password is Required", "error");
      return;
    } else {
      Get.showOverlay(
          asyncFunction: () => login(), loadingWidget: const Loader());
    }
  }

  login() async {
    try {
      var response =
          await http.post(Uri.parse("${baseurl}action.dst.php"), body: {
        "login_auuid": loginAuuidController.text,
        "login_dst_pwd": loginPasswordController.text,
        "login_dst": "1",
      });

      var res = jsonDecode(response.body);

      if (res["success"]) {
        customSnarkbar("Success", res["message"], "success");
        DstProfile dstprofile = DstProfile.fromJson(res['profile']);
        await SharedPrefs().storeUser(json.encode(dstprofile));
        dstname.value = dstprofile.dstName!;
        Get.offAllNamed(
          GetRoutes.home,
        );
      } else {
        customSnarkbar("Oops", res["message"], "error");
      }
    } catch (e) {
      customSnarkbar("Error", "An unexpected error occurred: $e", "error");
    }
  }

  //

  void logout() async {
    await SharedPrefs().removeUser();
    Get.offAllNamed(GetRoutes.login);
  }
}
