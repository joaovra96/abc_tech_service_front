class UserLogged {
  String token;

  UserLogged({
    required this.token
  });

  factory UserLogged.fromMap(Map<String, dynamic> map) {
    return UserLogged(token: map['token'] ?? '');
  }
}