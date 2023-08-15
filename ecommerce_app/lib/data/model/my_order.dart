



import 'package:ecommerce_app/data/model/address.dart';
import 'package:ecommerce_app/data/model/my_card.dart';
import 'package:ecommerce_app/data/model/user_entity.dart';

class MyOrder {
   int? id;
   String? paymentMethod;
   String? deliveryType;
   double? totalOrder;
   int? stateOrder;
   List<MyCard>? cards;
   User? user;
   MyAddress? address;

   MyOrder({this.id, this.paymentMethod, this.deliveryType, this.totalOrder,
      this.stateOrder, this.cards, this.user,this.address});


   MyOrder.fromJson(Map<String, dynamic> json) {
     id=json['id'];
     paymentMethod = json['paymentMethod'];
     deliveryType = json['deliveryType'];
     totalOrder = json['totalOrder'];
     stateOrder = json['stateOrder'];
     if (json['card'] != null) {
       cards = <MyCard>[];
       json['card'].forEach((v) {
         cards!.add(new MyCard.fromJson(v));
       });
     }
     user = json['user'] != null ? new User.fromJson(json['user']) : null;
     address = json['addressUser'] != null ? new MyAddress.fromJson(json['addressUser']) : null;
   }

   Map<String, dynamic> toJson() {
     final Map<String, dynamic> data = new Map<String, dynamic>();
     data['id']=id;
     data['paymentMethod'] = this.paymentMethod;
     data['deliveryType'] = this.deliveryType;
     data['totalOrder'] = this.totalOrder;
     data['stateOrder'] = this.stateOrder;
     if (this.cards != null) {
       data['card'] = this.cards!.map((v) => v.toJson()).toList();
     }
     if (this.user != null) {
       data['user'] = this.user!.toJson();
     }
     if (this.address != null) {
       data['addressUser'] = this.address!.toJson();
     }
     return data;
   }


}