import 'dart:convert';

import 'package:intl/intl.dart';


class OrderLocationResponse {
  double latitude;
  double longitude;
  String dateTime;

  OrderLocationResponse({
    required this.latitude,
    required this.longitude,
    required this.dateTime
  });

  OrderLocationResponse copyWith({
    double? latitude,
    double? longitude,
    String? dateTime,
  }) {
    return OrderLocationResponse(
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      dateTime: dateTime ?? this.dateTime,
    );
  }

  Map<String, dynamic> toMap() {  
    return <String, dynamic>{
      'latitude': latitude,
      'longitude': longitude,
      'dateTime': dateTime
    };
  }

  factory OrderLocationResponse.fromMap(Map<String, dynamic> map) {
    return OrderLocationResponse(
      latitude: map['latitude'] ?? 0.0,
      longitude: map['longitude'] ?? 0.0,
      dateTime: map['dateTime'] != null ? DateFormat("dd/MM/yyyy hh:mm").format(DateTime.fromMillisecondsSinceEpoch(map['dateTime'])): '',
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderLocationResponse.fromJson(String source) => OrderLocationResponse.fromMap(json.decode(source));

  @override
  String toString() => 'OrderLocationResponse(latitude: $latitude, longitude: $longitude, dateTime: $dateTime)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is OrderLocationResponse &&
      other.latitude == latitude &&
      other.longitude == longitude &&
      other.dateTime == dateTime;
  }

  @override
  int get hashCode => latitude.hashCode ^ longitude.hashCode ^ dateTime.hashCode;
}
