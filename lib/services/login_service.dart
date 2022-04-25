

import 'package:abc_tech_service_front/model/user_login.dart';
import 'package:abc_tech_service_front/model/user_logged.dart';
import 'package:abc_tech_service_front/provider/login_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class LoginServiceInterface {
  Future<UserLogged> login(UserLogin user);
}

class LoginService extends GetxService implements LoginServiceInterface {
  final LoginProviderInterface _loginProvider;

  LoginService(this._loginProvider);

  @override
  Future<UserLogged> login(UserLogin user) async {
    Response response = await _loginProvider.login(user);

    try {
      if (response.hasError) {
        return Future.error(ErrorDescription("Erro na API"));
      }
      
      UserLogged objResponse = UserLogged.fromMap(response.body);

      return Future.sync(() => UserLogged(token: 'Bearer ${objResponse.token}'));
    } catch (e) {
      e.printError();
      return Future.error(ErrorDescription("Erro não esperado"));
    }
  }

}