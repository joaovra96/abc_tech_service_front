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
                const ListTile(
                  title: Text("Nome: Usuario fulano"),
                  subtitle: Text("Operador ID: 123456789"),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(onPressed: () {}, child: const Text("Alterar dados"))
                  ],
                ),
              ],
            )
          ),
        ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue
              ),
              child: Text("Usuário Fulano")
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