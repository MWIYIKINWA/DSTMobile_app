import 'package:dstmobileapp/controllers/resizingController.dart';
import 'package:dstmobileapp/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:dstmobileapp/controllers/resizing_controller.dart';
import 'package:dstmobileapp/widgets/searchbox.dart';

class ResizingPage extends StatelessWidget {
  const ResizingPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Get the ResizingController instance
    final ResizingController resizingController = Get.put(ResizingController());

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Get.toNamed(GetRoutes.home);
          },
        ),
        title: const Text("DSTMobile"),
        backgroundColor: Colors.red,
      ),
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          children: [
            // Search box
            SearchBox(
              onchanged: (val) {
                // You can add search functionality here later
              },
            ),
            const SizedBox(height: 10),

            // Display the list of Restile widgets
            Expanded(
              child: Obx(() {
                // Check if the resizing list is empty
                if (resizingController.resizing.isEmpty) {
                  return const Center(
                    child: Text("No data found."),
                  );
                }

                // Generate a list of Restile widgets dynamically
                return ListView.builder(
                  itemCount: resizingController.resizing.length,
                  itemBuilder: (context, index) {
                    var item = resizingController.resizing[index];
                    return Restile(
                      customer: item.resCustomer,
                      isp: item.resCurrentIsp,
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Get.toNamed('addresizing');
        },
        icon: const Icon(Icons.add),
        label: const Text("Add response"),
        backgroundColor: Colors.blue,
      ),
    );
  }
}

// Keep Restile as a separate widget inside the same file
class Restile extends StatelessWidget {
  final customer;
  final isp;

  const Restile({
    super.key,
    required this.customer,
    required this.isp,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 5.0),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 6,
            offset: const Offset(0, 4), // Shadow position
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Customer
          Text(
            "Customer: $customer",
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black54,
            ),
          ),
          const SizedBox(height: 5),

          // isp
          Text(
            "Current ISP: $isp",
            style: const TextStyle(
              fontSize: 14,
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }
}
