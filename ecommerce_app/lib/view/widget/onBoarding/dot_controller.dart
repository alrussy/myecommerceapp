import 'package:ecommerce_app/controller/onboarding_controller.dart';
import 'package:ecommerce_app/data/data_local.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/color_app.dart';

class OnBoardingDotController extends StatelessWidget {
  const OnBoardingDotController({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OnBoardingController>(builder: (controller)=>
        Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ...List.generate(onBoardingList.length, (index) {
          return AnimatedContainer(
            duration: Duration(milliseconds: 500),
            margin: EdgeInsets.only(right: 8, bottom: 30),
            alignment: Alignment.center,
            width: controller.currentPage==index?15:8,
            height: 8,
            decoration: BoxDecoration(
              color: controller.currentPage==index?ColorApp.primary:Colors.grey,
              borderRadius: BorderRadius.circular(15),
            ),
          );
        }
        )
      ],
    )
    );
  }
}
