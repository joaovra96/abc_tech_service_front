import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../constants.dart';

abstract class OrderAssistanceProviderInterface {
  Future<Response> getAssistsByOperatorId(String operatorId);
}

class OrderAssistanceProvider extends GetConnect implements OrderAssistanceProviderInterface {
      
  @override
  Future<Response> getAssistsByOperatorId(String operatorId) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token')!;

    return get('${Constants.url}/order?registration=$operatorId', headers: {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    });
  }

}