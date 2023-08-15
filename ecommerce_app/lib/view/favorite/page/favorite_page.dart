import 'package:ecommerce_app/controller/favorite_controller.dart';
import 'package:ecommerce_app/controller/home_controller.dart';
import 'package:ecommerce_app/controller/item_controller.dart';
import 'package:ecommerce_app/core/class/handle_data_view.dart';
import 'package:ecommerce_app/core/constant/fonts_app.dart';
import 'package:ecommerce_app/data/model/Items.dart';
import 'package:ecommerce_app/data/model/category.dart';
import 'package:ecommerce_app/res/routes/routes_name.dart';
import 'package:ecommerce_app/view/favorite/widget/card_item_favorite.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:GetBuilder<FavoriteController>(
          init: FavoriteController(),
          builder: (controller)=>
          HandlingDataview(statusRequest: controller.statusRequest,
            widget: Padding(
            padding: const EdgeInsets.only(top: 50),
            child: ListView(
                padding:const EdgeInsets.symmetric(vertical: 10,horizontal: 10),
                children: [
                  customHead(controller),
                  customSearch(),
                  SizedBox(
                    height: Get.height,
                    child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount:2,mainAxisSpacing: 10,crossAxisSpacing: 10,childAspectRatio: 0.7),
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.vertical,
                      itemCount: controller.myFavorite.length,
                      itemBuilder: (context,i)=>CardItemFavorite(favorite:controller.myFavorite[i]!),
                    ),
                  ),

                ]
            ),
          ),
          )

      )
    );
  }



  customHead(FavoriteController controller) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text('Favorite',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
        ),
        Spacer(),
        IconButton(onPressed: () {},
          icon: Icon(Icons.shopping_basket_outlined, color: Colors.black54,),
          iconSize: 30,),
        IconButton(onPressed: () {
          controller.goToHomePage();
        },
          icon: Icon(
            Icons.home_outlined, color: Colors.black54,),
          iconSize: 30,)

      ],
    );
  }


  customSearch() {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.only(right: 5),
          child: IconButton(
            onPressed: () {}, icon: Icon(Icons.search_outlined, size: 25),),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey.shade200
          ),
        ),
        Flexible(
          child: TextField(
            style: TextStyle(fontSize: 20, fontFamily: FontsApp.alkatra),
            decoration: InputDecoration(
              hintText: 'Search',
              hintStyle: TextStyle(color: Colors.black45),
              border: OutlineInputBorder(borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(10)),
              filled: true,
              fillColor: Colors.grey.shade200,
              contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              isDense: true,

            ),
          ),
        )
      ],
    );
  }

}
