// import 'package:ecommerce_app/controller/home_controller.dart';
// import 'package:ecommerce_app/core/class/handle_data_view.dart';
// import 'package:ecommerce_app/core/constant/fonts_app.dart';
// import 'package:ecommerce_app/view/widget/home/card_ads.dart';
// import 'package:ecommerce_app/view/widget/home/card_category.dart';
// import 'package:ecommerce_app/view/widget/home/card_recomemended.dart';
// import 'package:ecommerce_app/view/widget/home/search_and_notification.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import '../../search/search_widget.dart';
//
// class HomePage extends StatelessWidget {
//   HomePage({Key? key}) : super(key: key);
//   final HomeController homeController=Get.put(HomeController());
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: GetBuilder<HomeController>(builder: (controller)=>
//
//           HandlingDataview(
//             statusRequest:controller.statusRequest,
//             widget: Padding(
//               padding: const EdgeInsets.only(top: 50),
//               child: ListView(
//                   padding:const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
//                   children: [
//                     const SearchAndNotification(),
//                !controller.isSearch?Column(
//                       mainAxisSize: MainAxisSize.min,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         const CardAds(),
//                         SizedBox(
//                           height: 130,
//                           child: ListView.builder(
//                             physics: const BouncingScrollPhysics(),
//                             scrollDirection: Axis.horizontal,
//                             itemCount: controller.categories.length,
//                             itemBuilder: (context,i)=> CardCategory(category: controller.categories[i],),
//                           ),
//                         ),
//                         const Divider(thickness: 1,color: Colors.red,),
//
//                         const Text('New',style: TextStyle(fontSize: 20,fontFamily: FontsApp.alkatra),),
//                         SizedBox(
//                           height: 150,
//                           child: ListView.builder(
//                             scrollDirection: Axis.horizontal,
//                             padding: const EdgeInsets.only(top: 20),
//                             shrinkWrap: true,
//                             physics: const BouncingScrollPhysics(),
//                             itemCount: 5,
//                             itemBuilder: (context,i)=>  CardRecommended(),
//                           ),
//                         ),
//
//                         const Text('Recommended',style: TextStyle(fontSize: 20,fontFamily: FontsApp.alkatra),),
//                         SizedBox(
//                           height: 150,
//                           child: ListView.builder(
//                             scrollDirection: Axis.horizontal,
//                             padding: const EdgeInsets.only(top: 20),
//                             shrinkWrap: true,
//                             physics: const BouncingScrollPhysics(),
//                             itemCount: 5,
//                             itemBuilder: (context,i)=>  CardRecommended(),
//                           ),
//                         ),
//
//                       ],
//                     ):getSearchpage(controller.items,controller),
//                   ]
//               ),
//
//             ),
//           )
//       ),
//     );
//   }
// }
