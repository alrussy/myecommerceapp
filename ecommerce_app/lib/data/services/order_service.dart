



import 'package:ecommerce_app/data/model/my_order.dart';
import 'package:ecommerce_app/data/repository/repository.dart';
import 'package:ecommerce_app/res/url/url_app.dart';

class OrderService{

  final ApiRepository _repository;
  OrderService(this._repository);



  getOrdersByUser(int userId)async{
    var response=await _repository.getData('${AppUrl.GET_ORDERS_BY_USER}/$userId');
    return response.fold((left) => left, (right) => right);
  }

}