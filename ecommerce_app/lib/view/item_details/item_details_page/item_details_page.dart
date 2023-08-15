
import 'package:ecommerce_app/controller/details_Item_controller.dart';
import 'package:ecommerce_app/core/constant/color_app.dart';
import 'package:ecommerce_app/core/constant/fonts_app.dart';
import 'package:ecommerce_app/view/item_details/widget/add_button_widget.dart';
import 'package:ecommerce_app/view/item_details/widget/increment_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ItemDetailsPage extends StatelessWidget {
  const ItemDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ItemDetailsController itemDetailsController=Get.put(ItemDetailsController());
    return Scaffold(
      body: Column(
        children: [
          Container(

            margin: EdgeInsets.only(top: 60),
            height: 250,
            width: Get.width,
            decoration: BoxDecoration(color:Colors.white),
            child:  Hero(
              tag: {itemDetailsController.item.id},
              child: Image.network(
                '${itemDetailsController.item.image}',
                fit: BoxFit.scaleDown,

              ),
            ),
          ),

          Flexible(flex:0,
            child: Padding(
              padding: const EdgeInsets.only(right: 12.0,left:12,top:12 ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // ElevatedButton(onPressed: (){
                  //   itemDetailsController.goToMyCard();
                  // }, child:Icon(Icons.shopping_basket)),

    Text('${itemDetailsController.item.name}',
    style: TextStyle(fontSize: 30,fontFamily: FontsApp.alkatra,fontWeight: FontWeight.w400,color: ColorApp.text),),
                  SizedBox(
                    height: 120,
                    child: Column(
                      children: [
                        IncrementCount(),
                        GetBuilder<ItemDetailsController>(builder: (controller)=>
                            Text('You have ${itemDetailsController.count} in your card ${itemDetailsController.item.priceAfterDescount}\$',style: TextStyle(fontSize: 25,fontFamily: FontsApp.alkatra,fontWeight: FontWeight.w400,color: ColorApp.primary),)),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Divider(thickness: 2,color: ColorApp.primary,),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text('description',
                    style: TextStyle(
                        fontSize: 23,
                        fontFamily: FontsApp.alkatra,
                        fontWeight: FontWeight.w400,
                        color: ColorApp.primary),),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    itemDetailsController.item.descraption!,
                    style: TextStyle(
                        fontSize: 15,
                        fontFamily: FontsApp.alkatra,
                        fontWeight: FontWeight.w400,
                        color: ColorApp.text),
                    textAlign:TextAlign.start,
                  ),

                ),
              ],
            ),
          ),

          AddToCardButton(),
        SizedBox(height: 10,)
        ],

      ),
    );
  }
}
