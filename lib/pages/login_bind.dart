import 'package:abc_tech_service_front/controller/login_controller.dart';
import 'package:abc_tech_service_front/provider/login_provider.dart';
import 'package:abc_tech_service_front/services/login_service.dart';
import 'package:get/get.dart';

class LoginBind extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController(LoginService(LoginProvider())));
  }
  
}