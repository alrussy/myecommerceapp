import 'package:ecommerce_app/controller/onboarding_controller.dart';
import 'package:ecommerce_app/core/constant/fonts_app.dart';
import 'package:ecommerce_app/data/data_local.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class OnBoardingPageView extends GetView<OnBoardingController> {
  const OnBoardingPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: PageView.builder(
          controller: controller.pageController,
          onPageChanged: (index) {
            controller.onPageChanged(index);
          },
          itemCount: onBoardingList.length,
          itemBuilder: (context, index) {
            return Container(
                  margin: EdgeInsets.symmetric(horizontal: 1.5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.asset(onBoardingList[index].image!, fit: BoxFit.fill),
                  Container(
                    padding: EdgeInsets.only(
                      top: 20,
                    ),
                    child: Text(
                      onBoardingList[index].title!,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: FontsApp.alkatra,
                          fontWeight: FontWeight.bold,
                          fontSize: 25),
                    ),
                  ),
                  Container(
                    width: Get.width,
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(top:20,),
                    child: Text(
                      onBoardingList[index].body!,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontFamily: FontsApp.alkatra,
                        wordSpacing: 1,
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                        height: 2,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
