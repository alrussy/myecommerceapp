
import 'dart:async';

import 'package:ecommerce_app/core/class/status_request.dart';
import 'package:ecommerce_app/core/function/handling_data.dart';
import 'package:ecommerce_app/data/model/user_entity.dart';
import 'package:ecommerce_app/data/services/sign_up_service.dart';
import 'package:ecommerce_app/data/services/verifiy_code_service.dart';
import 'package:ecommerce_app/res/routes/routes_name.dart';
import 'package:ecommerce_app/utils/utils.dart';
import 'package:get/get.dart';



class VerfiyCodeController extends GetxController{
  late var _vCode=Get.arguments['code'];
  late StatusRequest? statusRequest=StatusRequest.NONE;
  late SignUpService signUpService=SignUpService(Get.find());
  late VerificationCodeService verificationCodeService=VerificationCodeService(Get.find());
  bool isFinishTime=false;
  String s='00';
  String m='00';
  User user=Get.arguments['user'];
  String prevPage='';
  bool isCansel=false;

  verifiyCode(String code)async{
    if(code==_vCode && prevPage==RoutesName.SIGNUP) {
      await signUp(user);
    }
   else if (code==_vCode && prevPage==RoutesName.FORGET_PASWORD) {
      Get.offAllNamed(RoutesName.RESET_PASSWORD,arguments: user);
    }
   else{
      Get.back();
      Utils.snackBar('error', 'the code is uncorrect');
    }

  }

  signUp(User myuser) async {
    statusRequest=StatusRequest.LOADING;
    var response = await signUpService.signUp(myuser);
    statusRequest = handlingData(response);
    if(statusRequest==StatusRequest.SUCCESS)
      Get.offAllNamed(RoutesName.LOGIN);
    print(statusRequest);
    update();
  }
  
  resendVerifiyCode()async{
    s='00';
    m='00';
    isFinishTime=false;
    setTimer();
    statusRequest=StatusRequest.LOADING;
    var response=await verificationCodeService.sendVerificationCode(user);
    statusRequest=handlingData(response);
    if(statusRequest==StatusRequest.SUCCESS){
      _vCode=response.toString();
    }
    update();
  }

setTimer()async{
  int sec=0;
  int miunet=0;
  Timer _timer=Timer.periodic(Duration(seconds: 1), (timer) {
    sec++;
    if(sec<10)
    s='0$sec';
    else
      s='$sec';
    if(sec==59){
      miunet++;
      m='0$miunet';
      sec=0;
      s='00';
    }
    print(s);
    if(miunet==1 && sec==30 || isCansel) {
      timer.cancel();
      isFinishTime = true;
      print('cansel');
    }

    update();
  });


}
  @override
  void onInit()async{
    prevPage=Get.previousRoute;
  setTimer();
 super.onInit();

   }

   @override
  void onClose() {
    isCansel=true;
  super.onClose();
  }


}

