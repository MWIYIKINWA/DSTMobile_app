import 'package:dstmobileapp/controllers/orderController.dart';
import 'package:dstmobileapp/models/dstorders.dart';
import 'package:dstmobileapp/routes.dart';
import 'package:dstmobileapp/widgets/searchbox.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Orders extends StatelessWidget {
  Orders({super.key});

  final OrderController orderController = Get.put(OrderController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            //Get.toNamed(GetRoutes.home);
          },
        ),
        title: const Text(
          "DSTMobile",
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            children: [
              SearchBox(onchanged: (val) {}),
              const SizedBox(height: 10),
              Expanded(
                child: Obx(
                  () {
                    if (orderController.orders.isEmpty) {
                      return const Center(
                        child: Text("No Orders available"),
                      );
                    }
                    return SingleChildScrollView(
                      child: Column(
                        children: orderController.orders
                            .map((order) => Ordertile(order: order))
                            .toList(),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Get.toNamed(GetRoutes.addorders);
        },
        icon: const Icon(Icons.add),
        label: const Text("Create New Order"),
        backgroundColor: Colors.red,
        foregroundColor: Colors.white,
      ),
    );
  }
}

//order tile

class Ordertile extends StatelessWidget {
  final AllOrders order;

  const Ordertile({super.key, required this.order});

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
          // Title
          Text(
            '${order.customerName}',
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          // Customer
          Text(
            '${order.contact}',
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 5),
          // Other fields
          Text(
            'UG-HMSL-${order.sofNo}',
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          // Customer
          const Text(
            'Status: Pending Corporate',
            style: TextStyle(fontSize: 16, color: Colors.blue),
          ),
        ],
      ),
    );
  }
}
