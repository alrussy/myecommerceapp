import 'package:ecommerce_app/controller/checkout_controller.dart';
import 'package:ecommerce_app/core/constant/color_app.dart';
import 'package:ecommerce_app/core/constant/fonts_app.dart';
import 'package:ecommerce_app/res/colors/app_colors.dart';
import 'package:ecommerce_app/res/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class CheckOutPage extends StatelessWidget {
  const CheckOutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(CheckOutController());
    return Scaffold(
        appBar: AppBar(
          title: Text('Checkout'),
          titleTextStyle: TextStyle(
              fontSize: 25,
              fontFamily: FontsApp.alkatra,
              color: ColorApp.backgroundOnBoarding),
          centerTitle: true,
          backgroundColor: AppColors.primary,
        ),
        body: GetBuilder<CheckOutController>(builder: (controller) {
          return Column(children: [
            Expanded(
                child: ListView(
              padding: EdgeInsets.all(10),
              children: [
                const Text(
                  'Chose Payment method :',
                  style: TextStyle(fontSize: 20, fontFamily: FontsApp.alkatra),
                ),
                Row(
                  children: [
                    RadioMenuButton(
                      value: "cash",
                      onChanged: (val) {
                        controller.changPaymentMethod(val!);
                      },
                      groupValue: controller.paymentMethod,
                      child: Text('Cash'),
                    ),
                    RadioMenuButton(
                      value: 'payment card',
                      onChanged: (val) {
                        controller.changPaymentMethod(val!);
                      },
                      groupValue: controller.paymentMethod,
                      child: Text('Payment Card'),
                    ),
                  ],
                ),
                const Text(
                  'Chose Delivery Type :',
                  style: TextStyle(fontSize: 20, fontFamily: FontsApp.alkatra),
                ),
                Row(
                  children: [
                    RadioMenuButton(
                      value: 'drive thru',
                      onChanged: (val) {
                        controller.changDeliveryType(val!);
                      },
                      groupValue: controller.deliveryType,
                      child: Text('Drive Thru'),
                    ),
                    RadioMenuButton(
                      value: 'delivery',
                      onChanged: (val) {
                        controller.changDeliveryType(val!);
                      },
                      groupValue: controller.deliveryType,
                      child: Text('Delivery'),
                    ),
                  ]
                ),
                controller.deliveryType == 'delivery'&& controller.addresses.isNotEmpty
                    ? ListView.builder(
                        shrinkWrap: true,
                        itemCount: controller.addresses.length,
                        itemBuilder: (context, i) {
                          return Card(
                            child: ListTile(
                              title:Text(controller.addresses[i].name!) ,
                              subtitle: Text('${controller.addresses[i].city!}-${controller.addresses[i].region!}'
                                  '-${controller.addresses[i].street!}'),
                              onTap: (){
                               controller.setAddress(i,controller.addresses[i]);
                              },
                            ),
                            color: i==controller.index?controller.background:Colors.white,
                          ) ;
                        })
                    :controller.deliveryType == 'delivery'&&controller.addresses.isEmpty
                    ? Padding(
                      padding: const EdgeInsets.only(top: 100.0),
                      child: Center(child: TextButton(
                          child: Text('+ Add Address From Here',style: TextStyle(decoration: TextDecoration.underline,color: Colors.grey.shade600,fontSize: 18),),
                        onPressed: ()=>controller.addAdress()

                      )),
                    ):SizedBox.shrink(),

              ],
            )
            ),
            ElevatedButton(
                onPressed: () {
                  controller.saveOrder();
                },
                style: ButtonStyle(
                  fixedSize:
                  MaterialStatePropertyAll(Size(Get.width - 30, 40)),
                  backgroundColor:
                  MaterialStatePropertyAll(AppColors.primary),
                ),
                child: Text(
                  'Order',
                  style: TextStyle(fontSize: 20),
                )
            ),
          ]);
        }));
  }
}
