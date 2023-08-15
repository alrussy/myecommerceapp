import 'package:ecommerce_app/core/constant/fonts_app.dart';
import 'package:flutter/material.dart';

class CustomBodyLogin extends StatelessWidget {
  CustomBodyLogin({Key? key, required this.textBody}) : super(key: key);
 final String textBody;

  @override
  Widget build(BuildContext context) {
    return Text(
      textBody,
      style: TextStyle(
        color: Colors.white60,
        fontFamily: FontsApp.alkatra,
        fontSize: 18,
        fontWeight: FontWeight.w400,
        height: 2,

      ),
      textAlign: TextAlign.center,
    );
  }
}
