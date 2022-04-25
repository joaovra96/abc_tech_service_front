
import 'package:abc_tech_service_front/model/user.dart';
import 'package:get/get.dart';

class PerfilController extends GetxController with StateMixin<User> {

  String operatorId = "";

  @override
  void onInit() {
    super.onInit();
    operatorId = Get.arguments;
    change(null, status: RxStatus.success());
  }

  goToOrder() {
    Get.toNamed("/order", arguments: operatorId);
  }

  goToServicesByOperator() {
    Get.toNamed("/services_operator", arguments: operatorId);
  }

  logout() {
    operatorId = "";
    Get.toNamed("/");
  }

}