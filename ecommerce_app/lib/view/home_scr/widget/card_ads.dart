import 'package:flutter/material.dart';

import '../../../res/fonts/app_fonts.dart';

class CardAds extends StatelessWidget {
  const CardAds({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 150,
      margin: EdgeInsets.symmetric(vertical:30),
      child:Stack(
        children: [
          Positioned(
              child: Container(
                width:60,
                height: 60,
                decoration: BoxDecoration(
                    color: Color(0x66de4b72),
                    borderRadius:BorderRadius.circular(100)),),
              left: 300,
              top:0
          ),

          Positioned(
              child: Container(
                width:120,
                height: 120,
                decoration: BoxDecoration(
                    color: Color(0x55fda4bd),
                    borderRadius:BorderRadius.circular(100)),),
              left: 40,
              top:100
          ),

          Positioned(
              child: Container(
                width:80,
                height: 80,
                decoration: BoxDecoration(
                    color: Color(0x66c42954),
                    borderRadius:BorderRadius.circular(100)),),
              left: 190,
              top:40
          ),
          Positioned(
              child: Container(
                width:150,
                height: 150,
                decoration: BoxDecoration(
                    color: Color(0x22eea7bb),
                    borderRadius:BorderRadius.circular(100)),),
              left: 0,
              top:0
          ),


          ListTile(
            title: Text('Ads Title',style: TextStyle(fontSize: 35,color: Colors.white,fontFamily: AppFonts.sriracha),),
            subtitle:Text('subject........................',style: TextStyle(fontSize: 20,color: Colors.white,fontFamily: AppFonts.alkatra),),

          ),
        ],
      ),

      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          boxShadow:[BoxShadow(blurRadius:10,spreadRadius: 2,offset: Offset(3,3),blurStyle: BlurStyle.inner,)],
          gradient: LinearGradient(colors:
          [
            Color(0xffD92253),Color(0xaaD92253)],
            tileMode: TileMode.repeated,transform: GradientRotation(200) ,)
      ),
    );
  }
}
