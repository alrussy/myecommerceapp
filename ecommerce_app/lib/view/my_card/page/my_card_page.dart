

import 'package:ecommerce_app/controller/card_controoler.dart';
import 'package:ecommerce_app/res/colors/app_colors.dart';
import 'package:ecommerce_app/view/my_card/widget/custom_List_tile.dart';
import 'package:ecommerce_app/view/my_card/widget/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../res/fonts/app_fonts.dart';
import '../widget/order_button_widget.dart';

class MyCardPage extends StatelessWidget {
  const MyCardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CardController controller=Get.put(CardController());
    return Scaffold(body: SafeArea(
      child:GetBuilder<CardController>(builder: (controller)=>
        Column(
        children: [
         CustomAppBar(),
          Expanded(
            child: ListView.builder(
              itemCount: controller.cards.length,
              itemBuilder: (context,index)=>CustomListTile( card:controller.cards[index])
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: Divider(color: AppColors.primary,thickness: 2),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('Total Of Order :',style: TextStyle(fontSize: 20,fontFamily: AppFonts.alkatra),),
                Text('${controller.getTotal()}',style: TextStyle(color:AppColors.primary,fontSize: 20,fontFamily: AppFonts.alkatra),)

              ],
            ),
          ),
          ChaeckButton(onPressed: (){
            controller.goToCheckoutPage();
          }),
          SizedBox(
            height: 10,
          )

        ],
      )
    )
    )
    );
  }
}
