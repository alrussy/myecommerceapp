


import 'package:ecommerce_app/core/class/handle_data_view.dart';
import 'package:ecommerce_app/core/class/status_request.dart';
import 'package:ecommerce_app/core/constant/route_app.dart';
import 'package:ecommerce_app/core/function/handling_data.dart';
import 'package:ecommerce_app/core/service/service.dart';
import 'package:ecommerce_app/data/model/Items.dart';
import 'package:ecommerce_app/data/model/category.dart';
import 'package:ecommerce_app/data/model/favorite.dart';
import 'package:ecommerce_app/data/model/product_model.dart';
import 'package:ecommerce_app/data/model/user_entity.dart';
import 'package:ecommerce_app/data/services/favorite_service.dart';
import 'package:ecommerce_app/data/services/home_service.dart';
import 'package:ecommerce_app/res/routes/routes_name.dart';
import 'package:get/get.dart';

class HomeController extends GetxController{

  ServiceApp serviceApp=Get.find();
  Favorite favorite=Favorite();
  User user=User();
 late String userName='';
  StatusRequest statusRequest=StatusRequest.NONE;
  List<Product>? product=[];
  List<Category>? category=[];
  List<Item>? items=[];
  bool isSearch=false;
  String value='';



  //===================================================
  int selectProd=0;
  int selectCat=0;

  HomeService homeService=HomeService(Get.find());



  changeSelectPro(int i){
    selectCat=0;
    selectProd=i;
    category=product![i].category;
    if(category!.length>0) {
      changeSelectCat(selectCat);
    } else {
      items=[];
    }

    update();

  }
  changeSelectCat(int i){
    selectCat=i;
    items=category![i].items;
    update();

  }

  getAllProduct()async {
    product!.clear();
    items!.clear();
    statusRequest = StatusRequest.LOADING;
    var res = await homeService.getAllProducts();
    statusRequest = handlingData(res);
    if(statusRequest==StatusRequest.SUCCESS){
      for(var p in res){
        product!.add(Product.fromJson(p));
        print(p);
      }

    }
    print(statusRequest);
    update();
  }


  List<Item> getAllItemByProduct(int index){
    List<Category> categoryByIndex=product![index].category!;
    final List<Item> allItems=[];
    for(Category cat in categoryByIndex){
      for(Item item in cat.items!) {
        allItems.add(item);
      }
    }
    return  allItems;
  }

  goToItemDetailsPage(Item item){
    Get.toNamed(RoutesName.ITEM_DETAILS_PAGE,arguments: {'item':item});
  }

  goToItemsByProductPage(Product product){
    Get.toNamed(RoutesName.ITEMS_BY_PRODUCT_PAGE,arguments: {'product':product});
  }

  goToFavoritePage(){
    Get.toNamed(RoutesName.FAVORITE_PAGE);
  }

  @override
  void onInit()async{
    await getAllProduct();
    userName=  serviceApp.sharedPreferences.getString('user_name')!;
    update();
    super.onInit();
  }

}





//   setIsSearch(){
//     items!.clear();
//     isSearch=true;
//     update();
//   }
//
//   onchangeSearch(String text){
//     value=text;
//   }
//
// onsearch(String val){
//     if(val.isEmpty){
//       isSearch=false;
//       getAllCategories();
//     }
//     else
//     getItemByName(val);
//     update();
// }
//   getItemByName(String name)async{
//     statusRequest=StatusRequest.LOADING;
//     var response=await itemData.getDataByName(name);
//     statusRequest=handlingData(response);
//     if(statusRequest==StatusRequest.SUCCESS){
//
//       for(var item in response)
//         items.add(Item.fromJson(item));    }
//     if(items.isEmpty){
//       statusRequest=StatusRequest.FAILURE;
//     }
//     update();
//   }
//
//   getAllCategories()async{
//     categories.clear();
//     isSearch=false;
//     statusRequest=StatusRequest.LOADING;
//     var response=await categoryData.getAllData();
//     statusRequest=handlingData(response);
//     if(statusRequest==StatusRequest.SUCCESS){
//       for(var cat in response)
//         categories.add(Category.fromJson(cat));
//     }
//     update();
//   }
//   goToItemPage(int id){
//     Get.toNamed(RouteApp.ITEM_PAGE,arguments:{'cat':categories,'selectedCat':id});
//   }
//   goToItemDetails(Item item){
//     Get.toNamed(RouteApp.ITEM_DETAILS_PAGE,arguments: {'item':item});
//     isSearch=false;
//     update();
//
//   }
