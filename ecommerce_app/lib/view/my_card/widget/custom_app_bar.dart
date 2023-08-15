


import 'package:ecommerce_app/core/constant/fonts_app.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back_rounded,size: 30,),),
        Expanded(
          child: Container(
              margin: EdgeInsets.only(right: 20),
              alignment: Alignment.center,
              child: Text('My Card',style: TextStyle(fontFamily: FontsApp.alkatra,fontSize: 25),)
          ),
        )
      ],
    );
  }
}
