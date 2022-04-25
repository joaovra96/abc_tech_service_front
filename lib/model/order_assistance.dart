import 'dart:convert';

import 'package:abc_tech_service_front/model/assistance.dart';

import 'order_location.dart';

class OrderAssistance {

  int operatorId;
  List<Assistance> services = [];
  OrderLocation? start;
  OrderLocation? end;

    OrderAssistance(
    {
      required this.operatorId,
      required this.services,
      required this.start,
      required this.end
    }
  );

  factory OrderAssistance.fromMap(Map<String, dynamic> map) {
    return OrderAssistance(
      operatorId: map['operatorId'].toInt() ?? 0, 
      services: map['services'] ?? [], 
      start: map['start'] ?? 0.0, 
      end: map['end'] ?? 0.0
    );
  }

    Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'operatorId': operatorId,
      'services': services,
      'start': start?.toMap(),
      'end': end?.toMap()
    };
  }

  String toJson() => json.encode(toMap());

  factory OrderAssistance.fromJson(String source) => OrderAssistance.fromMap(json.decode(source));

}