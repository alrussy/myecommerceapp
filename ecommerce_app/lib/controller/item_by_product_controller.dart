



import 'package:ecommerce_app/core/service/service.dart';
import 'package:ecommerce_app/data/model/Items.dart';
import 'package:ecommerce_app/data/model/category.dart';
import 'package:ecommerce_app/data/model/favorite.dart';
import 'package:ecommerce_app/data/model/product_model.dart';
import 'package:ecommerce_app/data/model/user_entity.dart';
import 'package:ecommerce_app/data/services/favorite_service.dart';
import 'package:ecommerce_app/res/routes/routes_name.dart';
import 'package:get/get.dart';

class ItemsByProductController extends GetxController{

ServiceApp serviceApp=Get.find();
  Product product=Product();
  List<Category> categories=[];
  Category category=Category();
  List<Item> items=[];

  Favorite favorite=Favorite();

  int selectCat = 0;

  FavoriteService favoriteService=FavoriteService(Get.find());
  late int idUser;

  setIsFavorite(Item item)async{
   item.isFavorite= !item.isFavorite;
   setFavorite(item);
   update();
 }



  setFavorite(Item item)async{
    favorite=Favorite(item: item,
        user: User(id:idUser));
    if (item.isFavorite) {
      favoriteService.saveFavorite(favorite);
    }
    else {
      favoriteService.deleteFavorite(favorite);
    }
  }


  void changeSelectCat(int index)async{
    selectCat=index;
    category=categories[index];
    //items=categories[index].items!;
    checkItemIsFavorite(category);

  }


 checkItemIsFavorite(Category category)async{
    items.clear();
    for(Item item in category.items!){
     var res= await favoriteService.checkItemIsFavorite(Favorite(item: item,user: User(id: idUser)));
      if(res>0){
        item.isFavorite = true;
        print(item.isFavorite);
      }
      else{
        print('false');
      item.isFavorite = false;
      }
      items.add(item);
    }
    update();

 }
void gotToHomePage() {
  Get.offAllNamed(RoutesName.BOTTOM_NAVIGAITION_BAR_BAGE);
}


goToItemDetails(int index){
    Get.toNamed(RoutesName.ITEM_DETAILS_PAGE,arguments: {'item':items[index]});

}

  @override
  void onInit()async{
product= Get.arguments['product'];
categories=product.category!;
category=categories[0];
idUser=serviceApp.sharedPreferences.getInt('user_id')!;
checkItemIsFavorite(category);
    super.onInit();
  }


}