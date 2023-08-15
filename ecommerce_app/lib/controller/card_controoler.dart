


import 'package:ecommerce_app/core/constant/route_app.dart';
import 'package:ecommerce_app/data/data_local.dart';
import 'package:ecommerce_app/data/model/my_card.dart';
import 'package:ecommerce_app/data/model/Items.dart';
import 'package:ecommerce_app/res/routes/routes_name.dart';
import 'package:get/get.dart';

class CardController extends GetxController{

  List<MyCard> cards=cardsApp;


  goToItemDetailsPage(MyCard card){
    Get.offNamed(RouteApp.ITEM_DETAILS_PAGE,arguments: {'card_item':card.item});
  }
    increment(MyCard card){
      card.count=card.count!+1;
     update();
    }
    desIncrement(MyCard card){
      if(card.count==1)
        cards.remove(card);
        card.count = card.count! - 1;
      update();
    }

    goToCheckoutPage(){
    if(cards.isEmpty){
      Get.defaultDialog(title: 'Error!',
          middleText: 'can not order..!\n you must add item to card..',
          onConfirm: () =>Get.back());}
    else
    Get.toNamed(RoutesName.CHECKOUTE_PAGE,arguments: {'cards':cards,'total':getTotal()});
    }

    getTotal(){
return  cards.fold<double>(
    0, (previousValue, element) => previousValue+element.item!.priceAfterDescount!*element.count!);
    }
}