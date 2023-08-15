



import 'package:ecommerce_app/core/class/status_request.dart';
import 'package:ecommerce_app/core/function/handling_data.dart';
import 'package:ecommerce_app/core/service/service.dart';
import 'package:ecommerce_app/data/model/my_card.dart';
import 'package:ecommerce_app/data/model/my_order.dart';
import 'package:ecommerce_app/data/services/order_service.dart';
import 'package:get/get.dart';

class OrdersController extends GetxController{

OrderService orderService=OrderService(Get.find());
List<MyOrder> orders=[];
ServiceApp serviceApp=Get.find();
StatusRequest statusRequest=StatusRequest.NONE;
int? index=-1;

getOrders()async{
  orders.clear();
  statusRequest=StatusRequest.LOADING;
  var response= await orderService.getOrdersByUser(serviceApp.sharedPreferences.getInt('user_id')!);
  statusRequest=handlingData(response);
  if(statusRequest==StatusRequest.SUCCESS) {
    for (var order in response) {
      orders.add(MyOrder.fromJson(order));
    }
    if (orders.isEmpty) {
      statusRequest = StatusRequest.NO_DATA;
    }
  }
  update();
}

showCard(int index){
  if(this.index==index)
    {
      this.index=-1;
    }
  else this.index=index;
  update();
}

getTotal(List<MyCard> cards){
  return  cards.fold<double>(
      0, (previousValue, element) => previousValue+element.item!.priceAfterDescount!*element.count!);
}
getTotalCard(MyCard card){
  return  card.item!.price! * card.count!;
}



String orderStateToString(int stateCode){
  switch (stateCode) {
    case 0:
      return 'pending';    // قيد الانتظار
    case 1:
      return 'preparing'; // جاري التحضير
    case 2:
      return 'is ready';// جاهز
    case 3:
      return 'delivering'; //قيد التسليم
    case 4:
      return 'sent delivered handed'; //تم التسليم
    default:return 'canceled';
  }
}
@override
  void onInit()async{
  await getOrders();
    super.onInit();
  }
}


