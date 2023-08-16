import 'package:ecommerce_app/core/service/service.dart';
import 'package:ecommerce_app/res/routes/routes_name.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class MiddleWareApp extends GetMiddleware{

  ServiceApp serviceApp=Get.find();
@override
  int? get priority => 1;
@override
  RouteSettings? redirect(String? route) {
  // if( serviceApp.sharedPrefere=='1'){
  // return RouteSettings(name:RouteApp.LOGIN);}
  // else if(serviceApp.sharedPreferences.getString('boarding')=='2'){
    return RouteSettings(name:RoutesName.BOTTOM_NAVIGAITION_BAR_BAGE);
  }

  }
//
