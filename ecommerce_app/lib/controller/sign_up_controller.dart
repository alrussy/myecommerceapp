import 'package:ecommerce_app/core/class/status_request.dart';
import 'package:ecommerce_app/core/constant/route_app.dart';
import 'package:ecommerce_app/core/function/check_internet.dart';
import 'package:ecommerce_app/core/function/handling_data.dart';
import 'package:ecommerce_app/data/model/user_entity.dart';
import 'package:ecommerce_app/data/services/verifiy_code_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';


class SignUpController extends GetxController {


  GlobalKey<FormState>  formState=GlobalKey<FormState>();
  late bool isCheckedPassword = false;
  late VerificationCodeService verificationCodeService = VerificationCodeService(Get.find());
  late StatusRequest statusRequest=StatusRequest.NONE;
  late TextEditingController userName;
  late TextEditingController phone;
  late TextEditingController email;
  late TextEditingController password;
  late FocusNode userFocus;
  late FocusNode emailFocus;
  late FocusNode phoneFocus;
  late FocusNode passwordFocus;


  late User user;
  late String vcode='';
  // late User test;

  onChangedPassword(bool val) {
    isCheckedPassword = val;
    update();
  }


  signIn() {
    Get.offNamed(RouteApp.LOGIN);
  }


    signUp()async{
    var formData=formState.currentState;
    if(formData!.validate()){
      statusRequest=StatusRequest.LOADING;
      update();
      user = User(
        userName: userName.text.trim(),
        phone: phone.text.trim(),
        email:  email.text.trim(),
        password: password.text.trim(),
      );
      var response=await verificationCodeService.sendVerificationCode(user);
      statusRequest=handlingData(response);
      if(statusRequest==StatusRequest.SUCCESS){
        vcode=response.toString();
        await Get.toNamed(RouteApp.VERFIY_CODE, arguments: {'code':vcode,'user':user});
      }
    }
      update();
    }

  @override
  void onInit() {
    userName = TextEditingController();
    phone = TextEditingController();
    email = TextEditingController();
    password = TextEditingController();
    userFocus=FocusNode();
    emailFocus=FocusNode();
    phoneFocus=FocusNode();
    passwordFocus=FocusNode();
    super.onInit();
  }
}
