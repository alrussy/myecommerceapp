
import 'package:ecommerce_app/core/constant/route_app.dart';
import 'package:ecommerce_app/data/services/rest_password.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../core/class/status_request.dart';
import '../core/function/handling_data.dart';
import '../data/model/user_entity.dart';

class ResetPasswordController extends GetxController{
  late bool isCheckedPassword = false;
  late RestPasswordService restPasswordService = RestPasswordService(Get.find());
  late StatusRequest statusRequest=StatusRequest.NONE;
  late TextEditingController password;
  late TextEditingController rePassword;
  late FocusNode passwordFocus;
  late FocusNode rePasswordFocus;

  late User user=Get.arguments;
  GlobalKey<FormState> formState=GlobalKey();

  onChangedPassword(bool val) {
    isCheckedPassword = val;
    update();
  }


  resetPassword() async {
    var formData=formState.currentState;
    if(formData!.validate()) {
      if (password.text.trim() == rePassword.text.trim()) {
        user.password = password.text.trim().toString();
        print(user.password);
        statusRequest = StatusRequest.LOADING;
        var response = await restPasswordService.restPassword(user);
        statusRequest = handlingData(response);
        if (statusRequest == StatusRequest.SUCCESS) {
          await Get.defaultDialog(
              title: 'Alert', middleText: statusRequest.toString());
          Get.offAllNamed(RouteApp.LOGIN);
        }
        else {
          Get.defaultDialog(
              title: 'Alert', middleText: statusRequest.toString());
        }
      }
      else
        Get.defaultDialog(
            title: 'Alert', middleText: 'the Repassword is uncorect');
      rePasswordFocus.requestFocus();
    }
    update();
  }

  @override
  void onInit() {
    rePassword = TextEditingController();
    password = TextEditingController();
    passwordFocus=FocusNode();
    rePasswordFocus=FocusNode();
    super.onInit();
  }
}
