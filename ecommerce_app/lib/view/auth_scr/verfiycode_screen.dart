import 'package:ecommerce_app/controller/verfiycode_controller.dart';
import 'package:ecommerce_app/view/auth_scr/widget/custom_body.dart';
import 'package:ecommerce_app/view/auth_scr/widget/custom_title.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

import '../../res/colors/app_colors.dart';
class VerfiyCodeScreen extends StatelessWidget {
  VerfiyCodeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    VerfiyCodeController verfiyCodeController = Get.put(VerfiyCodeController());
    return Scaffold(
      backgroundColor: AppColors.backgroundOnBoarding,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundOnBoarding,

        centerTitle: true,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
        titleTextStyle: TextStyle(
          color: Color(0xff888888),
          fontSize: 18,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
          child: Column
            (
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
            CustomTitleLogin(
              textTitle: 'Verifiy Code',
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Row(
                children: [
                  CustomBodyLogin(
                      textBody:
                      ' We Have Send The Code Verification to : \n{verfiyCodeController.user.email} '),
                ],
              ),
            ),
            SizedBox(
              height: 80,
            ),

                OtpTextField(
                  numberOfFields: 5,
                  fieldWidth: 50,
                  borderRadius: BorderRadius.circular(20),
                  cursorColor:AppColors.primary ,
                  focusedBorderColor:  AppColors.primary,
                  borderColor: Color(0xFF512DA8),
                  //set to true to show as box or false to show as dash
                  showFieldAsBox: true,
                  //runs when a code is typed in
                  onCodeChanged: (String code) {
                    //handle validation or checks here
                  },
                  //runs when every textfield is filled
                  onSubmit: (String verificationCode){
                   /* showDialog(
                        context: context,
                        builder: (context){
                          return AlertDialog(
                            title: Text("Verification Code"),
                            content: Text('Code entered is $verificationCode'),
                          );
                        }
                    );*/
                    verfiyCodeController.verifiyCode(verificationCode);
                  }, // end onSubmit
                ),
                SizedBox(
                  height: 30,
                ),
                GetBuilder<VerfiyCodeController>(builder: (controller)=>
                    Column(

                      children: [
                        Text('resend code after ${controller.m}:${controller.s}'),
                        SizedBox(height: 15,),
                        !controller.isFinishTime?ElevatedButton(onPressed:null, child: Text('resend code')):
                        ElevatedButton(onPressed:(){
                          controller.resendVerifiyCode();
                        }, child: Text('resend code'))
                      ],
                    )

                )
          ]),
        ),
      ),
    );
  }
}
