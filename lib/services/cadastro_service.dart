
import 'package:abc_tech_service_front/model/new_user.dart';
import 'package:abc_tech_service_front/model/user.dart';
import 'package:abc_tech_service_front/provider/cadastro_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class CadastroServiceInterface {
  Future<NewUser> addUser(User user);
}

class CadastroService extends GetxService implements CadastroServiceInterface {
  final CadastroProviderInterface _cadastroProvider;

  CadastroService(this._cadastroProvider);

  @override
  Future<NewUser> addUser(User user) async {
    Response response = await _cadastroProvider.addUser(user);

    try {
      if (response.hasError) {
        return Future.error(ErrorDescription("Erro na API"));
      }

      NewUser userResponse = NewUser.fromMap(response.body);

      return Future.sync(() => NewUser(
        id: userResponse.id, 
        name: userResponse.name, 
        registration: userResponse.registration)
      );
    } catch (e) {
      e.printError();
      return Future.error(ErrorDescription("Erro não esperado"));
    }
  }

}