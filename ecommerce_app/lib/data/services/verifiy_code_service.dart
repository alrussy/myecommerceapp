

import 'package:ecommerce_app/core/constant/url_app.dart';
import 'package:ecommerce_app/data/model/user_entity.dart';
import 'package:ecommerce_app/data/repository/repository.dart';

class VerificationCodeService{
  final ApiRepository _repository;
  VerificationCodeService(this._repository);

  sendVerificationCode(User user)async {
    var response = await _repository.postData(UrlApp.SEND_VERIFIY_CODE, user.toJson());
    return response.fold((left) => left, (right) => right);
  }

}