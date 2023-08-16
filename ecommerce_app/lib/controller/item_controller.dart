

import 'package:ecommerce_app/core/class/status_request.dart';
import 'package:ecommerce_app/core/function/handling_data.dart';
import 'package:ecommerce_app/core/service/service.dart';
import 'package:ecommerce_app/data/model/Items.dart';
import 'package:ecommerce_app/data/model/category.dart';
import 'package:ecommerce_app/data/model/favorite.dart';
import 'package:ecommerce_app/data/model/user_entity.dart';
import 'package:ecommerce_app/view/item_details/item_details_page/item_details_page.dart';
import 'package:get/get.dart';

class ItemController extends GetxController{
/*
  ItemData itemData=ItemData(Get.find());
  StatusRequest statusRequest=StatusRequest.NONE;
  FavoriteData favoriteData=FavoriteData(Get.find());
  late List<Category> categories;
  late Category category;
  List<Item> items=[];
  int? selectedCat;
  ServiceApp serviceApp=Get.find();
  Favorite favorite = Favorite();
  late Item item;
  bool f=false;


  initData()async{
    categories=Get.arguments['cat'];
    selectedCat=Get.arguments['selectedCat'];
    await checkCat();
  }

  checkFavorite(item)async{
    // print(serviceApp.sharedPreferences.getInt('id'));
     favorite=Favorite(item: Item(id: item.id),
        user: User(id:1));
        if (!item.isFavorite) {
          item.isFavorite = true;
           favoriteData.saveFavorite(favorite);
        }
        else {
          item.isFavorite=false;
          favoriteData.deleteFavorite(favorite);
        }
        update();
  }


  selectCat(Category catSelected)async{
    items.clear();
    selectedCat=catSelected.id;
    category=catSelected;
    if(category!=null)
      await getItem();
  }
  getItem()async{
    items.clear();
    statusRequest=StatusRequest.LOADING;
    var response=await itemData.getDataByCatId(selectedCat!);
    statusRequest=handlingData(response);
    if(statusRequest==StatusRequest.SUCCESS){
      for(var i in response) {
        Item item=Item.fromJson(i);
        items.add(item);
         favorite = Favorite(item: Item(id:item.id),
            user: User(id: 1));
        if (await favoriteData.checkItemIsFavorite(favorite) > 0) {
          item.isFavorite = true;
        }
        else
          item.isFavorite = false;
      }
    }
    update();

  }

  checkCat()async{
    categories.forEach((cat) {
      if(cat.id==selectedCat) {
        category = cat;
      }
    });
        if(category!=null) {
          await getItem();
        }
      }

      goToDetailsPage(Item item){
    Get.toNamed(RouteApp.ITEM_DETAILS_PAGE,arguments:{'item':item});
      }
      double getPriceAfterDescount(double price,int descount){
    double p=price-(price*descount/100);
    return p;
      }
  @override
  void onInit()async {
    await initData();
    super.onInit();
  }
*/

}
