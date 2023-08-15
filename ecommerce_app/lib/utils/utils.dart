

import 'dart:io';

import 'package:ecommerce_app/res/fonts/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../core/constant/color_app.dart';
import '../core/constant/fonts_app.dart';

class Utils{


  static fieldFocusChange(BuildContext context,FocusNode current, FocusNode next){
    current.unfocus();
    FocusScope.of(context).requestFocus(next);
  }



  static snackBar(String title,String message){
    Get.snackbar(title, message,);
  }


static showErrorDialog(String title,String message) {
    Get.defaultDialog(
        contentPadding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        title: title,
        titleStyle:  Get.textTheme.headlineSmall!.copyWith(fontFamily: AppFonts.alkatra),
        middleText:message,
        middleTextStyle: Get.textTheme.bodySmall!.copyWith(fontFamily: AppFonts.alkatra),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Get.back();
                },
                style: ButtonStyle(
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
                    backgroundColor:
                    MaterialStatePropertyAll(ColorApp.primary)),
                child: const Text('Ok',
                  style: TextStyle(fontFamily: FontsApp.alkatra),
                ),
              ),
            ],
          )
        ]);
  }

  static showLoadingDialog(){
    Get.dialog(
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          CircularProgressIndicator(),
        ],
      )
    );
  }
  static hideLoadingDialog(){
    if(Get.isDialogOpen!) Get.back();
  }

}