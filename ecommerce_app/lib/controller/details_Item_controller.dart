



import 'package:ecommerce_app/data/data_local.dart';
import 'package:ecommerce_app/data/model/my_card.dart';
import 'package:ecommerce_app/res/routes/routes_name.dart';
import 'package:get/get.dart';

import '../data/model/Items.dart';

class ItemDetailsController extends GetxController{

  late Item item=Item();
  int count=0;
  bool isfound=false;



  addToCard(){
    MyCard myCard=MyCard(item: item,count: count);
    for(MyCard card in cardsApp) {
      if (card.item!.name == item.name) {
        isfound=true;
       card.count = count;
        break;
      }
    }
    if(isfound==false){
      myCard.count=count;
      cardsApp.add(myCard);
    }
  }
  goToMyCard(){
    Get.offNamed(RoutesName.MY_CARD_PAGE,);
  }


  increrment(){
    if(count>item.count!)
    Get.defaultDialog(title:'alert',middleText: 'the count grate than ${item.count}');
    else count++;
  update();
   }

  desincrement(){
    if(count>1)
      count--;
    update();
  }

  setCount(Item myItem){
    int mycount=1;
    for(MyCard card in cardsApp) {
      if (card.item!.name == myItem.name) {
       return card.count;
      }
    }
    return mycount;
  }


  @override
  void onInit() {
    item=Get.previousRoute==RoutesName.MY_CARD_PAGE?Get.arguments['card_item']:Get.arguments['item'];
   count=setCount(item);
    super.onInit();
  }
}