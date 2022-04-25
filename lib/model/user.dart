class User {
  String name;
  String password;

  User({
    required this.name,
    required this.password
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'password': password,
    };
  }
}