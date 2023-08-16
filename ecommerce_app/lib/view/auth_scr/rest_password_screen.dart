import 'package:ecommerce_app/controller/login_controller.dart';
import 'package:ecommerce_app/controller/reset_password_controller.dart';
import 'package:ecommerce_app/controller/sign_up_controller.dart';
import 'package:ecommerce_app/core/class/handle_data_view.dart';
import 'package:ecommerce_app/core/function/validation_Input.dart';
import 'package:ecommerce_app/res/colors/app_colors.dart';
import 'package:ecommerce_app/utils/utils.dart';
import 'package:ecommerce_app/view/auth_scr/widget/customButtonLogin.dart';
import 'package:ecommerce_app/view/auth_scr/widget/custom_body.dart';
import 'package:ecommerce_app/view/auth_scr/widget/custom_checkbox.dart';
import 'package:ecommerce_app/view/auth_scr/widget/custom_text_field.dart';
import 'package:ecommerce_app/view/auth_scr/widget/custom_title.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class ResetPasswordScreen extends StatelessWidget {
  ResetPasswordScreen({Key? key}) : super(key: key);
  bool showPassword=true;

  @override
  Widget build(BuildContext context) {
    ResetPasswordController resetPasswordController = Get.put(ResetPasswordController());
    return Scaffold(
      backgroundColor:AppColors.primary,
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        // title:Text(
        //   'Sign up',
        //   style: TextStyle(fontFamily: FontsApp.sriracha,fontSize: 22),
        // ),
        // centerTitle: true,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        titleTextStyle: TextStyle(
          color: Color(0xff888888),
          fontSize: 18,
        ),
      ),
      body: GetBuilder<ResetPasswordController>(builder: (controller)=>
          HandlingDatRequest(statusRequest: controller.statusRequest,
              widget:ListView(
                shrinkWrap: true,
                children: [
                  Container(
                    padding: const EdgeInsets.all(30),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                      CustomTitleLogin(
                        textTitle: 'Reset Password',
                      ),
                          SizedBox(
                            height: 30,
                          ),
                      CustomBodyLogin(textBody: 'plase Enter Password And press\n Reset Password'),
                      SizedBox(
                        height: 80,
                      ),

                    ]),
                  ),
                  Container(
                    padding: EdgeInsets.only(bottom: 100,left: 30,right: 30,top: 50),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.vertical(top:Radius.circular(30)),
                      color: Colors.white,
                    ),
                    child: Column(

                      children: [
                        Form(
                          key: controller.formState,
                          child: ListView(
                            shrinkWrap: true,
                            padding: EdgeInsets.only(bottom: 20),
                            children: [

                              CustomTextField(
                                submit: (v){
                                  Utils.fieldFocusChange(
                                      context,
                                      resetPasswordController.passwordFocus,
                                      resetPasswordController.rePasswordFocus);
                                },
                                focusNode: resetPasswordController.passwordFocus,
                                valid: (val){return validInput('password', val!, 8, 30);},
                                textEditingController:resetPasswordController.password ,
                                hintText: 'Enter Your Password',
                                label: 'Password',
                                showPasswordIsActive:showPassword,
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              CustomTextField(
                                submit: (v){
                                  resetPasswordController.resetPassword();
                                },
                                focusNode: resetPasswordController.rePasswordFocus,
                                valid: (val){
                                  return validInput('password', val!, 8, 30);
                                },
                                textEditingController:resetPasswordController.rePassword ,
                                hintText: 'Enter Your Password Again',
                                label: 'RePassword',
                                showPasswordIsActive: showPassword,
                              ),
                              CustomCheckBox(
                                textCheckBox: 'show Password',
                                onChanged:(val){
                                  resetPasswordController.onChangedPassword(val!);
                                  showPassword=!val;
                                } ,
                                myVal:resetPasswordController.isCheckedPassword ,
                              ),

                            ],
                          ),
                        ),

                        const SizedBox(
                          height: 30,
                        ),
                        CustomButtonLogin(
                          onPressed: (){
                            resetPasswordController.resetPassword();
                          },

                          textButton: 'Reset Password',
                        ),

                      ],
                    ),
                  )
                ],
              ),
      ),)
    );
  }
}
