

import 'package:ecommerce_app/data/model/user_entity.dart';

class MyAddress {
  int? id;
  String? name;
  String? city;
  String? region;
  String? street;
  String? other;
  String? longitude;
  String? latitude;
  User? user;

  MyAddress(
      {
        this.id,
        this.name,
        this.city,
        this.region,
        this.street,
        this.other,
        this.longitude,
        this.latitude,
        this.user});

  MyAddress.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    city = json['city'];
    region = json['region'];
    street = json['street'];
    other = json['other'];
    longitude = json['longitude'];
    latitude = json['latitude'];
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id']=id;
    data['name'] = this.name;
    data['city'] = this.city;
    data['region'] = this.region;
    data['street'] = this.street;
    data['other'] = this.other;
    data['longitude'] = this.longitude;
    data['latitude'] = this.latitude;
    if (this.user != null) {
      data['user'] = this.user!.toJson();
    }
    return data;
  }

  @override
  String toString() {
    return '$city - $region - $street';
  }
}