import 'package:ecommerce_app/controller/login_controller.dart';
import 'package:ecommerce_app/controller/onboarding_controller.dart';
import 'package:ecommerce_app/core/constant/image_assets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constant/color_app.dart';
import '../widget/onBoarding/continue_button.dart';
import '../widget/onBoarding/dot_controller.dart';
import '../widget/onBoarding/page_view.dart';
import '../widget/onBoarding/skip_button.dart';

class OnBoarding extends StatelessWidget {
  OnBoarding({Key? key}) : super(key: key);
  OnBoardingController onBoardingController= Get.put(OnBoardingController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor:ColorApp.backgroundOnBoarding ,
      body: Column(
          children: [
        OnBoardingPageView(),
        OnBoardingDotController(),
        OnBoardingButtounContinue(),
        OnBoardingButtonSkip(),



      ]),
    );
  }
}
