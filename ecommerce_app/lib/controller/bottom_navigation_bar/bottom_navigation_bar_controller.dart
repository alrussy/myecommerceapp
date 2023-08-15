


import 'package:ecommerce_app/controller/favorite_controller.dart';
import 'package:ecommerce_app/controller/home_controller.dart';
import 'package:ecommerce_app/core/constant/color_app.dart';
import 'package:ecommerce_app/data/model/favorite.dart';
import 'package:ecommerce_app/view/favorite/page/favorite_page.dart';
import 'package:ecommerce_app/view/home_scr/home_page.dart';
import 'package:ecommerce_app/view/satting/setting_page.dart';
import 'package:ecommerce_app/view/screen/home/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class BottomNavagationBarController extends GetxController{
  HomeController homeController= Get.put(HomeController(),permanent: false);
  int currentPage=0;
  List<Widget> listPage=[
    HomePage(),
    const Center(child: Text('profile'),),
    const Center(child: Text('profile'),),
    const Center(child: Text('profile'),),
    SettingPage()
  ];

  changePage(int page){
    currentPage=page;
    if(currentPage==0){
      homeController.getAllProduct();
    }


    update();
  }

  @override
  void onInit() {
    super.onInit();
  }
}