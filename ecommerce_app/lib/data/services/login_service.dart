


import 'package:ecommerce_app/core/class/status_request.dart';
import 'package:ecommerce_app/core/constant/url_app.dart';
import 'package:ecommerce_app/data/model/user_entity.dart';
import 'package:ecommerce_app/data/repository/repository.dart';
import 'package:ecommerce_app/res/url/url_app.dart';
import 'package:either_dart/either.dart';

class LoginService{


   ApiRepository _repository;
  LoginService(this._repository);

 login(User user)async {
   var response = await _repository.postData(AppUrl.LOGIN, user.toJson());
   return response.fold((left) => left, (right) => right);
 }
   getUser(int userId)async {
     var response = await _repository.getData('${AppUrl.GET_USER}/$userId');
     return response.fold((left) => left, (right) => right);
   }
}
