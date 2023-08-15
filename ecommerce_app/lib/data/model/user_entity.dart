

import 'package:ecommerce_app/data/model/address.dart';

class User{
  int? id;
  String? userName;
  String? phone;
  String? email;
  String? password;
  List<MyAddress>? addresses;

  User({this.id, this.userName, this.phone, this.email, this.password,this.addresses});

  User.fromJson(Map<String,dynamic> json){
    id=json['id'];
    userName=json['userName'];
    phone=json['phone'];
    email=json['email'];
    password=json['password'];
  }

  Map<String, dynamic> toJson(){
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['userName'] = userName;
    data['phone'] = phone;
    data['email'] = email;
    data['password'] = password;
    return data;
  }



}