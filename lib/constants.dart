class AppConstants {
  static const int pageSize = 10;
  static const int indexFirstPage = 0;
  static const String nullString = "--";
  static const String emptyString = "";
  static const String requiredString = "*";
  static const String spaceString = " ";
  static const String dashString = " - ";
}

class ImageConstants {
  ImageConstants._();

  static const String imgBGSplash = 'assets/images/png/img_bg_splash.png';
  static const String imgOnBroadOne = 'assets/images/png/img_onboard_one.png';
  static const String imgOnBroadTwo = 'assets/images/png/img_onbroad_two.png';
  static const String imgOnBroadThree =
      'assets/images/png/img_onbroad_three.png';
  static const String imgOnBroadFour = 'assets/images/png/img_onbroad_four.png';
  static const String imgLogoSlogan = 'assets/images/png/img_logo_slogan.png';
  static const String imgWareOnBoard =
      'assets/images/png/img_ware_on_board.png';
  static const String imgHeaderInfoPage =
      'assets/images/png/img_header_info_page.png';
  static const String imgHeaderHome = 'assets/images/png/img_header_home.png';
  static const String imgButtonInHome =
      'assets/images/png/img_button_in_home.png';
  static const String imgBGNeedTo =
      'assets/images/png/img_background_need_to.png';
  static const String imgPropertyTypeParkHome =
      'assets/images/png/img_property_type_park_home.png';
  static const String imgPropertyTypeAll =
      'assets/images/png/img_property_type_all.png';
  static const String imgPropertyTypeDetached =
      'assets/images/png/img_property_type_detached.png';
  static const String imgPropertyTypeSemiDetached =
      'assets/images/png/img_property_type_semi_detached.png';
  static const String imgBottomNeedToBuy =
      'assets/images/png/img_bottom_need_to_buy.png';
  static const String imgHomeSearch =
      'assets/images/png/img_home_search.png';
}

class SVGConstants {
  SVGConstants._();

  static const String appLogo = 'assets/images/svg/ic_logo_white.svg';

  static const String icBed = 'assets/images/svg/ic_bed.svg';
  static const String icBathTub = 'assets/images/svg/ic_bath_tub.svg';
  static const String icAcreage = 'assets/images/svg/ic_acreage.svg';
  static const String icStayHome = 'assets/images/svg/ic_stay_home.svg';
  static const String icButtonInHome =
      'assets/images/svg/ic_button_in_home.svg';
  static const String icBuilding = 'assets/images/svg/ic_building.svg';
  static const String icClose = 'assets/images/svg/ic_close.svg';
  static const String icCloseCircle = 'assets/images/svg/ic_close_circle.svg';
  static const String icHome = 'assets/images/svg/ic_home.svg';
  static const String icLocation = 'assets/images/svg/ic_location.svg';
  static const String icSearchLocation =
      'assets/images/svg/ic_search_location.png';  static const String icSearch =
      'assets/images/svg/ic_search.svg';
  static const String icNext = 'assets/images/svg/ic_next.svg';
  static const String icSlideRange = 'assets/images/svg/ic_slide_range.svg';
  static const String icPriceInM2 = 'assets/images/svg/ic_price_in_m2.svg';
  static const String icPriceInUnit = 'assets/images/svg/ic_price_in_unit.svg';
  static const String icDropDown = 'assets/images/svg/ic_drop_down.svg';
  static const String icDropUp = 'assets/images/svg/ic_drop_up.svg';
}

class FlagConstants {
  static const String base = 'assets/flags/';
  static String path(String code) => base + code + '.svg';
}

class EnvironmentConstant {
  static const String dev = 'Develop';
  static const String staging = 'Staging';
  static const String test = 'Test';
  static const String prod = 'Production';
  static const String beta = 'Beta';
}

class SharedPreferencesKey {
  static const String language = 'language';
  static const String theme = 'theme';
  static const String userInfo = 'userInfo';
  static const String owner = 'owner';
  static const String refreshExpiresIn = 'refresh_expires_in';
  static const String env = 'env';
  static const String firstRun = 'first_run';
}
