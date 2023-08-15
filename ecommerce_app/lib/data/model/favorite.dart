



import 'package:ecommerce_app/data/model/Items.dart';
import 'package:ecommerce_app/data/model/user_entity.dart';

class Favorite{

  int? id ;
   Item? item;
   User? user;


  Favorite({this.id, this.item, this.user});


  Favorite.fromJson(Map<String,dynamic> json){
    id = json['id'];
    item =Item.fromJson(json['item']) ;
    if(user!=null)
    user = User.fromJson(json['user']);
    }

    Map<String, dynamic> toJson() {
      final Map<String, dynamic> data =  <String, dynamic>{};
      data['id'] = id;
      data['item'] = item;
      data['user'] = user;

      return data;
    }

}