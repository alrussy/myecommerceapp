// import 'package:ecommerce_app/controller/home_controller.dart';
// import 'package:ecommerce_app/core/constant/color_app.dart';
// import 'package:ecommerce_app/core/constant/fonts_app.dart';
// import 'package:ecommerce_app/data/model/category.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// class CardCategory extends GetView<HomeController> {
//    CardCategory( {Key? key,required this.category}) : super(key: key);
//   final Category category;
//   @override
//   Widget build(BuildContext context) {
//     return
//       InkWell(
//         onTap: (){
//           controller.goToItemPage(category.id!);
//           print(category.id);
//         },
//         child: Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Container(
//                 alignment: Alignment.center,
//
//                 child: Icon(Icons.camera_alt_sharp,color: Color(0xffd71c55),size: 50,),
//                 width:70,
//                 height: 70,
//                 margin: EdgeInsets.symmetric(vertical:5),
//                 decoration: BoxDecoration(
//                   color:Color(0xaaecb5c2) ,
//                   border:Border.all(color: ColorApp.primary,width: 3),
//                   borderRadius: BorderRadius.circular(20),
//                 ),
//
//               ),
//               Text('${category.name}',style: TextStyle(
//                   fontSize: 18,fontFamily: FontsApp.alkatra,color:Colors.black87),)
//             ],
//           ),
//         ),
//       );
//   }
// }
