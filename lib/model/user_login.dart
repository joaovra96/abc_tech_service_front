class UserLogin {
  String registration;
  String password;

  UserLogin({
    required this.registration,
    required this.password
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'registration': registration,
      'password': password,
    };
  }

}