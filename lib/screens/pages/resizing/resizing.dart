import 'package:dstmobileapp/controllers/resizingController.dart';
import 'package:dstmobileapp/models/dstresizing.dart';
import 'package:dstmobileapp/screens/pages/resizing/resizing_details.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dstmobileapp/widgets/searchbox.dart';

class ResizingPage extends StatelessWidget {
  const ResizingPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ResizingController resizingController = Get.put(ResizingController());

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white), // Back icon
          onPressed: () {
            // Get.offNamed(GetRoutes.home);
            Get.back();
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
                resizingController.filterResizing(val);
              },
            ),
            const SizedBox(height: 10),

            Obx(() {
              return Text("Count: ${resizingController.resizingCount}");
            }),

            const SizedBox(
              height: 10,
            ),
            // Display the list of Restile widgets
            Expanded(
              child: Obx(() {
                if (resizingController.filteredResizing.isEmpty) {
                  return const Center(
                    child: Text("No data found."),
                  );
                }

                return ListView.builder(
                  itemCount: resizingController.filteredResizing.length,
                  itemBuilder: (context, index) {
                    var item = resizingController.filteredResizing[index];
                    return Restile(
                      resizingItem: item,
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

class Restile extends StatelessWidget {
  final Resizing resizingItem;

  const Restile({
    super.key,
    required this.resizingItem,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navigate to the detail screen with the selected resizing item
        Get.to(() => ResizingDetailScreen(resizingItem: resizingItem));
      },
      child: Container(
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
              "Customer: ${resizingItem.resCustomer}",
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 5),

            // ISP
            Text(
              "Current ISP: ${resizingItem.resCurrentIsp}",
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
