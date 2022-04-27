import 'package:abc_tech_service_front/model/user.dart';
import 'package:get/get.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PerfilController extends GetxController with StateMixin<User> {

  final operatorId = "".obs;
  final operator = "".obs;

  @override
  void onInit() {
    super.onInit();
    operator.value = Get.arguments;
    _jwtDecode();
    change(null, status: RxStatus.success());
  }

  _jwtDecode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token')!;

    Map<String, dynamic> decodedToken = JwtDecoder.decode(token);

    operatorId.value = decodedToken["sub"];

    bool isTokenExpired = JwtDecoder.isExpired(token);

    if (isTokenExpired) {
      prefs.clear();
      logout();
    }
  }

  goToOrder() {
    Get.toNamed("/order");
  }

  goToServicesByOperator() {
    Get.toNamed("/services_operator");
  }

  logout() {
    Get.toNamed("/");
  }

}