import 'package:ecommerce_app/core/class/status_request.dart';
import 'package:ecommerce_app/core/function/handling_data.dart';
import 'package:ecommerce_app/core/service/service.dart';
import 'package:ecommerce_app/data/model/user_entity.dart';
import 'package:ecommerce_app/data/services/login_service.dart';
import 'package:ecommerce_app/res/routes/routes.dart';
import 'package:ecommerce_app/res/routes/routes_name.dart';
import 'package:ecommerce_app/utils/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {

  final GlobalKey<FormState> formState = GlobalKey<FormState>(); //for Use valid Input
  final ServiceApp serviceApp = Get.find(); //for use SharedPreference
  late LoginService service = LoginService(Get.find());
  late bool? isCheckedPassword = false;
  late bool? isCheckedRemember = false;
  late StatusRequest statusRequest = StatusRequest.NONE;
  late TextEditingController password;
  late TextEditingController email;
  late FocusNode emailFocus;
  late FocusNode passwordFocus;





  onChangedRemember(bool val) {
    isCheckedRemember = val;
    update();
  }
  onChangedPassword(bool val) {
    isCheckedPassword = val;
    update();
  }
  signUp() {
    Get.offNamed(RoutesName.SIGNUP);
  }
  forgetPassword() {
    Get.toNamed(RoutesName.FORGET_PASWORD);
  }

  login() async {
    print('login');
    if (formState.currentState!.validate()) {
      statusRequest = StatusRequest.LOADING;
      update();
      User user = User(email: email.text.trim(), password: password.text.trim());

      var response = await service.login(user);
      statusRequest = handlingData(response);
       if (statusRequest == StatusRequest.SUCCESS) {
          statusRequest=StatusRequest.SUCCESS;
        if (response > 0) {
          await getUser(response);
          if (isCheckedRemember!) {
            serviceApp.sharedPreferences.setString('boarding','2');
          } else {
           serviceApp.sharedPreferences.setString('boarding', '1');
          }
          Get.offAllNamed(RoutesName.BOTTOM_NAVIGAITION_BAR_BAGE);
        } else if (response == 0) {
          Get.snackbar('alert', 'the password is invalid');
          passwordFocus.requestFocus();
        } else {
          Get.snackbar('Alert','the Email is not regisrter');
          emailFocus.requestFocus();

        }
      }
      }
    update();
  }

  getUser(int userId)async{
    var response = await service.getUser(userId);
    if(handlingData(response)==StatusRequest.SUCCESS){
      User user=User.fromJson(response);
      serviceApp.sharedPreferences.setInt('user_id', userId);
      serviceApp.sharedPreferences.setString('user_name',user.userName!);
      serviceApp.sharedPreferences.setString('user_email',user.email!);
      serviceApp.sharedPreferences.setString('user_phone',user.phone!);
    }

  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    emailFocus=FocusNode();
    passwordFocus=FocusNode();
    super.onInit();
  }
}
