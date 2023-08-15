import 'package:ecommerce_app/core/class/status_request.dart';
import 'package:ecommerce_app/core/constant/route_app.dart';
import 'package:ecommerce_app/core/function/handling_data.dart';
import 'package:ecommerce_app/data/model/Items.dart';
import 'package:ecommerce_app/data/model/category.dart';
import 'package:ecommerce_app/data/model/product_model.dart';
import 'package:ecommerce_app/data/model/user_entity.dart';
import 'package:ecommerce_app/data/repository/repository.dart';
import 'package:ecommerce_app/data/services/home_service.dart';
import 'package:ecommerce_app/data/services/login_service.dart';
import 'package:ecommerce_app/res/routes/routes.dart';
import 'package:ecommerce_app/res/routes/routes_name.dart';
import 'package:ecommerce_app/res/url/url_app.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class TestController extends GetxController{
  StatusRequest statusRequest=StatusRequest.NONE;
 List<Product>? product=[];
  List<Category>? category=[];
  List<Item>? item=[];

  List<String> addresses=['Yemen','sadia','jordan'];

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
      item=[];
    }

    update();

  }
  changeSelectCat(int i){
    selectCat=i;
    item=category![i].items;
    update();

  }

  getData()async {

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
  remove(int index){
    addresses.removeAt(index);
    update();
  }
  removeAll(){
    Get.defaultDialog(
      title:'Warning',
      middleText: 'Do you went remove all address',
      onCancel:()=>false,
      onConfirm: (){addresses.clear();Get.back();update();},
    );
  }
  @override
  void onInit() {
super.onInit();
  }
}
