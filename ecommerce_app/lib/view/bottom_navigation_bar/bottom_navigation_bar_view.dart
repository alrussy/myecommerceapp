import 'package:ecommerce_app/controller/bottom_navigation_bar/bottom_navigation_bar_controller.dart';
import 'package:ecommerce_app/core/constant/route_app.dart';
import 'package:ecommerce_app/core/function/alert_exit_app.dart';
import 'package:ecommerce_app/core/service/service.dart';
import 'package:ecommerce_app/res/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/data_local.dart';

class BottomNavigationBarView extends StatelessWidget {
  BottomNavigationBarView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    ServiceApp serviceApp=Get.find();
    Get.put(BottomNavagationBarController());
    return WillPopScope(
      child: GetBuilder<BottomNavagationBarController>(
          builder: (ctrl) => Scaffold(
                floatingActionButton: FloatingActionButton(
                  child: Icon(Icons.shopping_cart_outlined),
                  onPressed: () {
                    //serviceApp.sharedPreferences.clear();
                    Get.toNamed(RouteApp.MY_CARD_PAGE);
                  },
                ),
                floatingActionButtonLocation:
                    FloatingActionButtonLocation.miniCenterDocked,
                bottomNavigationBar: BottomAppBar(
                  shape: CircularNotchedRectangle(),
                  notchMargin: 5,
                  child: Row(
                    children: [
                      ...List.generate(ctrl.listPage.length, (index) {
                        // int i=index>2?index-1:index;
                        return index == 2
                            ? Spacer()
                            : MaterialButton(
                                onPressed: () {
                                 ctrl.changePage(index);
                                },
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      botomNavBar.elementAt(index).icon,
                                      size: ctrl.currentPage == index ? 30 : 25,
                                      color: ctrl.currentPage == index
                                          ? AppColors.primary
                                          : Colors.black54,
                                    ),
                                    Text(
                                      '${botomNavBar.elementAt(index).name}',
                                      style: TextStyle(
                                          color: ctrl.currentPage == index
                                              ? AppColors.primary
                                              : Colors.black54),
                                    ),
                                  ],
                                ));
                      }),
                    ],
                  ),
                ),
                body: ctrl.listPage.elementAt(ctrl.currentPage),
              )),
      onWillPop: alertExitApp,
    );
  }
}
