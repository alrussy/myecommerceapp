
import 'package:ecommerce_app/controller/details_Item_controller.dart';
import 'package:ecommerce_app/core/constant/color_app.dart';
import 'package:ecommerce_app/core/constant/fonts_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class IncrementCount extends StatelessWidget {
  const IncrementCount({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ItemDetailsController>(builder:(controller)=> Row(

      children: [
        InkWell(
          onTap:(){
            controller.increrment();
          },
          radius: 5,
          borderRadius: BorderRadius.circular(50),
          focusColor: Colors.white,
          enableFeedback:false ,
          child: Container(
            width: 40,
            height: 60,
            margin: EdgeInsets.symmetric(horizontal: 20),
            decoration:BoxDecoration(
              border: Border.all(color: ColorApp.text,width: 2),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text('+',
                style: TextStyle(fontSize: 35,fontFamily: FontsApp.alkatra,fontWeight: FontWeight.bold,color: ColorApp.text),),
            ),
          ),
        ),
        Container(
            width: 90,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border.all(color: ColorApp.text,width: 2),

            ),
            child: Center(child: Text('${controller.count}',
              style: TextStyle(
                  fontSize: 25,
                  fontFamily: FontsApp.alkatra,
                  fontWeight: FontWeight.w400,color: ColorApp.text),))),
        InkWell(
          onTap:(){
            controller.desincrement();
          },
          radius: 15,
          borderRadius: BorderRadius.circular(50),
          focusColor: Colors.white,
          enableFeedback:false ,
          child: Container(
            width: 40,
            height: 60,
            margin: EdgeInsets.symmetric(horizontal: 20),
            decoration:BoxDecoration(
              border: Border.all(color: ColorApp.text,width: 2),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text('-',
                style: TextStyle(fontSize: 35,fontFamily: FontsApp.alkatra,fontWeight: FontWeight.bold,color: ColorApp.text),),
            ),
          ),
        ),
      ],
    )
    );
  }
}
