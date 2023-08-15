
import 'package:ecommerce_app/controller/setting_controller.dart';
import 'package:ecommerce_app/core/constant/color_app.dart';
import 'package:ecommerce_app/core/constant/fonts_app.dart';
import 'package:ecommerce_app/res/colors/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';



class SettingPage extends StatelessWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SettingController settingController=Get.put(SettingController());
    return Scaffold(
        body:ListView(

      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              height: 250,
              decoration: BoxDecoration(
                color: ColorApp.primary,
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(20)),
              )
              ,
            ),
            Positioned(
              left: (Get.width)/2-60,
              top: 250-60,
              child: Container(
                width: 120,
                height: 120,
                child: Text('A',style: TextStyle(fontSize: 40,color: Colors.white),),
                alignment: Alignment.center,
                decoration:BoxDecoration(
                  border: Border.all(width: 5,color: Colors.white),
                  color: ColorApp.text,
                  shape: BoxShape.circle
                ),
              ),
            )
          ],
        ),
        SizedBox(
          height: 60,
        ),
        customListTile('language', 'English', Icons.language,(){}),
        customListTile('Address', '', Icons.location_on_outlined,(){settingController.goToAddressPage();}),
        customListTile('My Orders', '', Icons.menu,(){settingController.goToOrdersPage();}),
      ],
    )
    );
  }
}



Widget customListTile(String title,String subTitle,IconData icon,Function()? action ){
 return ListTile(
    onTap:action,
    title:Text(title,style: const TextStyle(fontFamily: FontsApp.alkatra,fontSize: 20,color: ColorApp.text),),
    subtitle: Text(subTitle),
    leading: Icon(icon,color: AppColors.primary,)
  );

}