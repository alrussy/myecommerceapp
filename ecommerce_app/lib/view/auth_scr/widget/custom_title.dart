import 'package:ecommerce_app/core/constant/fonts_app.dart';
import 'package:flutter/material.dart';

class CustomTitleLogin extends StatelessWidget {
  CustomTitleLogin({Key? key, required this.textTitle}) : super(key: key);
  String textTitle;

  @override
  Widget build(BuildContext context) {
    return Text(
      textTitle,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: Colors.white,
        fontSize: 30,
        fontWeight: FontWeight.w500,
        fontFamily: FontsApp.lobster,
      ),
    );
  }
}
