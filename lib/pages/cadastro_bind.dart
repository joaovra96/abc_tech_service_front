
import 'package:abc_tech_service_front/controller/cadastro_controller.dart';
import 'package:abc_tech_service_front/provider/cadastro_provider.dart';
import 'package:abc_tech_service_front/services/cadastro_service.dart';
import 'package:get/get.dart';

class CadastroBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CadastroController>(() => CadastroController(CadastroService(CadastroProvider())));
  }

}