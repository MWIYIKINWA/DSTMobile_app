import 'dart:convert';

import 'package:dstmobileapp/models/dstprofile.dart';
import 'package:dstmobileapp/models/dstresizing.dart';
import 'package:dstmobileapp/routes.dart';
import 'package:dstmobileapp/utils/baseurl.dart';
import 'package:dstmobileapp/utils/customsnarkbar.dart';
import 'package:dstmobileapp/utils/sharedprefs.dart';
import 'package:dstmobileapp/widgets/loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ResizingController extends GetxController {
  late TextEditingController customerName;
  late TextEditingController currentService;
  late TextEditingController currentISP;
  late TextEditingController bandWidth;
  late TextEditingController currentCharge;
  late TextEditingController location;
  late TextEditingController street;

  // Reactive list to store resizing data
  var resizing = <Resizing>[].obs;

// Filtered Reactive list to store resizing data
  var filteredResizing = <Resizing>[].obs;

  //resizing count
  var resizingCount = 0.obs;

  void filterResizing(String query) {
    resizingCount.value = resizing.length;
    if (query.isEmpty) {
      filteredResizing.assignAll(resizing);
    } else {
      filteredResizing.assignAll(resizing.where((item) =>
          (item.resCustomer!.toLowerCase().contains(query.toLowerCase()))));

      resizingCount.value = filteredResizing.length;
    }
  }

  @override
  void onInit() {
    super.onInit();
    fetchResizingData();

    customerName = TextEditingController();
    currentService = TextEditingController();
    currentISP = TextEditingController();
    bandWidth = TextEditingController();
    currentCharge = TextEditingController();
    location = TextEditingController();
    street = TextEditingController();
  }

  @override
  void onClose() {
    super.onClose();

    customerName.dispose();
    currentService.dispose();
    currentISP.dispose();
    bandWidth.dispose();
    currentCharge.dispose();
    location.dispose();
    street.dispose();
  }

//insert data

  insertResizingResponse() async {
    if (customerName.text.isEmpty) {
      customSnarkbar("Error", "Customer name is Required", "error");
      return;
    } else if (currentService.text.isEmpty) {
      customSnarkbar("Error", "Service Required", "error");
      return;
    } else if (currentISP.text.isEmpty) {
      customSnarkbar("Error", "ISP  Required", "error");
      return;
    } else if (bandWidth.text.isEmpty) {
      customSnarkbar("Error", "BansWidth is Required", "error");
      return;
    } else if (currentCharge.text.isEmpty) {
      customSnarkbar("Error", "Charge is Required", "error");
      return;
    } else if (location.text.isEmpty) {
      customSnarkbar("Error", "Location is Required", "error");
      return;
    } else if (street.text.isEmpty) {
      customSnarkbar("Error", "Street is Required", "error");
      return;
    } else {
      Get.showOverlay(
          asyncFunction: () => insertResponse(), loadingWidget: const Loader());
    }
  }

//insert response

  insertResponse() async {
    var usr = await SharedPrefs().getUser();
    DstProfile profile = DstProfile.fromJson(json.decode(usr));

    try {
      var response = await http.post(
        Uri.parse("${baseurl}action.resizing.php"),
        body: {
          "customer": customerName.text,
          "isp": currentISP.text,
          "amount": currentCharge.text,
          "service": currentService.text,
          "bw": bandWidth.text,
          "location": location.text,
          "street": location.text,
          "dst_name": profile.dstName.toString(),
          "auuid": profile.auuid.toString(),
          "add_resizing": "1",
        },
      );

      var res = jsonDecode(response.body);
      if (res["success"]) {
        customSnarkbar("Success", res["message"], "success");
        fetchResizingData();
        Get.offNamed(GetRoutes.resizing);
      } else {
        customSnarkbar("Oops", res["message"], "error");
      }
    } catch (e) {
      customSnarkbar("Error", "Something went wrong: $e", "error");
    }
  }

  //fetch data

  void fetchResizingData() async {
    try {
      // Retrieve user profile from shared preferences
      var usr = await SharedPrefs().getUser();
      DstProfile profile = DstProfile.fromJson(json.decode(usr));

      // Make API call
      var response = await http.post(
        Uri.parse("${baseurl}action.resizing.php"),
        body: {
          "dstauuid": profile.auuid.toString(),
          "resizingbyauuid": "2",
        },
      );

      var res = json.decode(response.body);

      if (res is List) {
        resizing.assignAll(res.map((data) => Resizing.fromJson(data)).toList());
        filteredResizing.assignAll(resizing);
        resizingCount.value = resizing.length;
      } else {
        customSnarkbar("Oops", "Data loading failed", "error");
      }
    } catch (e) {
      //print("Error: $e");
      customSnarkbar("Error", "Something went wrong", "error");
    }
  }
}
