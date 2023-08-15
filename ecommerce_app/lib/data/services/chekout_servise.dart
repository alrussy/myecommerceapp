




import 'package:ecommerce_app/data/model/address.dart';
import 'package:ecommerce_app/data/model/favorite.dart';
import 'package:ecommerce_app/data/model/my_order.dart';
import 'package:ecommerce_app/data/repository/repository.dart';
import 'package:ecommerce_app/res/url/url_app.dart';

class CheckoutService{
  final ApiRepository _repository;
  CheckoutService(this._repository);

  saveOrder(MyOrder order)async{
    var response=await _repository.postData(AppUrl.SAVE_ORDER, order.toJson());
    return response.fold((left) => left, (right) => right);
  }



}