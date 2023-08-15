


import 'package:ecommerce_app/data/model/address.dart';
import 'package:ecommerce_app/data/model/favorite.dart';
import 'package:ecommerce_app/data/repository/repository.dart';
import 'package:ecommerce_app/res/url/url_app.dart';

class AddressService{
  final ApiRepository _repository;
  AddressService(this._repository);


  getAddressByUser(int userId)async{
    var response=await _repository.getData('${AppUrl.GET_ADDRESS_BY_USER}/$userId');
    return response.fold((left) => left, (right) => right);
  }
  saveAddress(MyAddress address)async{
    var response=await _repository.postData(AppUrl.SAVE_ADDRESS, address.toJson());
    return response.fold((left) => left, (right) => right);
  }
  deleteAddress(MyAddress address)async{
    var response=await _repository.deleteData(AppUrl.DELETE_ADDRESS, address.toJson());
    return response.fold((left) => left, (right) => right);
  }



}