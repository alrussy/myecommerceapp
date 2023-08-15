import 'package:ecommerce_app/controller/favorite_controller.dart';
import 'package:ecommerce_app/controller/item_controller.dart';
import 'package:ecommerce_app/core/constant/color_app.dart';
import 'package:ecommerce_app/core/constant/fonts_app.dart';
import 'package:ecommerce_app/core/constant/image_assets.dart';
import 'package:ecommerce_app/data/model/Items.dart';
import 'package:ecommerce_app/data/model/favorite.dart';
import 'package:ecommerce_app/res/colors/app_colors.dart';
import 'package:ecommerce_app/res/fonts/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardItemFavorite extends GetView<FavoriteController> {
  CardItemFavorite({Key? key, required this.favorite}) : super(key: key);
  Favorite favorite;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: InkWell(
        onTap: () => controller.goToItemDetails(favorite.item!),
        child: Container(
            padding: EdgeInsets.only(top: 5, left: 8, right: 8),
            child: Column(
              children: [
                Image.network(
                  favorite.item!.image!,
                  fit: BoxFit.contain,
                  height: 150,
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  '${favorite.item!.name}',
                  style: TextStyle(
                      fontFamily: AppFonts.alkatra,
                      fontWeight: FontWeight.bold,
                    overflow: TextOverflow.ellipsis
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 12),
                  alignment: Alignment.centerLeft,
                  child: favorite.item!.desCount!>0?Text(
                    'Old price : ${favorite.item!.price} \$',
                    style: TextStyle(
                      color:Colors.red,
                      fontFamily: AppFonts.alkatra,
                      fontWeight: FontWeight.bold,
                      decoration:  TextDecoration.lineThrough,
                    ),
                  ):SizedBox.shrink(),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [

                    Text(
                      'Price : ${favorite.item!.priceAfterDescount} \$',
                      style: TextStyle(
                          color: AppColors.primary,
                          fontFamily: AppFonts.alkatra,
                          fontWeight: FontWeight.bold),
                    ),


                    IconButton(
                        onPressed: () {
                          controller.deleteFromFavorite(favorite);
                        },
                        icon: Icon(Icons.delete),
                        color: AppColors.primary)
                  ],
                )
              ],
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              // boxShadow: [
              //   BoxShadow(
              //     blurRadius: 28,
              //     offset: Offset(20,20),
              //   )
              // ],
            )),
      ),
    );
  }
}
