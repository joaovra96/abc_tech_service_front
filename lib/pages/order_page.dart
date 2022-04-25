import 'package:abc_tech_service_front/controller/order_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../model/assistance.dart';

class OrderPage extends GetView<OrderController> {
  const OrderPage({Key? key}) : super(key: key);

  Widget renderAssists(List<Assistance> assists) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: assists.length,
      itemBuilder: (context, index) => ListTile(title: Text(assists[index].name))
    );
  }

  Widget renderFromScreen(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: controller.formOrderKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(children: const [
              Expanded(
                child: Text(
                  'Preencha o formulário de ordem de serviço',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                )
              )
            ]),
            Obx(() {
              var enable = controller.screenState.value == OrderState.creating;
              enable = false;
              return TextFormField(
                controller: controller.operatorIdController,
                enabled: enable,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Código do prestador'),
                textAlign: TextAlign.center,
              );
            }),
            Row(children: [
              const Expanded(
                child: Padding(
                  padding: EdgeInsets.only(top: 25, bottom: 25),
                  child: Text(
                    'Selecione os serviços a serem prestados',
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
                  )
                )
              ),
              Visibility(
                child: Ink(
                  decoration: const ShapeDecoration(
                    shape: CircleBorder(), color: Colors.blueAccent),
                  child: IconButton(
                    icon: const Icon(
                      Icons.search,
                      color: Colors.white,
                    ),
                    onPressed: () => controller.editServices()),
                  width: 40,
                  height: 40),
                visible: controller.screenState.value == OrderState.creating,
              ),
            ]),
            Obx(() => renderAssists(controller.selectedAssistances)),
            Row(children: [
              Expanded(
                child: ElevatedButton(onPressed: () {
                  FocusScope.of(context).unfocus();
                  controller.finishStartOrder();
                }, child: Obx((() {
                    var status = controller.screenState.value == OrderState.creating;
                    return Text(status ? "Iniciar serviço" : "Finalizar serviço");
                })))
              )
            ]),
            Row(children: [
              Visibility(
                child: Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      FocusScope.of(context).unfocus();
                      controller.edit();
                    },
                    style: ElevatedButton.styleFrom(primary: Colors.grey),
                    child: const Text("Editar"))),
                visible: controller.screenState.value == OrderState.started,
              )
            ]),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Ordem de serviço"),),
      floatingActionButton: FloatingActionButton(
        onPressed: () => controller.clearForm(),
        child: const Icon(Icons.cancel, color: Colors.white),
      ),
      body: Container(
        constraints: const BoxConstraints.expand(),
        padding: const EdgeInsets.all(10.0),
        child: controller.obx(
          (state) => renderFromScreen(context),
          onLoading: const Center(child: CircularProgressIndicator()),
          onError: (error) => Text(error.toString())
        ),
      ),
    );
  }
}
