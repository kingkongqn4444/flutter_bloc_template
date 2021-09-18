import 'package:flutter/material.dart';

class DateTimePattern {
  static const List<int> daysInMonths = [31, -1, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
  static const String displayddMMMMyyyy = "dd/MMMM/yyyy";
  static const String displayddMMMMCommayyyy = "dd MMMM, yyyy";
  static const String displayHHmm = "HH:mm";
  static const String dateFormatWithName = 'EEEE, dd/MM/yyyy';
  static const String dateFormatWithName1 = 'HH:mm a - dd/MM/yyyy';
  static const String dateFormatHHmmddMMyyyy = 'HH:mm dd/MM/yyyy';
  static const String dateFormatHHmmssddMMyyyy = 'HH:mm:ss dd/MM/yyyy';
  static const String dateFormat = "dd/MM/yyyy";
  static const String dateFormatYYYYMMDD = "yyyy/MM/dd";
  static const String monthFormat = "MMMM, yyyy";
  static const String monthFormat2 = "MM, yyyy";
  static const String dateTimeFormat = "dd/MM/yyyy HH:mm";
  static const String timeFormat = "HH:mm";
  static const String dateWithoutYear = "dd/MM";
  static const String nameOfDay = "EEE";
}

class ColorConstants {
  static Color get baseColor => Color(0xFFEEEEEE);

  static Color get highlightColor => Color(0xFFFAFAFA);
}
