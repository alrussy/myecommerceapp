

import 'package:ecommerce_app/core/class/status_request.dart';
import 'package:ecommerce_app/core/function/check_internet.dart';
import 'package:ecommerce_app/core/function/handling_data.dart';
import 'package:ecommerce_app/data/model/user_entity.dart';
import 'package:ecommerce_app/data/services/forget_password_service.dart';
import 'package:ecommerce_app/data/services/verifiy_code_service.dart';
import 'package:ecommerce_app/res/routes/routes_name.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';


class ForgetPasswordController extends GetxController{

  GlobalKey<FormState> formState=GlobalKey();
  late TextEditingController email;
  StatusRequest statusRequest=StatusRequest.NONE;
  ForgetPasswordService forgetPasswordService=ForgetPasswordService(Get.find());
  VerificationCodeService verificationCodeService=VerificationCodeService(Get.find());
  late String vcode='';

  late FocusNode emailFocus ;

  checkEmail()async{
    var formData = formState.currentState;
    if(formData!.validate()) {
      statusRequest = StatusRequest.LOADING;
      update();
      User user = User( email: email.text.trim());
      var response = await forgetPasswordService.checkEmail(user);
      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.SUCCESS) {
        sendVerifiCod(user, User.fromJson(response));
      }
    }
   print(statusRequest);
    update();
  }

  sendVerifiCod(User user1,User user2)async{
    statusRequest=StatusRequest.LOADING;
    var response=await verificationCodeService.sendVerificationCode(user1);
    statusRequest=handlingData(response);
    if(statusRequest==StatusRequest.SUCCESS){
      vcode=response.toString();
      Get.toNamed(RoutesName.VERFIY_CODE, arguments: {'code':vcode,'user':user2});
    }
    update();
  }
  @override
  void onInit() {
    emailFocus=FocusNode();
    email=TextEditingController();
    super.onInit();
  }
}