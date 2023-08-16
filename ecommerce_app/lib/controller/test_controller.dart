import 'package:ecommerce_app/core/class/status_request.dart';
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
  String show='v';

  changeShow(){
    if(show=='v')
      show='h';
      else
        show='v';
      update();
}
  @override
  void onInit() {
    show='v';
super.onInit();
  }
}
