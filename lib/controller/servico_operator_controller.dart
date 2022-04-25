import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/order_assistance.dart';
import '../services/order_assistance_service.dart';

class ServicoOperatorController extends GetxController with StateMixin<List<OrderAssistance>> {

  String _operatorId = "";
  late OrderAssistanceServiceInterface _orderAssistanceServiceInterface;
  List<OrderAssistance> assistsByOperator = [];

  @override
  void onInit() {
    super.onInit();
    _orderAssistanceServiceInterface = Get.find<OrderAssistanceServiceInterface>();
    _operatorId = Get.arguments;
    getAssistancesByOperatorId(int.parse(_operatorId));
    change(null, status: RxStatus.success());
  }

  void getAssistancesByOperatorId(int operatorId) {
    _orderAssistanceServiceInterface
      .getAssistsByOperatorId(operatorId)
      .then((value) {
        assistsByOperator = value;
      })
      .onError((error, stackTrace) {
        Get.snackbar("Error", error.toString(), backgroundColor: Colors.redAccent);
      });
  }

}