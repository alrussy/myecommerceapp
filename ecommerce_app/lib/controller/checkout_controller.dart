import 'package:ecommerce_app/controller/address_controller.dart';
import 'package:ecommerce_app/controller/card_controoler.dart';
import 'package:ecommerce_app/core/class/status_request.dart';
import 'package:ecommerce_app/core/function/handling_data.dart';
import 'package:ecommerce_app/core/service/service.dart';
import 'package:ecommerce_app/data/model/address.dart';
import 'package:ecommerce_app/data/model/my_card.dart';
import 'package:ecommerce_app/data/model/my_order.dart';
import 'package:ecommerce_app/data/model/user_entity.dart';
import 'package:ecommerce_app/data/services/chekout_servise.dart';
import 'package:ecommerce_app/res/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../res/colors/app_colors.dart';

class CheckOutController extends GetxController {
  AddressController addressController = Get.put(AddressController());
  ServiceApp serviceApp = Get.find();
  List<MyAddress> addresses = [];
  int? userId;
  StatusRequest statusRequest = StatusRequest.NONE;
  CheckoutService checkoutService = CheckoutService(Get.find());
  List<MyCard> cards = Get.arguments['cards'];
  double total = Get.arguments['total'];
  String paymentMethod = "cash";
  String deliveryType = "drive thru";
  int orderState=0;
  MyAddress address=MyAddress();
  Color background = AppColors.backgroundCard;
  Color textColor = Colors.black54;
  MyOrder? order;
  int index = -1;


  saveOrder() async {
    if(deliveryType=='delivery'&& (addresses.isEmpty||address.id==null)){
      if(addresses.isEmpty) {
        Get.defaultDialog(title: 'Error!',
            middleText: 'can not order..! you must add address',
            onConfirm: () => Get.back());
      }
      if(address.id==null){
        Get.defaultDialog(title: 'Error!',
            middleText: 'can not order..! you must chose address from list',
            onConfirm: () =>Get.back());
      }
      return;
    }

    order = MyOrder(
        user: User(id: serviceApp.sharedPreferences.getInt('user_id')),
        cards: cards,
        deliveryType: deliveryType,
        paymentMethod: paymentMethod,
        totalOrder: total,
      stateOrder:orderState,
      address: address,

    );
    statusRequest = StatusRequest.LOADING;
    var response = await checkoutService.saveOrder(order!);
    statusRequest = handlingData(response);
    if(response==1){
      cards.clear();
      Get.snackbar('Successful..!', 'the order is process');
      Get.offAllNamed(RoutesName.BOTTOM_NAVIGAITION_BAR_BAGE);
    }
  }

  changPaymentMethod(String paymentMethod) {
    this.paymentMethod = paymentMethod;
    print(paymentMethod);
    update();
  }

  changDeliveryType(String deliveryType) async {
    this.deliveryType = deliveryType;
    if (deliveryType == 'delivery') {
      await addressController.getAddress();
      addresses = addressController.addresses;
    }

    update();
  }

  setAddress(int index,MyAddress address) {
    this.index = index;
    if(address!=null){
      this.address=address;
    }


    background = AppColors.primary;
    update();
  }

  addAdress()async{
    await Get.toNamed(RoutesName.ADD_ADDRESS_PAGE);
    await addressController.getAddress();
    addresses = addressController.addresses;
    update();
  }
  @override
  void onInit() async {
    super.onInit();
  }
}
