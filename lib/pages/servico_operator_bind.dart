
import 'package:abc_tech_service_front/controller/servico_operator_controller.dart';
import 'package:get/get.dart';

class ServicoOperatorBind extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ServicoOperatorController>(() => ServicoOperatorController());
  }

}