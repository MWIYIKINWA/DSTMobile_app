import 'package:dstmobileapp/controllers/logincontroller.dart';
import 'package:dstmobileapp/routes.dart';
import 'package:dstmobileapp/widgets/dstcard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:dstmobileapp/controllers/login_controller.dart'; // Import your LoginController

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginController loginController = Get.find<LoginController>();

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: AppBar(
          backgroundColor: Colors.red,
          elevation: 0,
          title: const Text(
            "DSTMobile",
            style: TextStyle(
              fontFamily: "Poppins",
              fontSize: 15,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Header
          Container(
            height: 170,
            color: Colors.blue,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Obx(() {
                  return Text(
                    "Hello, ${loginController.dstname.value}", // Display dynamic dstname
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30.0,
                      color: Colors.white,
                    ),
                  );
                }),
              ],
            ),
          ),

          // Cards
          Container(
            height: 150,
            color: Colors.white,
            child: InkWell(
              onTap: () {
                Get.toNamed(GetRoutes.orders);
              },
              child: const MyCard(
                addtext: "My Orders",
                cardicon: Icons.person,
              ),
            ),
          ),

          Container(
            height: 150,
            color: Colors.white,
            child: InkWell(
              onTap: () {
                Get.toNamed(GetRoutes.resizing);
              },
              child: const MyCard(
                addtext: "Resizing",
                cardicon: Icons.house_siding,
              ),
            ),
          ),

          // Footer
          Container(
            height: 60,
            color: Colors.white,
            child: const Image(
              image: AssetImage('assets/images/logo_transparent.png'),
              height: 20,
              fit: BoxFit.fill,
            ),
          ),
        ],
      ),
    );
  }
}
