import 'package:get/get.dart';
import 'package:flutter/material.dart';

customSnarkbar(title, message, type) {
  Get.snackbar(title, message,
      snackPosition: SnackPosition.TOP,
      backgroundColor: type == "error" ? Colors.red : Colors.blue,
      colorText: Colors.white);
}
