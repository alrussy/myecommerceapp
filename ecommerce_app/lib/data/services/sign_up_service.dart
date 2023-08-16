


import 'package:ecommerce_app/data/model/user_entity.dart';
import 'package:ecommerce_app/data/repository/repository.dart';
import 'package:ecommerce_app/res/url/url_app.dart';
class SignUpService{

  final ApiRepository _repository;

  SignUpService(this._repository);

  signUp(User user)async {
    var response = await _repository.postData(AppUrl.ADD_USER, user.toJson());
    return response.fold((left) => left, (right) => right);
  }

}