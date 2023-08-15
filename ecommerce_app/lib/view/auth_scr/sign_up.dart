import 'package:ecommerce_app/controller/login_controller.dart';
import 'package:ecommerce_app/controller/sign_up_controller.dart';
import 'package:ecommerce_app/core/class/handle_data_view.dart';
import 'package:ecommerce_app/core/class/status_request.dart';
import 'package:ecommerce_app/core/constant/color_app.dart';
import 'package:ecommerce_app/core/constant/fonts_app.dart';
import 'package:ecommerce_app/core/constant/route_app.dart';
import 'package:ecommerce_app/res/colors/app_colors.dart';
import 'package:ecommerce_app/utils/utils.dart';
import 'package:ecommerce_app/view/auth_scr/widget/customButtonLogin.dart';
import 'package:ecommerce_app/view/auth_scr/widget/custom_body.dart';
import 'package:ecommerce_app/view/auth_scr/widget/custom_checkbox.dart';
import 'package:ecommerce_app/view/auth_scr/widget/custom_text_field.dart';
import 'package:ecommerce_app/view/auth_scr/widget/custom_title.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/function/validation_Input.dart';
class SignUp extends StatelessWidget {
  SignUp({Key? key}) : super(key: key);
  bool showPassword=true;
  @override
  Widget build(BuildContext context) {
    SignUpController signUpController = Get.put(SignUpController());
    return Scaffold(
      backgroundColor: AppColors.primary,
      appBar: AppBar(
        backgroundColor:AppColors.primary,
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
      body: GetBuilder<SignUpController>(builder: (controller)=>HandlingDatRequest(
        statusRequest: controller.statusRequest,
        widget: WillPopScope(
        onWillPop: (){
          Get.offNamed(RouteApp.LOGIN);
          return Future.value(true);
        },
        child: ListView(
          shrinkWrap: true,
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
              child: Column(children: [
                CustomTitleLogin(
                  textTitle: 'Sign Up',
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: CustomBodyLogin(
                      textBody:
                      'Sign up With Email And Password Or Continue With Social Media'),
                ),
                SizedBox(
                  height: 20,
                ),
              ]),

            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.vertical(top:Radius.circular(30)),
                color: Colors.white,
              ),
              padding: EdgeInsets.only(bottom: 50,left: 30,right: 30,top: 30),
              child: Column(

                children: [
                  Form(
                    key: controller.formState,
                    child: ListView(
                      shrinkWrap: true,
                      padding: EdgeInsets.only(bottom: 20),

                      children: [
                        CustomTextField(
                          submit: (v)=>Utils.fieldFocusChange(context,
                              signUpController.userFocus, signUpController.emailFocus),
                          focusNode: signUpController.userFocus,
                          valid: (val){return validInput('user_name', val!, 5, 20);},
                          hintText: 'Enter user name',
                          icon: Icons.person_2_outlined,
                          label: 'User Name',
                          textEditingController:controller.userName ,
                        ),
                        SizedBox(
                          height: 20,
                        ),

                        CustomTextField(
                          submit: (v)=>Utils.fieldFocusChange(context,
                              signUpController.emailFocus, signUpController.phoneFocus),
                          focusNode: signUpController.emailFocus,
                          valid: (val){return validInput('email', val!, 5, 30);},
                          hintText: 'Enter Your Email',
                          icon: Icons.email_outlined,
                          label: 'Email',
                          keyboardType:TextInputType.emailAddress ,
                          textEditingController:controller.email ,
                        ),
                        SizedBox(
                          height: 20,
                        ),

                        CustomTextField(
                          submit: (v)=>Utils.fieldFocusChange(context,
                              signUpController.phoneFocus, signUpController.passwordFocus),
                          focusNode: signUpController.phoneFocus,
                          valid: (val){return validInput('phone', val!, 0, 30);},
                          hintText: 'Enter Your Phone',
                          icon: Icons.phone_android_outlined,
                          label: 'Phone',
                          keyboardType: TextInputType.phone,
                          textEditingController:controller.phone,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        CustomTextField(
                          submit: (v){
                            signUpController.signUp();
                          },
                          focusNode: signUpController.passwordFocus,
                          valid: (val){return validInput('password', val!, 8, 30);},
                          hintText: 'Enter Your Password',
                          icon: Icons.lock_outline,
                          label: 'Password',
                          showPasswordIsActive:showPassword,
                          keyboardType: TextInputType.visiblePassword,
                          textEditingController:controller.password,
                        ),
                        CustomCheckBox(
                          textCheckBox: 'show Password',
                          onChanged:(val){
                            signUpController.onChangedPassword(val!);
                            showPassword=!val;
                          } ,
                          myVal:signUpController.isCheckedPassword ,
                        ),

                      ],
                    ),
                  ),
                  CustomButtonLogin(
                    onPressed: ()async{
                      await signUpController.signUp();
                    },

                    textButton: 'Sign up',
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Have you an accuont ?',

                        style: TextStyle(color: Colors.black,fontFamily: FontsApp.cairo),
                      ),
                      TextButton(
                          onPressed: ()=>signUpController.signIn(),
                          style: ButtonStyle(
                              textStyle: MaterialStatePropertyAll(
                                  TextStyle(decoration: TextDecoration.underline))),
                          child: const Text(
                            'Login',
                            style: TextStyle(
                                color: AppColors.primary,
                                fontFamily: FontsApp.alkatra,
                                fontSize: 18

                            ),
                          )),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),),)
    );
  }
}
