import 'package:get/get.dart';
import 'package:dstmobileapp/controllers/logincontroller.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
  }
}
