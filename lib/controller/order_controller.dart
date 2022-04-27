import 'package:abc_tech_service_front/model/assistance.dart';
import 'package:abc_tech_service_front/model/order_location.dart';
import 'package:abc_tech_service_front/services/geolocation_service.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/order.dart';
import '../model/order_created.dart';
import '../services/order_service.dart';

enum OrderState { creating, started, finished }

class OrderController extends GetxController with StateMixin<OrderCreated> {
  final GeolocationServiceInterface _geolocationService;
  final OrderServiceInterface _orderService;
  final selectedAssistances = <Assistance>[].obs;
  final formOrderKey = GlobalKey<FormState>();
  final operatorIdController = TextEditingController();
  final screenState = OrderState.creating.obs;
  late Order _order;

  OrderController(this._geolocationService, this._orderService);

  @override
  void onInit() {
    super.onInit();
    _geolocationService.start();
    _jwtDecode();
    change(null, status: RxStatus.success());
  }

  _jwtDecode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token')!;

    Map<String, dynamic> decodedToken = JwtDecoder.decode(token);

    operatorIdController.text = decodedToken["sub"];

    bool isTokenExpired = JwtDecoder.isExpired(token);

    if (isTokenExpired) {
      prefs.clear();
      Get.toNamed("/");
    }
  }

  Future<Position> _getLocation() async {
    Position position = await _geolocationService.getPosition();
    return Future.sync(() => position);
  }

  OrderLocation orderLocationFromPosition(Position position) {
    return OrderLocation(
      latitude: position.latitude, 
      longitude: position.longitude, 
      dateTime: DateTime.now()
    );
  }

  List<int> getServicesIds() {
    return selectedAssistances.map((e) => e.id).toList();
  }

  edit() {
    screenState.value = OrderState.creating;
    change(null, status: RxStatus.success());
  }

  finishStartOrder() {
    switch (screenState.value) {
      case OrderState.creating:
        if (selectedAssistances.isEmpty || selectedAssistances.length > 15) {
          var message = selectedAssistances.isEmpty ? 
            "Por favor, precisa ter ao menos um serviço" : 
            "Não é possível inserir mais de 15 serviços";
          Get.snackbar("Error", message, backgroundColor: Colors.redAccent);
          return;
        }
        change(null, status: RxStatus.loading());
        _getLocation().then((value) {
          _order = Order(
            operatorId: int.parse(operatorIdController.text), 
            services: getServicesIds(), 
            start: orderLocationFromPosition(value), 
            end: null
          );
          screenState.value = OrderState.started;
          change(null, status: RxStatus.success());
        });
        break;
      case OrderState.started: 
        change(null, status: RxStatus.loading());
        _getLocation().then((value) {
          _order.end = orderLocationFromPosition(value);
          _createOrder();
        });
        break;
      default:
    }
  }

  _createOrder() {
    screenState.value = OrderState.finished;
    _orderService.createOrder(_order).then((value) {
      if (value.success) {
        Get.snackbar("Sucesso", "Ordem de serviço criada com sucesso", 
          backgroundColor: Colors.greenAccent);
      }
      clearForm();
    }).catchError((error) {
      Get.snackbar("Error", error.toString(), backgroundColor: Colors.redAccent);
      clearForm();
    });
  }

  editServices() {
    if (screenState.value != OrderState.creating) {
      return null;
    }

    Get.toNamed("/services", arguments: selectedAssistances);
  }

  void clearForm() {
    screenState.value = OrderState.creating;
    selectedAssistances.clear();
    change(null, status: RxStatus.success());
  }

}