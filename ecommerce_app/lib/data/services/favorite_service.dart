


import 'package:ecommerce_app/data/model/favorite.dart';
import 'package:ecommerce_app/data/repository/repository.dart';
import 'package:ecommerce_app/res/url/url_app.dart';

class FavoriteService{
  final ApiRepository _repository;
  FavoriteService(this._repository);


  getDataByUser(int userId)async{

    var response=await _repository.getData('${AppUrl.GET_FAVORITE_BY_USER}/$userId');
    return response.fold((left) => left, (right) => right);
  }
  saveFavorite(Favorite favorite)async{
    var response=await _repository.postData(AppUrl.SAVE_FAVORITE, favorite.toJson());
    return response.fold((left) => left, (right) => right);
  }
  deleteFavorite(Favorite favorite)async{
    var response=await _repository.deleteData(AppUrl.DELETE_FAVORITE, favorite.toJson());
    return response.fold((left) => left, (right) => right);
  }
  checkItemIsFavorite(Favorite favorite)async{
    var response=await _repository.postData(AppUrl.CHECK_ITEM_IS_FAVORITE, favorite.toJson());
    return response.fold((left) => left, (right) => right);
  }


}