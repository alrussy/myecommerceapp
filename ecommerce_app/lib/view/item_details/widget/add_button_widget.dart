
import 'package:ecommerce_app/controller/details_Item_controller.dart';
import 'package:ecommerce_app/res/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';




class AddToCardButton extends GetView<ItemDetailsController> {
  const AddToCardButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: (){
      controller.addToCard();
      controller.goToMyCard();
    },
        style:ButtonStyle(
          fixedSize: MaterialStatePropertyAll(Size(Get.width-30,40)),
          backgroundColor: MaterialStatePropertyAll(AppColors.primary),
        )  ,
        child: Text('add to card',style: TextStyle(fontSize: 20),))
    ;
  }
}
