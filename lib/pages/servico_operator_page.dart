import 'package:abc_tech_service_front/controller/servico_operator_controller.dart';
import 'package:abc_tech_service_front/model/order_location_response.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/order_assistance.dart';

class ServicoOperatorPage extends GetView<ServicoOperatorController> {
  const ServicoOperatorPage({Key? key}) : super(key: key);

  _textModalEnd(OrderLocationResponse? end) {

    if(end?.dateTime == '') {
      return const Text("Serviço não finalizado");
    }

    return Column(
      children: [
        Text('Data Final: ${end?.dateTime}'),
        Text('Latitude: ${end?.latitude}'),
        Text('Longitude: ${end?.longitude}')
      ],
    );
  }

  showModal(OrderAssistance item, BuildContext context) {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 600,
          color: Colors.amber,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 25.0, left: 20.0),
                  child: Column(
                    children: [
                      const Text("Inicio serviço: ", style: TextStyle(fontSize: 18.0)),
                      Text('Data: ${item.start?.dateTime}'),
                      Text('Latitude: ${item.start?.latitude}'),
                      Text('Longitude: ${item.start?.longitude}'),
                      const SizedBox(height: 32.0),
                      const Text("Final serviço: ", style: TextStyle(fontSize: 18.0)),
                      _textModalEnd(item.end),
                      const SizedBox(height: 16.0),
                      Row(children: const [ Text("Serviços efetuados: ") ]),
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
          title: Text('Data inicial do serviço: ${dateStarted.toString()}'),
          subtitle: Text('Operador: ${list[index].operatorName}'),
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
      appBar: AppBar(title: const Text("Serviços do operador")),
      floatingActionButton: FloatingActionButton(
        onPressed: () => controller.getAssistancesByOperatorId(),
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