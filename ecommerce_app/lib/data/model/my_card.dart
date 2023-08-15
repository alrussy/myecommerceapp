

import 'package:ecommerce_app/data/model/Items.dart';

class MyCard{

  int? id;
  Item? item;
  int? count;
  MyCard({this.id,this.item,this.count});


  MyCard.fromJson(Map<String, dynamic> json) {
    id=json['id'];
    item = json['item'] != null ? new Item.fromJson(json['item']) : null;
    count = json['count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['id']=id;
    if (this.item != null) {
      data['item'] = this.item!.toJson();
    }
    data['count'] = this.count;
    return data;
  }
}