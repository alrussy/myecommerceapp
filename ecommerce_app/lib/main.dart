import 'package:ecommerce_app/binding/init_bindng.dart';
import 'package:ecommerce_app/core/service/service.dart';
import 'package:ecommerce_app/res/colors/app_colors.dart';
import 'package:ecommerce_app/res/locallization/local.dart';
import 'package:ecommerce_app/res/routes/routes.dart';
import 'package:ecommerce_app/res/routes/routes_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'res/fonts/app_fonts.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await initServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ecommerce app',
      translations: AppLocal(),
      locale: const Locale('en'),
      fallbackLocale: const Locale('en'),
      theme: ThemeData(
        appBarTheme:AppBarTheme(
        ),

        primarySwatch: Colors.blue,
        primaryColor: AppColors.primary,
      ),
      initialBinding: InitBinding(),
      initialRoute:RoutesName.LOGIN,
      getPages:AppRoutes.getPages(),

    );
  }
}
TextTheme t=TextTheme(
headlineLarge: TextStyle(color: Colors.black,fontSize: 34,fontFamily: AppFonts.courgette),
headlineMedium: TextStyle(color: Colors.black,fontSize: 24,),
    headlineSmall: TextStyle(color: Colors.black,fontSize: 18,),
titleLarge: TextStyle(color: Colors.black,fontSize: 16,)


);