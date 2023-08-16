import 'package:ecommerce_app/res/fonts/app_fonts.dart';
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
        fontFamily: AppFonts.alkatra,
        fontSize: 18,
        fontWeight: FontWeight.w400,
        height: 2,

      ),
      textAlign: TextAlign.center,
    );
  }
}
