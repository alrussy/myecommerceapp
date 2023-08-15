import 'package:ecommerce_app/controller/onboarding_controller.dart';
import 'package:ecommerce_app/core/constant/fonts_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color_app.dart';
import '../../../core/constant/route_app.dart';

class OnBoardingButtonSkip extends GetView<OnBoardingController> {
  const OnBoardingButtonSkip({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(

      style: ButtonStyle(
          padding:MaterialStatePropertyAll(EdgeInsets.only(bottom: 20)),),
        onPressed: () {
          Get.offNamed(RouteApp.LOGIN);
        },
        child: Text(
          'Skip',
          style: TextStyle(
            fontSize:16 ,
             fontFamily:FontsApp.alkatra, fontWeight: FontWeight.bold, color: ColorApp.primary,),
        ));
  }
}
