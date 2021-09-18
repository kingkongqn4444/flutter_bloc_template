import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart';

class SizeUtils {
  static double get ppi => (Platform.isAndroid || Platform.isIOS) ? 150 : 96;
  static double diagonal(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return sqrt((size.width * size.width) + (size.height * size.height));
  }
}