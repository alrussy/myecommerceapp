import 'package:ecommerce_app/core/constant/fonts_app.dart';
import 'package:ecommerce_app/core/constant/image_assets.dart';
import 'package:ecommerce_app/data/model/Items.dart';
import 'package:flutter/material.dart';

class CardRecommended extends StatelessWidget {
   CardRecommended({Key? key,}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(

      padding: const EdgeInsets.only(right: 10),
      child: Container(
        clipBehavior: Clip.hardEdge,
          width: 180,
          margin: EdgeInsets.only(bottom: 15),
          child: Stack(
            fit: StackFit.passthrough,
            children: [

              Image.asset(
                'assets/test/f.jpg',
                fit: BoxFit.fill,
              ),
              Positioned(
                  left: 12,
                  top: 2,
                  child: Text('item name',style: TextStyle(fontSize: 20,color: Colors.black87,fontWeight: FontWeight.w500,fontFamily: FontsApp.alkatra),),)
              ,Container(
                width: 140,
                height: 100,
                color: Color(0x44000066),
              ),
            ],
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                blurRadius: 5,
                offset: Offset(5,1),
              )
            ],
          )),
    );
  }
}
