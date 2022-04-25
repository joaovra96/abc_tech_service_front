
import 'package:abc_tech_service_front/model/user_login.dart';
import 'package:get/get.dart';

import '../constants.dart';

abstract class LoginProviderInterface {
  Future<Response> login(UserLogin user);
}

class LoginProvider extends GetConnect implements LoginProviderInterface {
  @override
  Future<Response> login(user) => post('${Constants.url}/users/login', user.toMap());
}