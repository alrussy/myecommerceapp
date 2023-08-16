import 'package:ecommerce_app/controller/item_controller.dart';
import 'package:ecommerce_app/data/model/Items.dart';
import 'package:ecommerce_app/res/fonts/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../res/colors/app_colors.dart';

class CardItems extends GetView<ItemController> {
  CardItems({Key? key,required this.item,required this.isFav}) : super(key: key);
  Item item;
  bool isFav;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
       // controller.goToDetailsPage(item);
      },
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Container(
              padding: EdgeInsets.only(top: 10,left: 8,right: 8),
                child: Column(
                  children: [
                    Hero(
                      tag: {item.id},
                      child: Image.asset(
                        'assets/test/f.jpg',
                        fit: BoxFit.fill,
                      ),
                    ),
                    SizedBox(height: 10,),
                    Text('${item.name}',style: TextStyle(fontFamily: AppFonts.alkatra,fontWeight: FontWeight.bold),),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        item.desCount!=0?Column(
                          children: [
                            Text(
                              '${item.price} \$',
                              style: TextStyle(
                                  color:AppColors.primary,
                                  fontFamily: AppFonts.alkatra,fontWeight: FontWeight.w300,
                                decoration: TextDecoration.lineThrough
                              ),
                            ),
                            Text('${item.priceAfterDescount} \$',style: TextStyle(color:AppColors.primary,fontFamily: AppFonts.alkatra,fontWeight: FontWeight.bold),),

                          ],
                        ):Text(
                          '${item.price} \$',
                          style: TextStyle(color:AppColors.primary,fontFamily: AppFonts.alkatra,fontWeight: FontWeight.bold),),
                        IconButton(onPressed: (){
                          //controller.checkFavorite(item);
                        }, icon: Icon(item.isFavorite?Icons.favorite:Icons.favorite_border_outlined) ,color: AppColors.primary)
                      ],
                    )
                  ],
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      blurRadius: 10,
                      offset: Offset(5,1),
                    )
                  ],
                )),
          ),

         item.desCount!=0?Positioned(
            left:0,
            top: 0,
            child: CircleAvatar(
              radius: 25,
              backgroundColor: AppColors.primary,
              child: Text('${item.desCount!.toInt()}%',style: TextStyle(fontSize:15,fontWeight:FontWeight.bold,color: Colors.white),),

            ),
          ):SizedBox.shrink(),
        ],
      ),
    );
  }
}
