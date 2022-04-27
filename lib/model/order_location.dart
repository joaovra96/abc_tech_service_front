import 'dart:convert';


class OrderLocation {
  double latitude;
  double longitude;
  DateTime dateTime;

  OrderLocation({
    required this.latitude,
    required this.longitude,
    required this.dateTime
  });

  OrderLocation copyWith({
    double? latitude,
    double? longitude,
    DateTime? dateTime,
  }) {
    return OrderLocation(
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      dateTime: dateTime ?? this.dateTime,
    );
  }

  Map<String, dynamic> toMap() {  
    return <String, dynamic>{
      'latitude': latitude,
      'longitude': longitude,
      'dateTime': dateTime.toIso8601String()
    };
  }

  factory OrderLocation.fromMap(Map<String, dynamic> map) {
    return OrderLocation(
      latitude: map['latitude'] ?? 0.0,
      longitude: map['longitude'] ?? 0.0,
      dateTime: map['dateTime'] != null ? DateTime.fromMicrosecondsSinceEpoch(map['dateTime']) : DateTime.now(),
    );
  }

  String toJson() => json.encode(toMap());

  factory OrderLocation.fromJson(String source) => OrderLocation.fromMap(json.decode(source));

  @override
  String toString() => 'OrderLocation(latitude: $latitude, longitude: $longitude, dateTime: $dateTime)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is OrderLocation &&
      other.latitude == latitude &&
      other.longitude == longitude &&
      other.dateTime == dateTime;
  }

  @override
  int get hashCode => latitude.hashCode ^ longitude.hashCode ^ dateTime.hashCode;
}
