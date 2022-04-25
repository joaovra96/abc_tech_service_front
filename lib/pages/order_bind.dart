
import 'package:abc_tech_service_front/controller/order_controller.dart';
import 'package:abc_tech_service_front/provider/order_provider.dart';
import 'package:abc_tech_service_front/services/geolocation_service.dart';
import 'package:abc_tech_service_front/services/order_service.dart';
import 'package:get/get.dart';

class OrderBind extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OrderController>(() => 
      OrderController(GeolocationService(), OrderService(OrderProvider())));
  }

}