
import 'package:abc_tech_service_front/controller/perfil_controller.dart';
import 'package:get/get.dart';

class PerfilBind extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PerfilController>(() => PerfilController());
  }

}