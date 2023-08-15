import 'package:ecommerce_app/data/model/brand_model.dart';

class Item {
  int? id;
  String? name;
  double? price;
  String? image;
  double? desCount;
  String? descraption;
  double? priceAfterDescount;
  bool? isActive;
  int? count;
  Brand? brand;
  bool isFavorite = false;

  Item(
      {this.id,
      this.name,
      this.price,
      this.image,
      this.desCount,
      this.descraption,
      this.priceAfterDescount,
      this.isActive,
      this.count});

  Item.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    image = json['image'];
    desCount = json['descount'];
    descraption = json['desceraption'];
    priceAfterDescount=json['priceAfterDes'];
    isActive = json['isActive'];
    count = json['count'];
    brand=Brand.fromJson(json['brand']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['price'] = price;
    data['image'] = image;
    data['descount'] = desCount;
    data['desceraption'] = descraption;
    data['priceAfterDes']=priceAfterDescount;
    data['isActive'] =isActive;
    data['count'] = count;
    data['brand']=brand!.toJson();
    return data;
  }
}
