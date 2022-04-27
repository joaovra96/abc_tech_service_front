import 'package:abc_tech_service_front/provider/order_assistance_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../model/order_assistance.dart';

abstract class OrderAssistanceServiceInterface {
  Future<List<OrderAssistance>> getAssistsByOperatorId(String operatorId);
  Future<OrderAssistanceServiceInterface> init(OrderAssistanceProviderInterface provider);
}

class OrderAssistanceService extends GetxService implements OrderAssistanceServiceInterface {

  late OrderAssistanceProviderInterface _orderAssistanceProviderInterface;

  @override
  Future<List<OrderAssistance>> getAssistsByOperatorId(String operatorId) async {
   Response response = await _orderAssistanceProviderInterface.getAssistsByOperatorId(operatorId);

   if (response.hasError) {
     return Future.error(ErrorDescription("Erro na conexão"));
   }

   try {
     List<OrderAssistance> listResult = response.body.map<OrderAssistance>((item) => OrderAssistance.fromMap(item)).toList();

     return Future.sync(() => listResult);
   } catch (e) {
     e.printInfo();
     return Future.error(ErrorDescription("Erro não esperado"));
   }

  }

  @override
  Future<OrderAssistanceServiceInterface> init(OrderAssistanceProviderInterface provider) async {
    _orderAssistanceProviderInterface = provider;
    return this;
  }

}