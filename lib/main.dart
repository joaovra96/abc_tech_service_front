import 'package:abc_tech_service_front/pages/cadastro_bind.dart';
import 'package:abc_tech_service_front/pages/cadastro_page.dart';
import 'package:abc_tech_service_front/pages/home_bind.dart';
import 'package:abc_tech_service_front/pages/home_page.dart';
import 'package:abc_tech_service_front/pages/inicio_page.dart';
import 'package:abc_tech_service_front/pages/login_bind.dart';
import 'package:abc_tech_service_front/pages/login_page.dart';
import 'package:abc_tech_service_front/pages/order_bind.dart';
import 'package:abc_tech_service_front/pages/order_page.dart';
import 'package:abc_tech_service_front/pages/perfil_bind.dart';
import 'package:abc_tech_service_front/pages/perfil_page.dart';
import 'package:abc_tech_service_front/pages/servico_operator_bind.dart';
import 'package:abc_tech_service_front/pages/servico_operator_page.dart';
import 'package:abc_tech_service_front/provider/assistance_provider.dart';
import 'package:abc_tech_service_front/provider/order_assistance_provider.dart';
import 'package:abc_tech_service_front/services/assistance_service.dart';
import 'package:abc_tech_service_front/services/order_assistance_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  initServices();
  runApp(const MyApp());
}

void initServices() async {
  await Get.putAsync(() => AssistanceService().init(AssistanceProvider()));
  await Get.putAsync(() => OrderAssistanceService().init(OrderAssistanceProvider()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return GetMaterialApp(
      title: 'Projeto FIAP',
      theme: ThemeData(primarySwatch: Colors.blue),
      getPages: [
        GetPage(name: "/services", page: () => const HomePage(), binding: HomeBind()),
        GetPage(name: "/services_operator", page: () => const ServicoOperatorPage(), binding: ServicoOperatorBind()),
        GetPage(name: "/order", page: () => const OrderPage(), binding: OrderBind()),
        GetPage(name: "/new", page: () => const CadastroPage(), binding: CadastroBinding()),
        GetPage(name: "/perfil", page: () => const PerfilPage(), binding: PerfilBind()),
        GetPage(name: "/login", page: () => const LoginPage(), binding: LoginBind()),
        GetPage(name: "/", page: () => const InicioPage()),
      ],
    );
  }
}
