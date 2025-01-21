import 'package:dstmobileapp/controllers/orderController.dart';
import 'package:dstmobileapp/widgets/dstbuttons.dart';
//import 'package:dstmobileapp/widgets/dstdropdown.dart';
import 'package:dstmobileapp/widgets/dsttextfields.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddOrder extends StatefulWidget {
  const AddOrder({super.key});

  @override
  State<AddOrder> createState() => _AddOrderState();
}

class _AddOrderState extends State<AddOrder> {
  int _activeStepIndex = 0;

  List<Step> stepList(OrderController controller) => [
        Step(
          isActive: _activeStepIndex >= 0,
          title: const Text("Customer Profile"),
          content: GetBuilder<OrderController>(
            builder: (controller) {
              return Column(
                children: [
                  MyTextBox(
                    controller: controller.customerName,
                    hint: "Customer Name",
                  ),
                  const SizedBox(height: 8),
                  MyTextBox(
                    controller: controller.customerAddress,
                    hint: "Customer Address",
                  ),
                  const SizedBox(height: 8),
                  MyTextBox(
                    controller: controller.contactPerson,
                    hint: "Contact Person",
                  ),
                  const SizedBox(height: 8),
                  MyTextBox(
                    controller: controller.phoneNumber,
                    hint: "Phone Number",
                  ),
                  const SizedBox(height: 8),
                  MyTextBox(
                    controller: controller.alternativeNumber,
                    hint: "Alternative Number",
                  ),
                  const SizedBox(height: 8),
                  MyTextBox(
                    controller: controller.billingEmail,
                    hint: "Billing Email",
                  ),
                ],
              );
            },
          ),
        ),
        Step(
          isActive: _activeStepIndex >= 0,
          title: const Text("Product Details"),
          content: GetBuilder<OrderController>(
            builder: (controller) {
              return Column(
                children: [
                  const SizedBox(
                    height: 7,
                  ),
                  DropdownButtonFormField<String>(
                    isExpanded: true,
                    decoration: const InputDecoration(
                      labelText: "Product Type",
                      border: OutlineInputBorder(),
                    ),
                    value: controller.productType.text.isNotEmpty
                        ? controller.productType.text
                        : null,
                    items: [
                      "GSM",
                      "Fixed Data",
                      "VAS",
                    ]
                        .map((ptype) => DropdownMenuItem(
                              value: ptype,
                              child: Text(ptype),
                            ))
                        .toList(),
                    onChanged: (value) {
                      controller.productType.text = value ?? "";
                    },
                  ),
                  const SizedBox(height: 8),
                  DropdownButtonFormField<String>(
                    decoration: const InputDecoration(
                      labelText: "Customer Type",
                      border: OutlineInputBorder(),
                    ),
                    value: controller.customerType.text.isNotEmpty
                        ? controller.customerType.text
                        : null,
                    items: [
                      "SME and Individual",
                      "Corporate",
                      "Wholesale",
                    ]
                        .map((ctype) => DropdownMenuItem(
                              value: ctype,
                              child: Text(ctype),
                            ))
                        .toList(),
                    onChanged: (value) {
                      controller.customerType.text = value ?? "";
                    },
                  ),
                  const SizedBox(height: 8),
                  DropdownButtonFormField<String>(
                    isExpanded: true,
                    decoration: const InputDecoration(
                      labelText: "Request Type",
                      border: OutlineInputBorder(),
                    ),
                    value: controller.requestType.text.isNotEmpty
                        ? controller.requestType.text
                        : null,
                    items: [
                      "New",
                      "Upgrade",
                      "Downgrade",
                      "Proof of Concept",
                      "Test",
                    ]
                        .map((rtype) => DropdownMenuItem(
                              value: rtype,
                              child: Text(rtype),
                            ))
                        .toList(),
                    onChanged: (value) {
                      controller.requestType.text = value ?? "";
                    },
                  ),
                  const SizedBox(height: 8),
                  DropdownButtonFormField<String>(
                    isExpanded: true,
                    decoration: const InputDecoration(
                      labelText: "Category of Service",
                      border: OutlineInputBorder(),
                    ),
                    value: controller.categoryOfService.text.isNotEmpty
                        ? controller.categoryOfService.text
                        : null,
                    items: [
                      "Dedicated",
                      "Shared",
                    ]
                        .map((stype) => DropdownMenuItem(
                              value: stype,
                              child: Text(stype),
                            ))
                        .toList(),
                    onChanged: (value) {
                      controller.categoryOfService.text = value ?? "";
                    },
                  ),
                  const SizedBox(height: 8),
                  DropdownButtonFormField<String>(
                    isExpanded: true,
                    decoration: const InputDecoration(
                      labelText: "Product Name",
                      border: OutlineInputBorder(),
                    ),
                    value: controller.productName.text.isNotEmpty
                        ? controller.productName.text
                        : null,
                    items: [
                      "Home Internet(Up to 10Mbps)",
                      "Home Internet(Up to 20Mbps)",
                      "Home Internet(Up to 40Mbps)",
                      "Home Internet(Up to 60Mbps)",
                      "Office Internet(Up to 20Mbps)",
                      "Office Internet(Up to 30Mbps)",
                      "Office Internet(Up to 40Mbps)",
                      "Internet",
                    ]
                        .map((pname) => DropdownMenuItem(
                              value: pname,
                              child: Text(pname),
                            ))
                        .toList(),
                    onChanged: (value) {
                      controller.productName.text = value ?? "";
                    },
                  ),
                  const SizedBox(height: 8),
                  MyTextBox(
                    controller: controller.billingCountry,
                    hint: "Billing Country",
                  ),
                  const SizedBox(height: 8),
                  MyTextBox(
                    controller: controller.contractPrice,
                    hint: "Contract Price",
                  ),
                  const SizedBox(height: 8),
                  DropdownButtonFormField<String>(
                    decoration: const InputDecoration(
                      labelText: "Currency",
                      border: OutlineInputBorder(),
                    ),
                    value: controller.currency.text.isNotEmpty
                        ? controller.currency.text
                        : null,
                    items: [
                      "Shillings(UGX)",
                      "Dollar(USD)",
                    ]
                        .map((c) => DropdownMenuItem(
                              value: c,
                              child: Text(c),
                            ))
                        .toList(),
                    onChanged: (value) {
                      controller.currency.text = value ?? "";
                    },
                  ),
                ],
              );
            },
          ),
        ),
        Step(
          isActive: _activeStepIndex >= 0,
          title: const Text("Other Details"),
          content: GetBuilder<OrderController>(
            builder: (controller) {
              return Column(
                children: [
                  MyTextBox(
                    controller: controller.tid,
                    hint: "Transaction ID",
                  ),
                  const SizedBox(height: 8),
                  DropdownButtonFormField<String>(
                    decoration: const InputDecoration(
                      labelText: "Request Source",
                      border: OutlineInputBorder(),
                    ),
                    value: controller.requestSource.text.isNotEmpty
                        ? controller.requestSource.text
                        : null,
                    items: [
                      "EBB",
                      "HBB",
                      "Retail",
                      "EBB FP",
                    ]
                        .map((c) => DropdownMenuItem(
                              value: c,
                              child: Text(c),
                            ))
                        .toList(),
                    onChanged: (value) {
                      controller.requestSource.text = value ?? "";
                    },
                  ),
                  const SizedBox(height: 8),
                  MyTextBox(
                    controller: controller.remarks,
                    hint: "Remarks",
                    icon: Icons.message,
                  ),
                  const SizedBox(height: 8),
                  MyTextBox(
                    controller: controller.uploadDocs,
                    hint: "Upload Docs",
                    icon: Icons.upload_file,
                  ),
                  const SizedBox(height: 8),
                  MyButton(
                    label: "Submit",
                    onPressed: controller.insertOrderResponse,
                  ),
                ],
              );
            },
          ),
        ),
      ];

  @override
  Widget build(BuildContext context) {
    final orderController = Get.put(OrderController());

    return Scaffold(
      appBar: AppBar(
        title: const Text("DSTMobile"),
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Create New Order",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: Stepper(
                type: StepperType.vertical,
                currentStep: _activeStepIndex,
                steps: stepList(orderController),
                onStepContinue: () {
                  if (_activeStepIndex < stepList(orderController).length - 1) {
                    setState(() {
                      _activeStepIndex++;
                    });
                  }
                },
                onStepCancel: () {
                  if (_activeStepIndex > 0) {
                    setState(() {
                      _activeStepIndex--;
                    });
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
