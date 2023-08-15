class AppUrl {
  static const String BASE = 'http://192.168.1.100:9000/ecommerce/api';
  //=============URL USER
  static const String BASE_USER = '$BASE/user';
  static const String ALL_USERS = '${BASE_USER}/get_user/all';
  static const String GET_USER = '${BASE_USER}/get_user/by_id';
  static const String ADD_USER = '$BASE_USER/add';
  static const String LOGIN = '$BASE_USER/valid';
  static const String SEND_VERIFIY_CODE = '$BASE_USER/send_verifiy_code';
  static const String CHECK_EMAILORPASSWORD = '$BASE_USER/check_email';
  static const String REST_PASSWORD = '$BASE_USER/rest_password';
  //=============URL PRODUCT
  static const String BASE_PRODUCT = '$BASE/product';
  static const String ALL_PRODUCT = '$BASE_PRODUCT/get_product/all';

  //=============URL CATEGORY
  static const String BASE_CATEGORY = '$BASE/category';
  static const String ALL_CATEGORY = '${BASE_CATEGORY}/get_category/all';

  //==============URL ITEM
  static const String BASE_ITEM = '$BASE/item';
  static const String ALL_ITEM = '$BASE_ITEM/get_item/all';
  static const String GET_ITEM_By_CATEGORY_ID = '$BASE_ITEM/get_item/by_catid';
  static const String GET_ITEM_By_NAME = '$BASE_ITEM/get_item/by_name';

  //==============URL FAVORITE
  static const String BASE_FAVORITE = '$BASE/favorite';
  static const String GET_FAVORITE_BY_USER = '$BASE_FAVORITE/get-favorite';
  static const String SAVE_FAVORITE = '$BASE_FAVORITE/add';
  static const String DELETE_FAVORITE = '$BASE_FAVORITE/delete';

  static const String CHECK_ITEM_IS_FAVORITE = '$BASE_FAVORITE/checked-item';
  static const String BASE_ADDRESS = '$BASE/address';
  static const String GET_ADDRESS_BY_USER = '$BASE_ADDRESS/get_address/by_userId';
  static const String SAVE_ADDRESS = '$BASE_ADDRESS/add';
  static const String DELETE_ADDRESS = '$BASE_ADDRESS/delete';

  static const String BASE_ORDER = '$BASE/myOrder';
  static const String SAVE_ORDER = '$BASE_ORDER/add';
  static const String GET_ORDERS_BY_USER = '$BASE_ORDER/get_myOrders/by_user';
}
