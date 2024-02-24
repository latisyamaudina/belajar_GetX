import 'package:get/get.dart';

import '../controllers/employe_controller.dart';

class EmployeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EmployeController>(
      () => EmployeController(),
    );
  }
}
