import 'package:abc_tech_service_front/controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class LoginPage extends GetView<LoginController> {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(title: const Text('Tela de login')),
      body: Container(
        constraints: const BoxConstraints.expand(),
        padding: const EdgeInsets.all(10.0),
        child: Form(
          key: controller.formLoginKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                controller: controller.operatorIdController,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: const InputDecoration(
                  labelText: "Código do prestador",
                  border: OutlineInputBorder(),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8.0),
              Obx((() {
                return TextFormField(
                  controller: controller.senhaController,
                  decoration: const InputDecoration(
                    labelText: "Senha",
                    border: OutlineInputBorder(),
                  ),
                  textAlign: TextAlign.center,
                  obscureText: controller.obscureText.value,
                );
              })),
              Ink(
                child: TextButton(
                  onPressed: () => controller.setVisibilityPassword(), 
                  child: Obx((() {
                    return Text(controller.obscureText.value ? "Show password" : "Hide password");
                  }))
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 40.0),
                child: Row(children: [
                  Expanded(child: ElevatedButton(
                    onPressed: () {
                      FocusScope.of(context).unfocus();
                      controller.login();
                    },
                    child: const Text("Entrar", style: TextStyle(fontSize: 18.0)),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.all(16.0),
                    ),
                  ))
                ])
              )
            ]
          ),
    )));
  }
}
