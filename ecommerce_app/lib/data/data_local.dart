
import 'package:ecommerce_app/data/model/Items.dart';
import 'package:ecommerce_app/data/model/bottom_navigotion_bar.dart';
import 'package:ecommerce_app/data/model/my_card.dart';
import 'package:ecommerce_app/res/images/image_assets.dart';
import 'package:flutter/material.dart';
import 'model/onboardingmodel.dart';

List<OnBoardingModel> onBoardingList=[


  OnBoardingModel(
      title: 'Order For Items',
    body:'We Have a 100k+ Products. Choose\nYour Product From Our E-\n ecommerce Shop',
    image: ImageAssets.IMAGEPAGEONE
  ),
  OnBoardingModel(
      title: 'Esay & Safe Payment',
      body:'We Have a 100k+ Products. Choose\nYour Product From Our\n E-ecommerce Shop',
      image: ImageAssets.IMAGEPAGETWO
  ),
  OnBoardingModel(
      title:'Items Delivery',
      body:'We Have a 100k+ Products. Choose\nYour Product From Our\n E-ecommerce Shop',
      image: ImageAssets.IMAGEPAGETHREE
  ),
];


List<BotomNavBar> botomNavBar=[
  BotomNavBar(name: 'home', icon:Icons.home_outlined),
  BotomNavBar(name: 'favorite', icon:Icons.favorite_border_outlined),
  BotomNavBar(),
  BotomNavBar(name: 'Notification', icon:Icons.notifications_active_outlined),
  BotomNavBar(name: 'setting', icon:Icons.settings_rounded),
];

List<MyCard> cardsApp= [];