


import 'package:ecommerce_app/core/constant/url_app.dart';
import 'package:ecommerce_app/data/model/user_entity.dart';
import 'package:ecommerce_app/data/repository/repository.dart';
class SignUpService{

  final ApiRepository _repository;

  SignUpService(this._repository);

  signUp(User user)async {
    var response = await _repository.postData(UrlApp.ADD_USER, user.toJson());
    return response.fold((left) => left, (right) => right);
  }

}