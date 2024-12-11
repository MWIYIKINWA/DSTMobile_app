import 'package:dstmobileapp/controllers/resizingController.dart';
import 'package:dstmobileapp/widgets/dstbuttons.dart';
import 'package:dstmobileapp/widgets/dsttextfields.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddResizing extends StatelessWidget {
  AddResizing({super.key});

  final resizingController =
      Get.find<ResizingController>(); // Retrieve existing controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("DSTMobile"),
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: GetBuilder<ResizingController>(
          builder: (controller) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    "Resizing Response",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(height: 16),

                  // Customer Name
                  MyTextBox(
                    hint: "Customer Name",
                    controller: controller.customerName,
                  ),
                  const SizedBox(height: 16),

                  // Current ISP Dropdown
                  DropdownButtonFormField<String>(
                    decoration: const InputDecoration(
                      labelText: "Current ISP",
                      border: OutlineInputBorder(),
                    ),
                    value: controller.currentISP.text.isNotEmpty
                        ? controller.currentISP.text
                        : null,
                    items: ["Airtel", "Mtn", "Zuku", "Safari"]
                        .map((isp) => DropdownMenuItem(
                              value: isp,
                              child: Text(isp),
                            ))
                        .toList(),
                    onChanged: (value) {
                      controller.currentISP.text = value ?? "";
                    },
                  ),
                  const SizedBox(height: 16),

                  // Current Service
                  MyTextBox(
                    hint: "Service",
                    controller: controller.currentService,
                  ),
                  const SizedBox(height: 16),

                  // Bandwidth Dropdown
                  DropdownButtonFormField<String>(
                    decoration: const InputDecoration(
                      labelText: "Bandwidth",
                      border: OutlineInputBorder(),
                    ),
                    value: controller.bandWidth.text.isNotEmpty
                        ? controller.bandWidth.text
                        : null,
                    items: [
                      "Upto 10Mbps",
                      "Upto 20Mbps",
                      "Upto 40Mbps",
                    ]
                        .map((bandwidth) => DropdownMenuItem(
                              value: bandwidth,
                              child: Text(bandwidth),
                            ))
                        .toList(),
                    onChanged: (value) {
                      controller.bandWidth.text = value ?? "";
                    },
                  ),
                  const SizedBox(height: 16),

                  // Current Charge
                  MyTextBox(
                    hint: "Current Charge",
                    controller: controller.currentCharge,
                  ),
                  const SizedBox(height: 16),

                  // Street
                  MyTextBox(
                    hint: "Street",
                    controller: controller.street,
                  ),
                  const SizedBox(height: 16),

                  // Location
                  MyTextBox(
                    hint: "Location",
                    controller: controller.location,
                  ),
                  const SizedBox(height: 24),

                  // Submit Button
                  MyButton(
                    label: "Respond",
                    onPressed: () {
                      controller.insertResizingResponse();
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
