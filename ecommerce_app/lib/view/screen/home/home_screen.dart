// import 'package:ecommerce_app/controller/home_controller.dart';
// import 'package:ecommerce_app/controller/home/home_screen_controller.dart';
// import 'package:ecommerce_app/core/class/handle_data_view.dart';
// import 'package:ecommerce_app/core/constant/color_app.dart';
// import 'package:ecommerce_app/core/constant/fonts_app.dart';
// import 'package:ecommerce_app/core/constant/route_app.dart';
// import 'package:ecommerce_app/core/function/alert_exit_app.dart';
// import 'package:ecommerce_app/core/service/service.dart';
// import 'package:ecommerce_app/data/data_local.dart';
// import 'package:ecommerce_app/view/screen/home/home_page.dart';
// import 'package:ecommerce_app/view/widget/home/card_ads.dart';
// import 'package:ecommerce_app/view/widget/home/card_category.dart';
// import 'package:ecommerce_app/view/widget/home/card_recomemended.dart';
// import 'package:ecommerce_app/view/widget/home/search_and_notification.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// class HomeScreen extends StatelessWidget {
//   HomeScreen({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     Get.put(HomeScreenController());
//     return WillPopScope(
//       child: GetBuilder<HomeScreenController>(
//           builder: (ctrl) => Scaffold(
//                 floatingActionButton: FloatingActionButton(
//                   child: Icon(Icons.shopping_cart_outlined),
//                   onPressed: () {
//                     Get.toNamed(RouteApp.MY_CARD_PAGE);
//                   },
//                 ),
//                 floatingActionButtonLocation:
//                     FloatingActionButtonLocation.miniCenterDocked,
//                 bottomNavigationBar: BottomAppBar(
//                   shape: CircularNotchedRectangle(),
//                   notchMargin: 5,
//                   child: Row(
//                     children: [
//                       ...List.generate(ctrl.listPage.length, (index) {
//                         // int i=index>2?index-1:index;
//                         return index == 2
//                             ? Spacer()
//                             : MaterialButton(
//                                 onPressed: () {
//                                   ctrl.changePage(index);
//                                 },
//                                 child: Column(
//                                   mainAxisSize: MainAxisSize.min,
//                                   children: [
//                                     Icon(
//                                       botomNavBar.elementAt(index).icon,
//                                       size: ctrl.currentPage == index ? 30 : 25,
//                                       color: ctrl.currentPage == index
//                                           ? ColorApp.primary
//                                           : Colors.black54,
//                                     ),
//                                     Text(
//                                       '${botomNavBar.elementAt(index).name}',
//                                       style: TextStyle(
//                                           color: ctrl.currentPage == index
//                                               ? ColorApp.primary
//                                               : Colors.black54),
//                                     ),
//                                   ],
//                                 ));
//                       }),
//                     ],
//                   ),
//                 ),
//                 body: ctrl.listPage.elementAt(ctrl.currentPage),
//               )),
//       onWillPop: alertExitApp,
//     );
//   }
// }
