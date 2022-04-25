import 'package:get/get.dart';
import '../constants.dart';

abstract class OrderAssistanceProviderInterface {
  Future<Response> getAssistsByOperatorId(int operatorId);
}

class OrderAssistanceProvider extends GetConnect implements OrderAssistanceProviderInterface {
  @override
  Future<Response> getAssistsByOperatorId(int operatorId) => get('${Constants.url}/order?registration=$operatorId');

}