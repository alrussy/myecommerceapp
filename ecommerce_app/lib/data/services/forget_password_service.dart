




import 'package:ecommerce_app/core/constant/url_app.dart';
import 'package:ecommerce_app/data/model/user_entity.dart';
import 'package:ecommerce_app/data/repository/repository.dart';

class ForgetPasswordService{

  final ApiRepository _repository;
  ForgetPasswordService(this._repository);

  checkEmail(User user)async{
  var response=await _repository.postData(UrlApp.CHECK_EMAILORPASSWORD,user.toJson());
  return response.fold((left) => left, (right) => right);
}
}