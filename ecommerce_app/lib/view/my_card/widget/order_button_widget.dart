
import 'package:ecommerce_app/res/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class ChaeckButton extends StatelessWidget {
  ChaeckButton({Key? key, this.onPressed}) : super(key: key);
   Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed:onPressed,
        style:ButtonStyle(
          fixedSize: MaterialStatePropertyAll(Size(Get.width-30,40)),
          backgroundColor: MaterialStatePropertyAll(AppColors.primary),
        )  ,
        child: Text('Checkout',style: TextStyle(fontSize: 20),))
    ;
  }
}
