
import 'package:ecommerce_app/controller/login_controller.dart';
import 'package:ecommerce_app/core/constant/color_app.dart';
import 'package:ecommerce_app/core/constant/fonts_app.dart';
import 'package:ecommerce_app/res/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomCheckBox extends StatelessWidget {
  CustomCheckBox({Key? key,required this.textCheckBox,required this.onChanged,required this.myVal}) : super(key: key);
  final bool myVal;
  final String textCheckBox;
  void Function(bool?)? onChanged;


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(value:myVal,
          onChanged:onChanged,
          activeColor:AppColors.primary,
        ),
        Text(textCheckBox,textAlign: TextAlign.left,style:TextStyle(color:AppColors.primary,fontFamily: FontsApp.alkatra,fontSize: 15))

      ],
    );
  }
}
