




import 'package:ecommerce_app/data/model/user_entity.dart';
import 'package:ecommerce_app/data/repository/repository.dart';
import 'package:ecommerce_app/res/url/url_app.dart';

class HomeService{

  final ApiRepository _repository;
  HomeService(this._repository);

  getAllProducts()async{
    var response=await _repository.getData(AppUrl.ALL_PRODUCT);
    return response.fold((left) => left, (right) => right);
  }
}