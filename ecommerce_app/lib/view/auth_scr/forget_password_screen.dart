import 'package:ecommerce_app/controller/forget_password_controller.dart';
import 'package:ecommerce_app/controller/login_controller.dart';
import 'package:ecommerce_app/core/class/handle_data_view.dart';
import 'package:ecommerce_app/core/constant/color_app.dart';
import 'package:ecommerce_app/core/constant/fonts_app.dart';
import 'package:ecommerce_app/core/constant/route_app.dart';
import 'package:ecommerce_app/core/function/validation_Input.dart';
import 'package:ecommerce_app/res/colors/app_colors.dart';
import 'package:ecommerce_app/view/auth_scr/widget/customButtonLogin.dart';
import 'package:ecommerce_app/view/auth_scr/widget/custom_body.dart';
import 'package:ecommerce_app/view/auth_scr/widget/custom_text_field.dart';
import 'package:ecommerce_app/view/auth_scr/widget/custom_title.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
class ForgetPassword extends StatelessWidget {
  ForgetPassword({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    ForgetPasswordController forgetPasswordController = Get.put(ForgetPasswordController());
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(
        backgroundColor:AppColors.primary,

        centerTitle: true,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        titleTextStyle: TextStyle(
          color: Color(0xff888888),
          fontSize: 18,
        ),
      ),
      body:GetBuilder<ForgetPasswordController>(builder: (controller)=>HandlingDatRequest(
        statusRequest: controller.statusRequest,
        widget: ListView(
          shrinkWrap: true,
          children: [
            Container(
              padding: EdgeInsets.only(top: 100,bottom: 50, left: 30,right: 30),
              child: Column(
                  children: [
                CustomTitleLogin(
                  textTitle: 'Check Email',
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: CustomBodyLogin(
                    textBody:
                    'plase Enter your Email And Press Check...!',
                  ),
                ),

              ]),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 350,left: 30,right: 30,top: 50),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(top:Radius.circular(30)),
                color: Colors.white,
              ),
            
              child: Column(
                children: [
                  Form(
                    key: controller.formState,
                    child: CustomTextField(
                      submit:(v) {
                        forgetPasswordController.checkEmail();
                      },
                      focusNode: forgetPasswordController.emailFocus,

                        valid: (val){return validInput('email', val!, 5, 30);},
                      textEditingController: forgetPasswordController.email,
                      hintText: 'Enter Your Email',
                      icon: Icons.email_outlined,
                      label: 'Email',
                      keyboardType: TextInputType.emailAddress,
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  CustomButtonLogin(
                    textButton: 'Checked',
                    onPressed: (){
                      controller.checkEmail();
                      print(controller.statusRequest);
                    },

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
