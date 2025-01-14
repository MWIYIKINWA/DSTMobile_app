import 'package:dstmobileapp/models/dstorders.dart';
import 'package:dstmobileapp/widgets/buildDetailRow.dart';
import 'package:flutter/material.dart';

class OrderDetailScreen extends StatelessWidget {
  final AllOrders order;

  const OrderDetailScreen({super.key, required this.order});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Order Details",
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
                    value: order.customerName ?? "N/A",
                  ),
                  const Divider(height: 20, thickness: 1),

                  // ISP Section
                  DetailRow(
                    icon: Icons.location_city,
                    label: "Location",
                    value: order.customerAddress ?? "N/A",
                  ),
                  const Divider(height: 20, thickness: 1),

                  // Service Section
                  const DetailRow(
                    icon: Icons.alarm,
                    label: "Status",
                    value: "Pending Enterprise",
                  ),
                  const Divider(height: 20, thickness: 1),

                  // Bandwidth Section
                  DetailRow(
                    icon: Icons.phone,
                    label: "Contact",
                    value: order.contact ?? "N/A",
                  ),
                  const Divider(height: 20, thickness: 1),

                  // Amount Section
                  DetailRow(
                    icon: Icons.wifi,
                    label: "Product",
                    value: order.productName ?? "N/A",
                  ),
                  const Divider(height: 20, thickness: 1),

                  // Location Section
                  DetailRow(
                    icon: Icons.money,
                    label: "Amount",
                    value: order.contractPrice.toString(),
                  ),
                  const Divider(height: 20, thickness: 1),

                  // Street Section
                  DetailRow(
                    icon: Icons.code,
                    label: "MOCN",
                    value: order.sofNo.toString(),
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
