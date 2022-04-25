import 'dart:async';

import 'package:abc_tech_service_front/model/new_user.dart';
import 'package:abc_tech_service_front/model/user.dart';
import 'package:abc_tech_service_front/services/cadastro_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CadastroController extends GetxController with StateMixin<NewUser> {
  final formCadastroKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  final senhaController = TextEditingController();
  final obscureText = true.obs;
  final CadastroServiceInterface _cadastroService;

  CadastroController(this._cadastroService);

  @override
  void onInit() {
    super.onInit();
    change(null, status: RxStatus.success());
  }

  addUser() {
    User user = User(name: nameController.text, password: senhaController.text);

    _cadastroService.addUser(user)
      .then((value) {
        Get.snackbar(
          "Sucesso", 
          "Cadastro realizado com sucesso", 
          backgroundColor: Colors.greenAccent, 
          duration: const Duration(milliseconds: 1300)
        );

        clearForm();

        Timer(const Duration(milliseconds: 1000), () => Get.toNamed("/login", arguments: value.registration));
      })
      .catchError((error) {
        Get.snackbar("Error", error.toString(), backgroundColor: Colors.redAccent);
      });
  }

  setVisiblePassword() {
    obscureText.value = !obscureText.value;
  }

  clearForm() {
    nameController.text = "";
    senhaController.text = "";
  }
}