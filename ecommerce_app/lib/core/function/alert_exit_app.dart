import 'dart:io';

import 'package:ecommerce_app/core/constant/color_app.dart';
import 'package:ecommerce_app/core/constant/fonts_app.dart';
import 'package:ecommerce_app/data/data_local.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Future<bool> alertExitApp() {
  Get.defaultDialog(
      contentPadding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      title: 'Alert..!',
      titleStyle: const TextStyle(fontFamily: FontsApp.sriracha),
      middleText: cardsApp.isNotEmpty
          ?'You have Order ..if you exit will it is remove\n do you went exit?'
          :'do you went exit?',

      middleTextStyle: const TextStyle(fontFamily: FontsApp.alkatra),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            ElevatedButton(
              child: const Text(
                'Yes',
                style: TextStyle(fontFamily: FontsApp.alkatra),
              ),
              onPressed: () {
                exit(0);
              },
              style: ButtonStyle(
                shape: MaterialStatePropertyAll(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                ),
                backgroundColor: MaterialStatePropertyAll(ColorApp.primary),
              ),
            ),
            ElevatedButton(
                onPressed: () {
                  Get.back();
                },
                style: ButtonStyle(
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
                    backgroundColor:
                        MaterialStatePropertyAll(ColorApp.primary)),
                child: const Text('No',
                    style: TextStyle(fontFamily: FontsApp.alkatra),
                ),
            ),
          ],
        )
      ]);
  return Future.value(true);
}
