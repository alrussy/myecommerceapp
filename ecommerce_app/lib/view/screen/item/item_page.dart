// import 'package:ecommerce_app/controller/home_controller.dart';
// import 'package:ecommerce_app/controller/item_controller.dart';
// import 'package:ecommerce_app/core/class/handle_data_view.dart';
// import 'package:ecommerce_app/core/constant/fonts_app.dart';
// import 'package:ecommerce_app/data/model/Items.dart';
// import 'package:ecommerce_app/data/model/category.dart';
// import 'package:ecommerce_app/view/widget/home/card_ads.dart';
// import 'package:ecommerce_app/view/widget/home/card_category.dart';
// import 'package:ecommerce_app/view/widget/home/card_category_item.dart';
// import 'package:ecommerce_app/view/widget/home/card_item.dart';
// import 'package:ecommerce_app/view/widget/home/card_recomemended.dart';
// import 'package:ecommerce_app/view/widget/home/search_and_notification.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// class ItemPage extends StatelessWidget {
//   ItemPage({Key? key}) : super(key: key);
//   @override
//   Widget build(BuildContext context) {
//     Get.put(ItemController());
//     return Scaffold(
//       body:GetBuilder<ItemController>(builder: (controller)=>Padding(
//         padding: const EdgeInsets.only(top: 50),
//         child: ListView(
//             padding:const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
//             children: [
//               const SearchAndNotification(),
//               SizedBox(
//                 height: 60,
//                 child: ListView.builder(
//                   physics: const BouncingScrollPhysics(),
//                   scrollDirection: Axis.horizontal,
//                   itemCount: controller.categories.length,
//                   itemBuilder: (context,i)=> CardCategoryItem(category: controller.categories[i],),
//                 ),
//               ),
//               SizedBox(
//                 height: Get.height,
//                 child: GridView.builder(
//                   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                       crossAxisCount:2,mainAxisSpacing: 10,crossAxisSpacing: 10,childAspectRatio: 0.7),
//                   physics: const BouncingScrollPhysics(),
//                   scrollDirection: Axis.vertical,
//                   itemCount: controller.items.length,
//                   itemBuilder: (context,i)=>CardItems(item:controller.items[i],isFav:false),
//                 ),
//               ),
//
//             ]
//         ),
//       ),
//       )
//     );
//   }
// }
