import 'package:ecommerce_app/controller/login_controller.dart';
import 'package:ecommerce_app/core/constant/color_app.dart';
import 'package:ecommerce_app/core/constant/fonts_app.dart';
import 'package:ecommerce_app/res/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTextField extends GetView<LoginController> {
  CustomTextField(
      {Key? key,
        required this.hintText,
        required this.label,
        required this.valid,
        this.icon,
        this.showPasswordIsActive,
        this.keyboardType,
        this.textEditingController,
        this.focusNode,
        this.submit
      })
      : super(key: key);

  final String hintText;
  final String label;
  final IconData? icon;
  final TextInputType? keyboardType;
  final bool? showPasswordIsActive;
  final TextEditingController? textEditingController;
  final String? Function(String?)? valid;
  final String? Function(String?)? submit;
   FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: valid,
      focusNode: focusNode,
      onFieldSubmitted:submit,
      onTapOutside: (e){
        focusNode!.unfocus();
      },
      controller: textEditingController,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        fillColor: Colors.grey[200],
        filled: true,
        hintText: hintText,
        label: Text(label),
        hintStyle: TextStyle(fontFamily: FontsApp.alkatra),
        labelStyle:
            TextStyle(fontFamily: FontsApp.alkatra, color: AppColors.primary),
        contentPadding: EdgeInsets.only(left: 20),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(10),
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: Icon(
            icon,
            color: AppColors.primary,
            size: 25,
          ),
        ),
        focusColor: AppColors.primary,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.primary,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(10),
          gapPadding: 10,
        ),
      ),
      style: TextStyle(fontSize: 16),
      obscureText: showPasswordIsActive == false || showPasswordIsActive == null
          ? false
          : true,
    );
  }
}
