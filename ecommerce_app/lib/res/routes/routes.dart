import 'package:ecommerce_app/core/constant/route_app.dart';
import 'package:ecommerce_app/core/mymiddleware/middle.dart';
import 'package:ecommerce_app/res/routes/routes_name.dart';
import 'package:ecommerce_app/test.dart';
import 'package:ecommerce_app/view/address/add_address_page.dart';
import 'package:ecommerce_app/view/address/address_page.dart';
import 'package:ecommerce_app/view/address/location_page.dart';
import 'package:ecommerce_app/view/auth_scr/forget_password_screen.dart';
import 'package:ecommerce_app/view/auth_scr/login.dart';
import 'package:ecommerce_app/view/auth_scr/rest_password_screen.dart';
import 'package:ecommerce_app/view/auth_scr/sign_up.dart';
import 'package:ecommerce_app/view/auth_scr/verfiycode_screen.dart';
import 'package:ecommerce_app/view/bottom_navigation_bar/bottom_navigation_bar_view.dart';
import 'package:ecommerce_app/view/checkout/ceckout_page.dart';
import 'package:ecommerce_app/view/favorite/page/favorite_page.dart';
import 'package:ecommerce_app/view/home_scr/home_page.dart';
import 'package:ecommerce_app/view/item_details/item_details_page/item_details_page.dart';
import 'package:ecommerce_app/view/items_by_product_scr/items_by_product_page.dart';
import 'package:ecommerce_app/view/my_card/page/my_card_page.dart';
import 'package:ecommerce_app/view/order/order_Page.dart';
import 'package:ecommerce_app/view/satting/setting_page.dart';
import 'package:get/get.dart';
import '../../view/splach_screen/Spalsh_page.dart';

class AppRoutes {
  static getPages() => [
        // GetPage(
        //   name: '/',
        //   page: () => OnBoarding(),
        //   middlewares: [MiddleWareApp()],
        // ),
        GetPage(
          name: RoutesName.SPLASH,
          page: () => SplashPage(),
          transitionDuration: Duration(milliseconds: 300),
          transition: Transition.leftToRightWithFade,
        ),
        GetPage(name:RoutesName.LOGIN, page: () => Login()),
        GetPage(name: RoutesName.SIGNUP, page: () => SignUp()),
        GetPage(name: RoutesName.FORGET_PASWORD, page: () => ForgetPassword()),
        GetPage(
            name: RoutesName.RESET_PASSWORD, page: () => ResetPasswordScreen()),
        GetPage(name: RoutesName.VERFIY_CODE, page: () => VerfiyCodeScreen()),
    GetPage(name: RoutesName.HOME_PAGE, page: () => HomePage()),
        GetPage(name: RoutesName.BOTTOM_NAVIGAITION_BAR_BAGE, page: () => BottomNavigationBarView()),
        // GetPage(
        //   name: RoutesName.ITEM_PAGE,
        //   page: () => ItemPage(),
        // ),
        GetPage(
          name: RoutesName.FAVORITE_PAGE,
          page: () => const FavoritePage(),
        ),
        GetPage(
          name: RoutesName.ITEM_DETAILS_PAGE,
          page: () => ItemDetailsPage(),
        ),
        GetPage(
          name: RoutesName.MY_CARD_PAGE,
          page: () => MyCardPage(),
        ),
        GetPage(
          name: RoutesName.SETTING_PAGE,
          page: () => SettingPage(),
        ),
        GetPage(
          name: RoutesName.ADDRESS_PAGE,
          page: () => AddressPage(),
        ),
    GetPage(
      name: RoutesName.ADD_ADDRESS_PAGE,
      page: () => AddAddressPage(),
    ),
        GetPage(
          name: RoutesName.LOCATION_PAGE,
          page: () => LocationPage(),
        ),
        GetPage(
          name: '/test',
          page: () => TestPage(),
        ),
    GetPage(
      name: RoutesName.ITEMS_BY_PRODUCT_PAGE,
      page: () => ItemsByProductPage(),
    ),

    GetPage(
      name: RoutesName.CHECKOUTE_PAGE,
      page: () => CheckOutPage(),
    ),

    GetPage(
      name: RoutesName.ORDER_PAGE,
      page: () => OrderPage(),
    ),
      ];
}
