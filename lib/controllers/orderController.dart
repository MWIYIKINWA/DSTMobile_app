import 'dart:convert';

import 'package:dstmobileapp/models/dstorders.dart';
import 'package:dstmobileapp/models/dstprofile.dart';
import 'package:dstmobileapp/routes.dart';
import 'package:dstmobileapp/utils/baseurl.dart';
import 'package:dstmobileapp/utils/customsnarkbar.dart';
import 'package:dstmobileapp/utils/sharedprefs.dart';
import 'package:dstmobileapp/widgets/loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class OrderController extends GetxController {
  late TextEditingController customerName;
  late TextEditingController customerAddress;
  late TextEditingController contactPerson;
  late TextEditingController phoneNumber;
  late TextEditingController alternativeNumber;
  late TextEditingController billingEmail;
  late TextEditingController productType;
  late TextEditingController customerType;
  late TextEditingController requestType;
  late TextEditingController categoryOfService;
  late TextEditingController productName;
  late TextEditingController billingCountry;
  late TextEditingController contractPrice;
  late TextEditingController currency;
  late TextEditingController tid;
  late TextEditingController requestSource;
  late TextEditingController uploadDocs;
  late TextEditingController remarks;

  // All orders
  var orders = <AllOrders>[].obs;

  // Filtered orders
  var filteredOrders = <AllOrders>[].obs;

  //sales count
  var mySalesCount = 0.obs;

  void filterOrders(String query) {
    if (query.isEmpty) {
      filteredOrders.assignAll(orders);
      mySalesCount.value = orders.length;
    } else {
      filteredOrders.assignAll(orders.where((item) =>
          (item.customerName!.toLowerCase().contains(query.toLowerCase()) ||
              (item.sofNo!.toString().contains(query.toLowerCase())))));
      mySalesCount.value = filteredOrders.length;
    }
  }

  @override
  void onInit() {
    super.onInit();

    // Initialize controllers
    customerName = TextEditingController();
    customerAddress = TextEditingController();
    contactPerson = TextEditingController();
    phoneNumber = TextEditingController();
    alternativeNumber = TextEditingController();
    billingEmail = TextEditingController();
    productType = TextEditingController();
    customerType = TextEditingController();
    requestType = TextEditingController();
    categoryOfService = TextEditingController();
    productName = TextEditingController();
    billingCountry = TextEditingController();
    contractPrice = TextEditingController();
    currency = TextEditingController();
    tid = TextEditingController();
    requestSource = TextEditingController();
    remarks = TextEditingController();
    uploadDocs = TextEditingController();

    // Fetch orders
    fetchOrders();
  }

  @override
  void onClose() {
    super.onClose();

    // Dispose controllers
    customerName.dispose();
    customerAddress.dispose();
    contactPerson.dispose();
    phoneNumber.dispose();
    alternativeNumber.dispose();
    billingEmail.dispose();
    productType.dispose();
    customerType.dispose();
    requestType.dispose();
    categoryOfService.dispose();
    productName.dispose();
    billingCountry.dispose();
    contractPrice.dispose();
    currency.dispose();
    tid.dispose();
    requestSource.dispose();
    uploadDocs.dispose();
    remarks.dispose();
  }

  // Insert order response
  insertOrderResponse() async {
    if (customerName.text.isEmpty) {
      customSnarkbar("Error", "Customer name is Required", "error");
      return;
    } else if (customerAddress.text.isEmpty) {
      customSnarkbar("Error", "Address  Required", "error");
      return;
    } else if (contactPerson.text.isEmpty) {
      customSnarkbar("Error", "Contact Person is Required", "error");
      return;
    } else if (phoneNumber.text.isEmpty) {
      customSnarkbar("Error", "Contact is Required", "error");
      return;
    } else if (alternativeNumber.text.isEmpty) {
      customSnarkbar("Error", "Alternative Contact is Required", "error");
      return;
    } else if (billingEmail.text.isEmpty) {
      customSnarkbar("Error", "Billing Email is Required", "error");
      return;
    } else if (productType.text.isEmpty) {
      customSnarkbar("Error", "Product Type is Required", "error");
      return;
    } else if (customerType.text.isEmpty) {
      customSnarkbar("Error", "Customer Type is Required", "error");
      return;
    } else if (requestType.text.isEmpty) {
      customSnarkbar("Error", "Request Type is Required", "error");
      return;
    } else if (categoryOfService.text.isEmpty) {
      customSnarkbar("Error", "Category of Service is Required", "error");
      return;
    } else if (billingCountry.text.isEmpty) {
      customSnarkbar("Error", "Country is Required", "error");
      return;
    } else if (contractPrice.text.isEmpty) {
      customSnarkbar("Error", "Price is Required", "error");
      return;
    } else if (currency.text.isEmpty) {
      customSnarkbar("Error", "Currency is Required", "error");
      return;
    } else if (tid.text.isEmpty) {
      customSnarkbar("Error", "Transacion ID is Required", "error");
      return;
    } else if (requestSource.text.isEmpty) {
      customSnarkbar("Error", "Request Source is Required", "error");
      return;
    } else if (remarks.text.isEmpty) {
      customSnarkbar("Error", "Remarks are Required", "error");
      return;
    } else {
      //   Get.showOverlay(
      //       asyncFunction: () => insertOrder(), loadingWidget: const Loader()
      // );

      Get.showOverlay(
        asyncFunction: () async {
          //Check if the order already exists
          checkOrderAvailability(
            customerName.text,
            (existingRecords) {
              if (existingRecords.isNotEmpty) {
                // Show a modal with the existing records
                Get.dialog(
                  AlertDialog(
                    title: const Text("Similar Link"),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: existingRecords.map((record) {
                        return ListTile(
                          title: Text(
                            record.customerName ?? "",
                            style: const TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            record.submissionDate ?? "",
                            style: const TextStyle(
                                color: Colors.black, fontSize: 10),
                          ),
                        );
                      }).toList(),
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Get.back(); // Close the modal
                        },
                        child: const Text("Cancel"),
                      ),
                      TextButton(
                        onPressed: () async {
                          Get.back(); // Close the modal
                          await insertOrder(); // Proceed with insertion
                        },
                        child: const Text("Continue"),
                      ),
                    ],
                  ),
                );
              } else {
                // No existing records, proceed with insertion
                insertOrder();
              }
            },
            (error) {
              customSnarkbar("Error", error, "error");
            },
          );
        },
        loadingWidget: const Loader(),
      );
    }
  }

  // Insert order
  insertOrder() async {
    var usr = await SharedPrefs().getUser();
    DstProfile profile = DstProfile.fromJson(json.decode(usr));

    try {
      var response = await http.post(
        Uri.parse("${baseurl}action.orders.php"),
        body: {
          "customer_name": customerName.text,
          "customer_address": customerAddress.text,
          "contact_person": contactPerson.text,
          "contact": phoneNumber.text,
          "alternative_contact": alternativeNumber.text,
          "billing_email": billingEmail.text,
          "product_type": productType.text,
          "customer_type": customerType.text,
          "request_type": requestType.text,
          "service_category": categoryOfService.text,
          "billing_country": billingCountry.text,
          "contract_price": contractPrice.text,
          "product_name": productName.text,
          "currency": currency.text,
          "tid": tid.text,
          "request_source": requestSource.text,
          "remarks": remarks.text,
          "sof_doc": customerName.text,
          "kam_name": profile.dstName.toString(),
          "kam_email": profile.dstEmail.toString(),
          "auuid": profile.auuid.toString(),
          "post_order": "2",
        },
      );

      var res = jsonDecode(response.body);
      if (res["success"]) {
        customSnarkbar("Success", res["message"], "success");
        fetchOrders();
        Get.offAllNamed(GetRoutes.orders);
      } else {
        customSnarkbar("Oops", res["message"], "error");
      }
    } catch (e) {
      customSnarkbar("Error", "Something went wrong: $e", "error");
    }
  }

  // Fetch orders
  void fetchOrders() async {
    try {
      var usr = await SharedPrefs().getUser();
      DstProfile profile = DstProfile.fromJson(json.decode(usr));

      var response = await http.post(
        Uri.parse("${baseurl}action.orders.php"),
        body: {
          "dstauuid": profile.auuid,
          "ordersbyauuid": "2",
        },
      );

      var res = json.decode(response.body);

      if (res is List) {
        // Parse list of orders data
        orders.assignAll(res.map((data) => AllOrders.fromJson(data)).toList());
        filteredOrders.assignAll(orders);
        mySalesCount.value = orders.length;
      } else {
        customSnarkbar("Error", "No Orders Available", "error");
      }
    } catch (e) {
      customSnarkbar("Error", "Something went wrong", "error");
      // print("Error $e");
    }
  }

  // Placeholder for stepList
  stepList() {}
}

void checkOrderAvailability(String link, Function(List<AllOrders>) onSuccess,
    Function(String) onError) {
  http.post(
    Uri.parse("${baseurl}action.orders.php"),
    body: {
      "link": link,
      "check_order_availability": "1",
    },
  ).then((response) {
    var res = jsonDecode(response.body);

    if (res is List) {
      List<AllOrders> records =
          res.map((data) => AllOrders.fromJson(data)).toList();
      onSuccess(records);
    } else {
      onError("Invalid response format");
    }
  }).catchError((e) {
    onError("Failed to check availability: $e");
  });
}
