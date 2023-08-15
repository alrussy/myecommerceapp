



import 'package:ecommerce_app/core/class/status_request.dart';
import 'package:ecommerce_app/core/function/handling_data.dart';
import 'package:ecommerce_app/core/service/service.dart';
import 'package:ecommerce_app/data/model/Items.dart';
import 'package:ecommerce_app/data/model/favorite.dart';
import 'package:ecommerce_app/data/model/user_entity.dart';
import 'package:ecommerce_app/data/services/favorite_service.dart';
import 'package:ecommerce_app/res/routes/routes_name.dart';
import 'package:get/get.dart';

class FavoriteController extends GetxController{
  ServiceApp serviceApp=Get.find();
  FavoriteService favoriteService=FavoriteService(Get.find());
  StatusRequest statusRequest=StatusRequest.NONE;
  late List<Favorite> myFavorite=[];

saveItemInFavorite(int itemId)async{
  Favorite favorite=Favorite(item: Item(id: itemId),
      user: User(id:serviceApp.sharedPreferences.getInt('user_id')));
  favoriteService.saveFavorite(favorite);
}

getFavoriteItem()async{
  myFavorite=[];
  statusRequest=StatusRequest.LOADING;
  var response=await favoriteService.getDataByUser(serviceApp.sharedPreferences.getInt('user_id')!);
  statusRequest=handlingData(response);
  if(statusRequest==StatusRequest.SUCCESS){
    for(var favorite in response) {
      myFavorite.add(Favorite.fromJson(favorite));
    }
    if(myFavorite.isEmpty)
      statusRequest=StatusRequest.FAILURE;
    }
  update();
}

deleteFromFavorite(Favorite favorite)async{
  print('delete');
  myFavorite.remove(favorite);
Favorite f=Favorite(item: favorite.item,user: User(id:serviceApp.sharedPreferences.getInt('user_id')));
  update();
  await favoriteService.deleteFavorite(f);
}

goToItemDetails(Item item){
  Get.offNamed(RoutesName.ITEM_DETAILS_PAGE,arguments: {'item':item});
}
goToHomePage(){
  Get.offNamed(RoutesName.BOTTOM_NAVIGAITION_BAR_BAGE);

}

@override
  void onInit()async{
  await getFavoriteItem();
    super.onInit();
  }
}