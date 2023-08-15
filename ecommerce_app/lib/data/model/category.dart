


import 'package:ecommerce_app/data/model/Items.dart';

class Category {
  int? id;
  String? name;
  String? image;
  List<Item>? items;

  Category({this.id, this.name, this.image,this.items});


 Category.fromJson(Map<String,dynamic> json){
   id = json['id'];
   name = json['name'];
   image = json['image'];
   if (json['items'] != null) {
     items = <Item>[];
     json['items'].forEach((v) {
       items!.add(Item.fromJson(v));
     });
   }
  }

   Map<String, dynamic> toJson() {
     final Map<String, dynamic> data = new Map<String, dynamic>();
     data['id'] = this.id;
     data['name'] = this.name;
     data['image'] = this.image;
     if (this.items != null) {
       data['items'] = this.items!.map((v) => v.toJson()).toList();
     }
     return data;
   }

  }



