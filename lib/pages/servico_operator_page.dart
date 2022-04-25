
import 'package:abc_tech_service_front/controller/servico_operator_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/order_assistance.dart';

class ServicoOperatorPage extends GetView<ServicoOperatorController> {
  const ServicoOperatorPage({Key? key}) : super(key: key);

  showModal(OrderAssistance item, BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 400,
          color: Colors.amber,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 25.0),
                  child: Column(
                    children: [
                      Text(
                        'Data: ' + item.services[0].name,
                        style: const TextStyle(fontSize: 18.0)
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: item.services.length,
                        itemBuilder: (context, index) => ListTile(title: Text(item.services[index].name)),
                      )
                    ],
                  ),
                ),
                ElevatedButton(
                  child: const Text('Fechar modal'),
                  onPressed: () => Navigator.pop(context),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  Widget renderListOrder(List<OrderAssistance> list) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: list.length,
      itemBuilder: (context, index) {
        var dateStarted = list[index].start?.dateTime;
        return ListTile(
          title: Text(dateStarted.toString()), 
          onTap: () => showModal(list[index], context)
        );
    });
  }

  Widget renderAssistsOperator(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: const [
              Expanded(child: Text("Serviços efetuados foram: ",textAlign: TextAlign.left))
            ],
          ),
          renderListOrder(controller.assistsByOperator)
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Order")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.refresh, color: Colors.white),
      ),
      body: Container(
        constraints: const BoxConstraints.expand(),
        padding: const EdgeInsets.all(10.0),
        child: controller.obx(
          (state) => renderAssistsOperator(context),
          onLoading: const Center(child: CircularProgressIndicator()),
          onError: (error) => Text(error.toString())
        )
      ),
    );
  }
  
}