class UserLogged {
  String operator;
  String token;

  UserLogged({
    required this.operator,
    required this.token
  });

  factory UserLogged.fromMap(Map<String, dynamic> map) {
    return UserLogged(
      operator: map['operator'] ?? '',
      token: map['token'] ?? ''
    );
  }
}