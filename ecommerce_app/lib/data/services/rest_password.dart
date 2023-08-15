



import 'package:ecommerce_app/core/constant/url_app.dart';
import 'package:ecommerce_app/data/model/user_entity.dart';
import 'package:ecommerce_app/data/repository/repository.dart';
class RestPasswordService{
  final ApiRepository _repository;
  RestPasswordService(this._repository);

  restPassword(User user)async {
    var response = await _repository.putData(UrlApp.REST_PASSWORD,user.toJson());
    return response.fold((left) => left, (right) => right);
  }
}