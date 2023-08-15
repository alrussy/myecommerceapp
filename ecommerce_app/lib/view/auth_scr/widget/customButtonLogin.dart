import 'package:ecommerce_app/core/constant/color_app.dart';
import 'package:ecommerce_app/core/constant/fonts_app.dart';
import 'package:ecommerce_app/res/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButtonLogin extends StatelessWidget {
   CustomButtonLogin({Key? key,required this.textButton,this.onPressed}) : super(key: key);
  String textButton;
  void Function()? onPressed;


  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          maximumSize:MaterialStatePropertyAll(Size(Get.width/1.3,40)),
          minimumSize:MaterialStatePropertyAll(Size(Get.width/1.3,40)),
          backgroundColor: MaterialStatePropertyAll(AppColors.primary),
          animationDuration: Duration(milliseconds: 500),
          elevation:MaterialStatePropertyAll(5),

          shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10))),
          padding: MaterialStatePropertyAll(EdgeInsets.symmetric(horizontal: 50)),
        ),

        child: Text(textButton,style: TextStyle(fontSize: 20,fontFamily: FontsApp.alkatra),)

    );
  }
}
