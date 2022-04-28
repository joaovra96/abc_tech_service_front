import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/order_assistance.dart';
import '../services/order_assistance_service.dart';

class ServicoOperatorController extends GetxController with StateMixin<List<OrderAssistance>> {
  late OrderAssistanceServiceInterface _orderAssistanceServiceInterface;
  List<OrderAssistance> assistsByOperator = [];
  String _operatorId = "";

  @override
  void onInit() {
    super.onInit();
    _orderAssistanceServiceInterface = Get.find<OrderAssistanceServiceInterface>();
    _jwtDecode();
    change(null, status: RxStatus.success());
  }

    _jwtDecode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token')!;

    Map<String, dynamic> decodedToken = JwtDecoder.decode(token);

    _operatorId = decodedToken["sub"];

    bool isTokenExpired = JwtDecoder.isExpired(token);

    if (isTokenExpired) {
      prefs.clear();
      Get.toNamed("/");
      return;
    }

    getAssistancesByOperatorId();
  }

  void getAssistancesByOperatorId() {
    change([], status: RxStatus.loading());
    _orderAssistanceServiceInterface
      .getAssistsByOperatorId(_operatorId)
      .then((value) {
        assistsByOperator = value;
        change(value, status: RxStatus.success());
      })
      .onError((error, stackTrace) {
        Get.snackbar("Error", error.toString(), backgroundColor: Colors.redAccent);
        change([], status: RxStatus.error(error.toString()));
      });
  }

}