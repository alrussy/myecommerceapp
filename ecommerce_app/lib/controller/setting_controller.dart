



import 'package:ecommerce_app/res/routes/routes_name.dart';
import 'package:get/get.dart';

class SettingController extends GetxController{
  
  
  
  goToAddressPage(){
    Get.toNamed(RoutesName.ADDRESS_PAGE);
  }
  goToOrdersPage(){
    Get.toNamed(RoutesName.ORDER_PAGE);
  }
}