
import 'package:abc_tech_service_front/constants.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AssistanceProviderInterface {
  Future<Response> getAssists();
}

class AssistanceProvider extends GetConnect implements AssistanceProviderInterface {

  @override
  Future<Response> getAssists() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token')!;

    return get('${Constants.url}/assistance', headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    });
  } 
}