





import 'package:ecommerce_app/core/class/status_request.dart';
import 'package:ecommerce_app/core/constant/route_app.dart';
import 'package:ecommerce_app/core/function/handling_data.dart';
import 'package:ecommerce_app/core/service/service.dart';
import 'package:ecommerce_app/data/model/address.dart';
import 'package:ecommerce_app/data/model/user_entity.dart';
import 'package:ecommerce_app/data/response/api_response.dart';
import 'package:ecommerce_app/data/services/address_service.dart';
import 'package:ecommerce_app/res/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddAddressController extends GetxController{

  StatusRequest statusRequest=StatusRequest.NONE;

  AddressService addressService=AddressService(Get.find());
  ServiceApp serviceApp=Get.find();
  bool isEnable=false;

  TextEditingController nameController=TextEditingController();
  TextEditingController cityController=TextEditingController();
  TextEditingController regionController=TextEditingController();
  TextEditingController streetController=TextEditingController();
  TextEditingController otherController=TextEditingController();
  String name='';
  String city='';
  String region='';
  String street='';
  String other='';
  int? userId;

  addAddress()async{
    name=nameController.text.trim();
    city=cityController.text.trim();
    region=regionController.text.trim();
    street=streetController.text.trim();
    other=otherController.text.trim();
    if(nameController.text==''|| cityController.text =='') {
      Get.defaultDialog(
          title: 'Alert!!', middleText: 'must enter name and city');
      return;
    }
      else {
      statusRequest = StatusRequest.LOADING;
      var response = await addressService.saveAddress(
          MyAddress(name: name,
              city: city,
              region: region,
              street: street,
              other: other,
              user: User(id: serviceApp.sharedPreferences.getInt('user_id'))));
      statusRequest = handlingData(response);
      print(response);

      if (response == 1) {
       Get.back(result: true);
      }
      else {
        Get.defaultDialog(title: 'Alert!!', middleText: 'Unsuccessful');
      }
    }
    update();

  }


  goToLocationPage(){
    Get.toNamed(RouteApp.LOCATION_PAGE);
  }

  @override
  void onInit() {
    // userId=serviceApp.sharedPreferences.getInt('id')!;
    super.onInit();

  }
}