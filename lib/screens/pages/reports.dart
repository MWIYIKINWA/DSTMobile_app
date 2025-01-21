// import 'package:flutter/material.dart';

// class Reports extends StatelessWidget {
//   const Reports({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.red,
//         title: const Text("Summeries", style: TextStyle(color: Colors.white)),
//       ),
//     );
//   }
// }

import 'package:dstmobileapp/controllers/orderController.dart';
import 'package:dstmobileapp/controllers/resizingController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart'; // For reactive updates (if needed)

class Reports extends StatelessWidget {
  const Reports({super.key});

  @override
  Widget build(BuildContext context) {
    final ResizingController resizingController = Get.put(ResizingController());
    final OrderController orderController = Get.put(OrderController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text(
          "Summaries",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 30, right: 10, left: 10),
        child: Column(
          children: [
            // Current Month Sales Card
            _buildMetricCard(
              icon: Icons.person,
              title: "Current Month Sales",
              value: orderController.mySalesCount.toString(),
              color: Colors.blue,
            ),
            const SizedBox(height: 16), // Spacing between cards

            // Total Sales Card
            _buildMetricCard(
              icon: Icons.person_2_outlined,
              title: "Total Sales",
              value: orderController.mySalesCount.toString(),
              color: Colors.green,
            ),
            const SizedBox(height: 16),

            // Resizing Counts Card
            _buildMetricCard(
              icon: Icons.house_siding,
              title: "Resizing Counts",
              value: resizingController.resizingCount.toString(),
              color: Colors.red,
            ),
          ],
        ),
      ),
    );
  }

  // Helper method to build a metric card
  Widget _buildMetricCard({
    required IconData icon,
    required String title,
    required String value,
    required Color color,
  }) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            // Icon
            Icon(
              icon,
              size: 40,
              color: color,
            ),
            const SizedBox(width: 16), // Spacing between icon and text

            // Title and Value
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(height: 4), // Spacing between title and value
                Text(
                  value,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: color,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
