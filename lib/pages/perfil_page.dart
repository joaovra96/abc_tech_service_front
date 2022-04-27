import 'package:abc_tech_service_front/controller/perfil_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PerfilPage extends GetView<PerfilController> {
  const PerfilPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tela inicial do usuário")),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            color: const Color.fromARGB(255, 239, 239, 239),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ListTile(
                  title: Obx(() => Text("Nome: ${controller.operator}")),
                  subtitle: Obx(() => Text("Operador ID: ${controller.operatorId}")),
                ),
              ],
            )
          ),
        ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: Obx(() => Text('${controller.operator}')),
              accountEmail: null,
              currentAccountPicture: ClipRRect(
                borderRadius: BorderRadius.circular(110),
                child: Image.asset("assets/img/profile.png", fit: BoxFit.cover),
              ),
            ),
            ListTile(
              title: const Text("Order"),
              onTap: () => controller.goToOrder(),
            ),
            ListTile(
              title: const Text("Serviços do operador"),
              onTap: () => controller.goToServicesByOperator(),
            ),
            ListTile(
              title: const Text("Sair"),
              onTap: () => controller.logout(),
            ),
          ],
        ),
      ),
    );
  }

  
}