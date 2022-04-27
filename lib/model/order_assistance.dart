import 'dart:convert';

import 'package:abc_tech_service_front/model/assistance.dart';
import 'package:abc_tech_service_front/model/order_location_response.dart';

class OrderAssistance {

  String operatorName;
  String operatorRegistration;
  List<Assistance> services = [];
  OrderLocationResponse? start;
  OrderLocationResponse? end;

    OrderAssistance(
    {
      required this.operatorName,
      required this.operatorRegistration,
      required this.services,
      required this.start,
      required this.end
    }
  );

  factory OrderAssistance.fromMap(Map<String, dynamic> map) {
    var listServices = map['services'].map<Assistance>((item) => Assistance.fromMap(item)).toList();
    return OrderAssistance(
      operatorName: map['operatorName'] ?? '', 
      operatorRegistration: map['operatorRegistration'] ?? '', 
      services: listServices ?? [], 
      start: OrderLocationResponse.fromMap(map['start'] ?? {}), 
      end: OrderLocationResponse.fromMap(map['end'] ?? {})
    );
  }

    Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'operatorName': operatorName,
      'operatorRegistration': operatorRegistration,
      'services': services,
      'start': start?.toMap(),
      'end': end?.toMap()
    };
  }

  String toJson() => json.encode(toMap());

  factory OrderAssistance.fromJson(String source) => OrderAssistance.fromMap(json.decode(source));

}