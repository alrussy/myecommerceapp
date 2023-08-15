//
// import 'package:ecommerce_app/controller/home_controller.dart';
// import 'package:ecommerce_app/core/constant/color_app.dart';
// import 'package:ecommerce_app/core/constant/route_app.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// class SearchAndNotification extends GetView<HomeController> {
//   const SearchAndNotification({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       crossAxisAlignment: CrossAxisAlignment.center,
//       children: [
//         Expanded(
//           child: TextFormField(
//             onTap: (){
//               controller.setIsSearch();
//               print('you are press');
//             },
//             onFieldSubmitted: (value) => controller.onsearch(value),
//             onChanged:(value) => controller.onchangeSearch(value),
//             style: TextStyle(fontSize: 16),
//             cursorColor: ColorApp.primary,
//             decoration: InputDecoration(
//               isDense: true,
//               contentPadding: EdgeInsets.zero,
//               hintText: 'search',
//               hintStyle: TextStyle(fontSize: 16),
//               prefixIcon:IconButton(
//                 icon:Icon(
//                   Icons.search_outlined,
//                   size: 25,
//                   color:  ColorApp.primary,),
//                 onPressed: () {
//                   controller.onsearch(controller.value);
//                 },),
//               filled: true,
//               fillColor: Colors.grey[200],
//               border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide.none
//               ),
//
//             ),
//           ),
//         ),
//         // SizedBox(width: 10,),
//         // Container(
//         //   padding: EdgeInsets.all(5),
//         //   decoration: BoxDecoration(
//         //       borderRadius: BorderRadius.circular(10),
//         //       color: Colors.grey[200]
//         //   ),
//         //   child:IconButton(icon:Icon(Icons.notifications_active_outlined,size: 35,color: ColorApp.primary,),
//         //     onPressed: () {
//         //     },),
//         // ),
//
//       ],
//     );
//   }
// }
