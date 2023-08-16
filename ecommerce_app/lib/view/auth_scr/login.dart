import 'package:ecommerce_app/controller/login_controller.dart';
import 'package:ecommerce_app/core/class/handle_data_view.dart';
import 'package:ecommerce_app/core/function/alert_exit_app.dart';
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

import '../../res/fonts/app_fonts.dart';

class Login extends StatelessWidget {
  Login({Key? key}) : super(key: key);
  bool? showPassword = true;
  @override
  Widget build(BuildContext context) {
    LoginController loginController = Get.put(LoginController());
    return Scaffold(
        backgroundColor: AppColors.primary,
        appBar: AppBar(
          backgroundColor: AppColors.primary,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.black),
          titleTextStyle: TextStyle(
            color: Color(0xff888888),
            fontSize: 18,
          ),
        ),
        body: GetBuilder<LoginController>(
            builder: (controller) => HandlingDatRequest(
                  statusRequest: controller.statusRequest,
                  widget: WillPopScope(
                      child: Padding(
                        padding: const EdgeInsets.only(
                         top : 50),
                        child: ListView(
                          shrinkWrap: true,
                            children: [
                              CustomTitleLogin(
                                textTitle: 'Welcome Back',
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 30, bottom:30 ,left:30,right: 30),
                                child: CustomBodyLogin(
                                    textBody:
                                        'Sign In With Email And Password Or Continue With Social Media'),
                              ),
                              Container(
                                padding: EdgeInsets.only(top: 40,bottom: 100,left: 30,right: 30),
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
                                            submit: (v)=>Utils.fieldFocusChange(context,
                                                loginController.emailFocus, loginController.passwordFocus),
                                            focusNode: loginController.emailFocus,
                                            valid: (val) {
                                              return validInput("email", val!, 7, 50);
                                            },
                                            textEditingController: controller.email,
                                            hintText: 'Enter Your Email',
                                            icon: Icons.email_outlined,
                                            label: 'Email',
                                            showPasswordIsActive: false,
                                            keyboardType: TextInputType.emailAddress,
                                          ),
                                          SizedBox(
                                            height: 30,
                                          ),
                                          CustomTextField(
                                            submit: (va){ controller.login();},
                                            focusNode: loginController.passwordFocus,
                                            valid: (val) {
                                              return validInput(
                                                  'password', val!, 8, 30);
                                            },
                                            textEditingController: controller.password,
                                            hintText: 'Enter Your Password',
                                            icon: Icons.lock_outline,
                                            label: 'Password',
                                            showPasswordIsActive: showPassword,
                                          ),
                                          CustomCheckBox(
                                            textCheckBox: 'show Password',
                                            onChanged: (val) {
                                              loginController.onChangedPassword(val!);
                                              showPassword = !val;
                                            },
                                            myVal: loginController.isCheckedPassword!,
                                          ),
                                          CustomCheckBox(
                                            textCheckBox: 'Remember My ',
                                            onChanged: (val) {
                                              loginController.onChangedRemember(val!);
                                            },
                                            myVal: loginController.isCheckedRemember!,
                                          ),
                                        ],
                                      ),
                                    ),
                                    CustomButtonLogin(
                                      textButton: 'Sign In',
                                      onPressed: () {
                                        controller.login();
                                      },
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "do you have not an accuont ?",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontFamily: AppFonts.cairo),
                                        ),
                                        TextButton(
                                            onPressed: () {
                                              loginController.signUp();
                                            },
                                            style: ButtonStyle(
                                                textStyle: MaterialStatePropertyAll(
                                                    TextStyle(
                                                        decoration:
                                                        TextDecoration.underline))),
                                            child: const Text(
                                              'Sign Up',
                                              style: TextStyle(
                                                  color: AppColors.primary,
                                                  fontSize: 18,
                                                  fontFamily: AppFonts.alkatra),
                                            )),
                                      ],
                                    ),
                                    TextButton(
                                        style: ButtonStyle(
                                            textStyle: MaterialStatePropertyAll(
                                                TextStyle(
                                                    decoration:
                                                    TextDecoration.underline))),
                                        onPressed: () {
                                          loginController.forgetPassword();
                                        },
                                        child: const Text(
                                          'Forget Password..!',
                                          textAlign: TextAlign.end,
                                          style: TextStyle(
                                            fontSize: 15,
                                            letterSpacing: 1,
                                            fontFamily: AppFonts.sriracha,
                                          ),
                                        )),
                                  ],
                                ),
                              )
                            ]),
                      ),
                      onWillPop: alertExitApp),
                )));
  }
}
