

import 'package:ecommerce_app/core/class/status_request.dart';
import 'package:ecommerce_app/core/function/handling_data.dart';
import 'package:ecommerce_app/core/service/service.dart';
import 'package:ecommerce_app/data/model/address.dart';
import 'package:ecommerce_app/data/services/address_service.dart';
import 'package:ecommerce_app/res/routes/routes.dart';
import 'package:ecommerce_app/res/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressController extends GetxController{
StatusRequest statusRequest=StatusRequest.NONE;
AddressService addressService=AddressService(Get.find());
ServiceApp serviceApp=Get.find();
List<MyAddress> addresses=[];
int? userId;

getAddress()async{
  addresses=[];
  statusRequest=StatusRequest.LOADING;
  var response=await addressService
      .getAddressByUser(serviceApp.sharedPreferences.getInt('user_id')!);
  statusRequest=handlingData(response);
  if(statusRequest==StatusRequest.SUCCESS){
    for(var address in response) {
      addresses.add(MyAddress.fromJson(address));
    }
    if(addresses.isEmpty)
      statusRequest=StatusRequest.NO_DATA;
  }
  update();
}

remove(int index)async{
  var respnse=await addressService.deleteAddress(addresses.elementAt(index));
  addresses.removeAt(index);
  update();
}
removeAll(){
  Get.defaultDialog(
    title:'Warning',
    middleText: 'Do yoo went remove all address',
    onCancel:()=>false,
    onConfirm: (){addresses.clear();Get.back();update();},
  );
}
  @override
  void onInit() async{
  // userId=serviceApp.sharedPreferences.getInt('id')!;
 await getAddress();
    super.onInit();
  }

  void goToAddAddress() {
  Get.offAndToNamed(RoutesName.ADD_ADDRESS_PAGE);
  }
}