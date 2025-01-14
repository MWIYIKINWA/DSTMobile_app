import 'package:dstmobileapp/widgets/buildDetailRow.dart';
import 'package:flutter/material.dart';
import 'package:dstmobileapp/models/dstresizing.dart';

class ResizingDetailScreen extends StatelessWidget {
  final Resizing resizingItem;

  const ResizingDetailScreen({super.key, required this.resizingItem});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Resizing Details",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.red, Colors.orange],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.white, Color(0xFFFCE4EC)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Customer Section
                  DetailRow(
                    icon: Icons.person,
                    label: "Customer",
                    value: resizingItem.resCustomer ?? "N/A",
                  ),
                  const Divider(height: 20, thickness: 1),

                  // ISP Section
                  DetailRow(
                    icon: Icons.network_wifi,
                    label: "Current ISP",
                    value: resizingItem.resCurrentIsp ?? "N/A",
                  ),
                  const Divider(height: 20, thickness: 1),

                  // Service Section
                  DetailRow(
                    icon: Icons.design_services,
                    label: "Current Service",
                    value: resizingItem.resCurrentService ?? "N/A",
                  ),
                  const Divider(height: 20, thickness: 1),

                  // Bandwidth Section
                  DetailRow(
                    icon: Icons.speed,
                    label: "Bandwidth",
                    value: resizingItem.resCurrentBw ?? "N/A",
                  ),
                  const Divider(height: 20, thickness: 1),

                  // Amount Section
                  DetailRow(
                    icon: Icons.attach_money,
                    label: "Amount",
                    value: resizingItem.resAmount ?? "N/A",
                  ),
                  const Divider(height: 20, thickness: 1),

                  // Location Section
                  DetailRow(
                    icon: Icons.location_on,
                    label: "Location",
                    value: resizingItem.resLocation ?? "N/A",
                  ),
                  const Divider(height: 20, thickness: 1),

                  // Street Section
                  DetailRow(
                    icon: Icons.place,
                    label: "Street",
                    value: resizingItem.resStreet ?? "N/A",
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
