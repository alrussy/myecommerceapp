import 'package:ecommerce_app/controller/onboarding_controller.dart';
import 'package:ecommerce_app/res/fonts/app_fonts.dart';
import 'package:ecommerce_app/res/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../res/colors/app_colors.dart';

class OnBoardingButtonSkip extends GetView<OnBoardingController> {
  const OnBoardingButtonSkip({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(

      style: ButtonStyle(
          padding:MaterialStatePropertyAll(EdgeInsets.only(bottom: 20)),),
        onPressed: () {
          Get.offNamed(RoutesName.LOGIN);
        },
        child: Text(
          'Skip',
          style: TextStyle(
            fontSize:16 ,
             fontFamily:AppFonts.alkatra, fontWeight: FontWeight.bold, color: AppColors.primary,),
        ));
  }
}
