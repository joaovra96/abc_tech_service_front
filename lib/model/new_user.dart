class NewUser {
  int id;
  String name;
  String registration;

  NewUser({
    required this.id,
    required this.name,
    required this.registration
  });

  factory NewUser.fromMap(Map<String, dynamic> map) {
    return NewUser(
      id: map['id']?.toInt() ?? 0,
      name: map['name'] ?? '',
      registration: map['registration'] ?? '',
    );
  }
}