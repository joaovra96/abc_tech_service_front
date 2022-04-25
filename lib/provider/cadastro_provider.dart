import 'package:abc_tech_service_front/model/user.dart';
import 'package:get/get.dart';

import '../constants.dart';

abstract class CadastroProviderInterface {
  Future<Response> addUser(User user);
}

class CadastroProvider extends GetConnect implements CadastroProviderInterface {
  @override
  Future<Response> addUser(User user) => post('${Constants.url}/users', user.toMap());
}