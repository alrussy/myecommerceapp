
import 'package:ecommerce_app/controller/details_Item_controller.dart';
import 'package:ecommerce_app/res/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../res/fonts/app_fonts.dart';


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
              border: Border.all(color: AppColors.text,width: 2),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text('+',
                style: TextStyle(fontSize: 35,fontFamily: AppFonts.alkatra,fontWeight: FontWeight.bold,color: AppColors.text),),
            ),
          ),
        ),
        Container(
            width: 90,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border.all(color: AppColors.text,width: 2),

            ),
            child: Center(child: Text('${controller.count}',
              style: TextStyle(
                  fontSize: 25,
                  fontFamily: AppFonts.alkatra,
                  fontWeight: FontWeight.w400,color: AppColors.text),))),
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
              border: Border.all(color: AppColors.text,width: 2),
              shape: BoxShape.circle,
            ),
            child: Center(
              child: Text('-',
                style: TextStyle(fontSize: 35,fontFamily: AppFonts.alkatra,fontWeight: FontWeight.bold,color: AppColors.text),),
            ),
          ),
        ),
      ],
    )
    );
  }
}
