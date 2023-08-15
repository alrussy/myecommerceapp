


import
'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ServiceApp extends GetxService {

  late SharedPreferences sharedPreferences;

  Future<ServiceApp> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
    return this;
  }
}

//   =======function
initServices()async{
  await Get.putAsync( () => ServiceApp().init());
}
