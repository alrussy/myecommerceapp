import 'package:ecommerce_app/controller/onboarding_controller.dart';
import 'package:ecommerce_app/core/constant/color_app.dart';
import 'package:ecommerce_app/core/constant/fonts_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
              style: TextStyle(fontSize: 20 ,fontFamily: FontsApp.alkatra,
              ),
            ),
              style: ButtonStyle(
                maximumSize:MaterialStatePropertyAll(Size(Get.width/1.5,40)),
                minimumSize:MaterialStatePropertyAll(Size(Get.width/1.5,40)),
                elevation: MaterialStatePropertyAll(5),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10))),
                backgroundColor:MaterialStatePropertyAll(ColorApp.primary),
              ),
          onPressed: () {
            controller.next();
          },

    ),
        )
    );
  }
}
