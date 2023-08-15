import 'package:ecommerce_app/controller/home_controller.dart';
import 'package:ecommerce_app/controller/item_controller.dart';
import 'package:ecommerce_app/core/constant/color_app.dart';
import 'package:ecommerce_app/core/constant/fonts_app.dart';
import 'package:ecommerce_app/data/model/category.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class CardCategoryItem extends GetView<ItemController> {
  CardCategoryItem({Key? key,required this.category}) : super(key: key);
  final Category category;

  @override
  Widget build(BuildContext context) {
    return
      InkWell(
        onTap: (){
          //controller.selectCat(category);
        },
        onDoubleTap: (){
        } ,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            alignment: Alignment.center,
            child:Text('${category.name}',
              style: category.id==0?TextStyle(fontSize: 25,fontFamily: FontsApp.alkatra,color:ColorApp.primary):TextStyle(fontSize: 20,fontFamily: FontsApp.alkatra,color:Colors.black54),),
            margin: EdgeInsets.only(right:20),
            decoration:category.id==0? BoxDecoration(
              border:Border(bottom: BorderSide(color: ColorApp.primary,width: 3)),

            ):null,

          ),
        ),
      );
  }
}
