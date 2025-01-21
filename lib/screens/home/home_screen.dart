import 'package:dstmobileapp/controllers/logincontroller.dart';
import 'package:dstmobileapp/routes.dart';
import 'package:dstmobileapp/widgets/dstcard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginController loginController = Get.find<LoginController>();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.red,
        elevation: 0,
        title: const Text(
          "DSTMobile",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.white), // Logout icon
            onPressed: () {
              Get.dialog(
                AlertDialog(
                  title: const Text(
                    "Logout",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.blue),
                  ),
                  content: const Text("Are you sure you want to logout?"),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Get.back(); // Close the dialog
                      },
                      child: const Text("Cancel"),
                    ),
                    TextButton(
                      onPressed: () {
                        Get.back(); // Close the dialog
                        loginController.logout(); // Call the logout method
                      },
                      child: const Text("Logout"),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Header Container
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16.0),
              color: Colors.red, // Red background for the header
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Divider(
                    color: Colors.white,
                    height: 20,
                    thickness: 2,
                  ),
                  const Text(
                    "Dashboard",
                    style: TextStyle(
                      fontFamily: "Poppins",
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Obx(() {
                    return Text(
                      "Hello, ${loginController.dstname.value}",
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    );
                  }),
                  const SizedBox(height: 8),
                  const Divider(
                    color: Colors.white,
                    height: 20,
                    thickness: 2,
                  )
                ],
              ),
            ),

            const SizedBox(
              height: 30,
            ),
            // Cards Grid
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 16.0,
                mainAxisSpacing: 16.0,
                children: [
                  // Orders Card
                  InkWell(
                    onTap: () {
                      Get.toNamed(GetRoutes.orders);
                    },
                    child: const MyCard(
                      cardicon: Icons.person_2,
                      addtext: "Orders",
                    ),
                  ),
                  // Resizing Card
                  InkWell(
                    onTap: () {
                      Get.toNamed(GetRoutes.resizing);
                    },
                    child: const MyCard(
                      cardicon: Icons.house_siding,
                      addtext: "Resizing",
                    ),
                  ),
                  // Reports Card
                  InkWell(
                    onTap: () {
                      Get.toNamed(GetRoutes.reportspage);
                    },
                    child: const MyCard(
                      cardicon: Icons.bar_chart,
                      addtext: "Reports",
                    ),
                  ),
                  // Profile Card
                  InkWell(
                    onTap: () {
                      Get.toNamed(GetRoutes.profilepage);
                    },
                    child: const MyCard(
                      cardicon: Icons.person,
                      addtext: "Profile",
                    ),
                  ),
                ],
              ),
            ),

            const Image(
              image: AssetImage('assets/images/logo2.jpg'),
              height: 40.0,
              fit: BoxFit.fill,
            ),
          ],
        ),
      ),
    );
  }
}
