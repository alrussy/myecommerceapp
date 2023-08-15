

import 'package:ecommerce_app/controller/orders_controller.dart';
import 'package:ecommerce_app/core/class/handle_data_view.dart';
import 'package:ecommerce_app/data/model/my_order.dart';
import 'package:ecommerce_app/res/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class OrderPage extends StatelessWidget {
  const OrderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(OrdersController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(onPressed: (){
          Get.back();
        },icon: Icon(Icons.arrow_back,color: AppColors.primary,),),
        title: Text('Orders',style: TextStyle(fontSize:25,color: AppColors.primary),),
        centerTitle: true,
        elevation: 0,
      ),
      body: GetBuilder<OrdersController>
        (builder: (controller)=>HandlingDatRequest(
          statusRequest: controller.statusRequest,widget:ListView(
        children: [
         ... List.generate(controller.orders.length, (index) =>
             Padding(
               padding: const EdgeInsets.symmetric(horizontal: 10.0),
               child: Column(

                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Text('Order ID : ${controller.orders[index].id}'),
                   Text('Payment Method  : ${controller.orders[index].paymentMethod}'),
                   Text('Delivery Type : ${controller.orders[index].deliveryType}'),
                   Text('Total Order : ${controller.orders[index].totalOrder}'),

                  controller.orders[index].deliveryType=='delivery'
                      ? Text('Address: ${controller.orders[index].address.toString()}')
                      :SizedBox.shrink(),
                   Text('Order State :'+controller.orderStateToString(controller.orders[index].stateOrder!)),
                   TextButton(onPressed: (){
                     controller.showCard(index);
                   },
                     child: index==controller.index?Text('<<< Hade Card'):Text('Show Card >>>'),
                   ),
                   index==controller.index?getCards(index):SizedBox.shrink(),
                   Divider(thickness: 1,)

                 ],
               ),
             )

             )
        ],

      )
      )
      ),
    );
  }
}
getCards(int index){
  OrdersController ordersController=Get.find();
 return Column(
     children: [
  ... List.generate(ordersController.orders[index].cards!.length, (index1) =>
  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
  child: Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
  Text(' Item : ${ordersController.orders[index].cards![index1].item!.name}'),
  Text(' price : ${ordersController.orders[index].cards![index1].item!.price}'),
  Text('count  : ${ordersController.orders[index].cards![index1].count}'),
    Text('total  : ${ordersController.getTotalCard(ordersController.orders[index].cards![index1])}'),
    Divider(thickness: 1,color: Colors.red,)
  ]
  )
  )
  )
]
 );
}