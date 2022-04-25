import 'dart:async';

import 'package:abc_tech_service_front/model/user_logged.dart';
import 'package:abc_tech_service_front/services/login_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/user_login.dart';

class LoginController extends GetxController with StateMixin<UserLogged> {
  final formLoginKey = GlobalKey<FormState>();
  final operatorIdController = TextEditingController();
  final senhaController = TextEditingController();
  final LoginServiceInterface _loginService;
  final obscureText = true.obs;

  LoginController(this._loginService);

  @override
  void onInit() {
    super.onInit();
    _isLogged();
    operatorIdController.text = Get.arguments ?? '';
    change(null, status: RxStatus.success());
  }

  login() {

    if (operatorIdController.text == "" || senhaController.text == "") {
      return;
    }

    UserLogin user = UserLogin(registration: operatorIdController.text, password: senhaController.text);
    var operatorIdValue = operatorIdController.text;

    _loginService.login(user)
      .then((value) {
        Get.snackbar(
          "Sucesso", 
          "Login realizado com sucesso", 
          backgroundColor: Colors.greenAccent, 
          duration: const Duration(milliseconds: 1300)
        );

        clearForm();

        Timer(const Duration(milliseconds: 1000), () => Get.toNamed("/perfil", arguments: operatorIdValue));
      })
      .catchError((error) {
        Get.snackbar("Error", error.toString(), backgroundColor: Colors.redAccent);
      });
  }

  _isLogged() {

  }

  void addNewUser() {
    Get.toNamed("/new");
  }

  setVisibilityPassword() {
    obscureText.value = !obscureText.value;
  }

  clearForm() {
    operatorIdController.text = "";
    senhaController.text = "";
  }

}