import 'package:flutter/material.dart';

import '../resources/resources.dart';
import 'package:flutter_common/common.dart';

extension TextStyleExt on TextStyle {
  TextStyle get textBlack => textColor(MyColors.primaryBlack);
  TextStyle get textBlack60 => textColor(MyColors.primaryBlack60);
  TextStyle get textBlack38 => textColor(MyColors.primaryBlack38);
  TextStyle get textPrimary => textColor(MyColors.primary);
  TextStyle get textWhite => textColor(MyColors.primaryWhite);
  TextStyle get textDarkGreen => textColor(MyColors.colorTextDarkGreen);

  TextStyle get size8 => size(Dimens.typography8);
  TextStyle get size10 => size(Dimens.typography10);
  TextStyle get size12 => size(Dimens.typography12);
  TextStyle get size13 => size(Dimens.typography12);
  TextStyle get size14 => size(Dimens.typography14);
  TextStyle get size15 => size(Dimens.typography14);
  TextStyle get size16 => size(Dimens.typography16);
  TextStyle get size17 => size(Dimens.typography17);
  TextStyle get size18 => size(Dimens.typography18);
  TextStyle get size20 => size(Dimens.typography20);
  TextStyle get size21 => size(Dimens.typography21);
  TextStyle get size24 => size(Dimens.typography24);
  TextStyle get size38 => size(Dimens.typography38);
}

extension ColorSchemeExt on ColorScheme {
  bool get isDark => brightness == Brightness.dark;

  Color get primaryColor => isDark ? MyColors.primaryDark : MyColors.primary;
}
