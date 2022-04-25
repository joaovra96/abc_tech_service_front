import 'package:abc_tech_service_front/controller/assistance_controller.dart';
import 'package:get/get.dart';

class HomeBind extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AssistanceController>(() => AssistanceController());
  }
}