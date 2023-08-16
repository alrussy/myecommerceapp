import 'package:ecommerce_app/controller/onboarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../res/colors/app_colors.dart';
import '../../../res/fonts/app_fonts.dart';

class OnBoardingButtounContinue extends StatelessWidget {
  const OnBoardingButtounContinue({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingController>(builder: (controller)=>
        Padding(
          padding: const EdgeInsets.only(bottom: 18.0),
          child: ElevatedButton(
            child: Text(
              '${controller.textButton}',
              style: TextStyle(fontSize: 20 ,fontFamily: AppFonts.alkatra,
              ),
            ),
              style: ButtonStyle(
                maximumSize:MaterialStatePropertyAll(Size(Get.width/1.5,40)),
                minimumSize:MaterialStatePropertyAll(Size(Get.width/1.5,40)),
                elevation: MaterialStatePropertyAll(5),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
                backgroundColor:MaterialStatePropertyAll(AppColors.primary),
              ),
          onPressed: () {
            controller.next();
          },

    ),
        )
    );
  }
}
