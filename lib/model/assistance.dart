import 'dart:convert';

class Assistance {
  int id;
  String name;
  String description;
  Assistance({
    required this.id,
    required this.name,
    required this.description,
  });

  Assistance copyWith({
    int? id,
    String? name,
    String? description,
  }) {
    return Assistance(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
  
    result.addAll({'id': id});
    result.addAll({'name': name});
    result.addAll({'description': description});
  
    return result;
  }

  factory Assistance.fromMap(Map<String, dynamic> map) {
    return Assistance(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      description: map['description'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Assistance.fromJson(String source) => Assistance.fromMap(json.decode(source));

  @override
  String toString() => 'Assistance(id: $id, name: $name, description: $description)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Assistance &&
      other.id == id &&
      other.name == name &&
      other.description == description;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ description.hashCode;
}
