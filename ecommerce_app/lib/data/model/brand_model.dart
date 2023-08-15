




import 'package:ecommerce_app/data/model/Items.dart';

import 'category.dart';

class Brand {
  int? id;
  String? name;
  List<Item>? items;

  Brand({this.id, this.name, this.items,});


  Brand.fromJson(Map<String,dynamic> json){
  id = json['id'];
    name = json['name'];
    if (json['items'] != null) {
      items = <Item>[];
      json['Items'].forEach((v) {
        items!.add(new Item.fromJson(v));
      });
    }

    }

    Map<String, dynamic> toJson() {
      final Map<String, dynamic> data =  <String, dynamic>{};
      data['id'] = id;
      data['name'] = name;
      if (items != null) {
        data['items'] =items!.map((v) =>v.toJson()).toList();
      }
      return data;
    }

}



