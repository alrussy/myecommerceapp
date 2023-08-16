

import 'package:ecommerce_app/core/service/service.dart';
import 'package:ecommerce_app/data/data_local.dart';
import 'package:ecommerce_app/res/routes/routes_name.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class OnBoardingController extends GetxController{
  int currentPage=0;
  int firstPage=0;
  int lastPage=onBoardingList.length-1;
  String textButton='continue';
  PageController? pageController;
  ServiceApp serviceApp=Get.find();


//==================================================================
  onPageChanged(int index){
    currentPage=index;
    if(currentPage==lastPage)
      textButton = 'Start';
    else
      textButton='continue';
    update();
  }
//=========================================================
  next(){
    currentPage++;


     if(currentPage>lastPage){
      // serviceApp.sharedPreferences.setString('boarding', '1');
      Get.offNamed(RoutesName.LOGIN);
     }
    else{
      pageController?.animateToPage(currentPage, duration: const Duration(milliseconds: 500),
          curve: Curves.easeIn);
    }
    update();
  }
//================================================================

  @override
  void onInit() {
    pageController= PageController();
    super.onInit();
  }
}