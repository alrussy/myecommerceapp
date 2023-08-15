//
//
//
//
// import 'package:ecommerce_app/controller/home_controller.dart';
// import 'package:ecommerce_app/core/constant/color_app.dart';
// import 'package:ecommerce_app/core/constant/route_app.dart';
// import 'package:ecommerce_app/data/model/Items.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// Widget getSearchpage(List<Item> items,HomeController controller){
//     return
//       items==null||items.isEmpty
//           ?Text('no search')
//           : ListView(
//         shrinkWrap: true,
//         children: [
//           ...List.generate(items.length, (index) =>
//     InkWell(
//       onTap: (){
//         print(items[index].name);
//         controller.goToItemDetails(items[index]);
//       },
//       child: Container(
//         margin: const EdgeInsets.all(10.0),
//         decoration: BoxDecoration(
//             border: Border(bottom: BorderSide(width: 2,color: ColorApp.primary,))
//         ),
//         child: Row(
//           mainAxisSize: MainAxisSize.min,
//             children: [
//               Image.asset('assets/test/f.jpg',fit: BoxFit.fill,width: 100,height: 100,),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 15.0),
//                 child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text('${items[index].name}'),
//                       Text('${items[index].price}'),
//                     ]
//
//
//                 ),
//               )
//             ]
//         ),
//
//       ),
//     )
//   )
//
//
//
//   ],
//   );
//
// }