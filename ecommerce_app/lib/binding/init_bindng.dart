
import 'package:ecommerce_app/data/repository/repository.dart';
import 'package:get/get.dart';

class InitBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(ApiRepository());
    // TODO: implement dependencies
  }

}