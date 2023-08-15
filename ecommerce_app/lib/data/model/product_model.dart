




import 'package:ecommerce_app/data/model/Items.dart';

import 'category.dart';

class Product {
  int? id;
  String? name;
  List<Category>? category;

  Product({this.id, this.name, this.category,});


  Product.fromJson(Map<String,dynamic> json){
  id = json['id'];
    name = json['name'];
    if (json['category'] != null) {
      category = <Category>[];
      json['category'].forEach((v) {
        category!.add(new Category.fromJson(v));
      });
    }

    }

    Map<String, dynamic> toJson() {
      final Map<String, dynamic> data =  <String, dynamic>{};
      data['id'] = id;
      data['name'] = name;
      if (category != null) {
        data['category'] =category!.map((v) =>v.toJson()).toList();
      }
      return data;
    }

}



