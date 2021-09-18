import 'dart:io';
import 'package:device_info/device_info.dart';
import 'package:flutter/foundation.dart';

class DeviceInfo {
  static bool get isDesktop => !isWeb && (isWindows || isLinux || isMacOS);
  static bool get isMobile => isAndroid || isIOS;
  static bool get isWeb => kIsWeb;

  static bool get isWindows => Platform.isWindows;
  static bool get isLinux => Platform.isLinux;
  static bool get isMacOS => Platform.isMacOS;
  static bool get isAndroid => Platform.isAndroid;
  static bool get isFuchsia => Platform.isFuchsia;
  static bool get isIOS => Platform.isIOS;
  static final deviceInfoPlugin = DeviceInfoPlugin();
  static Future<String> get deviceUuid async => await _getDeviceUUID();
  static Future<bool> get isPhysicalDevice async => await _isPhysicalDevice();
  static Future<Map<String, dynamic>> get deviceInfo async => await _getDeviceInfo();

  static Future<String> _getDeviceUUID() async {
    var identifier;
    try {
      if (Platform.isAndroid) {
        final androidInfo = await deviceInfoPlugin.androidInfo;
        identifier = androidInfo.androidId; //UUID for Android
      } else if (Platform.isIOS) {
        var data = await deviceInfoPlugin.iosInfo;
        identifier = data.identifierForVendor; //UUID for iOS
      }
    } catch (ex) {}

    return identifier;
  }

  static Future<bool> _isPhysicalDevice() async {
    try {
      if (isAndroid) {
        final androidInfo = await deviceInfoPlugin.androidInfo;
        return androidInfo.isPhysicalDevice;
      } else {
        final iOSInfo = await deviceInfoPlugin.iosInfo;
        return iOSInfo.isPhysicalDevice;
      }
    } catch (_) {
      return null;
    }
  }

  static Future<Map<String, dynamic>> _getDeviceInfo() async {
    try {
      Map<String, dynamic> result;
      if (isAndroid) {
        final androidDeviceInfo = await deviceInfoPlugin.androidInfo;
        result = {
          'brand': androidDeviceInfo.brand,
          'manufacturer': androidDeviceInfo.manufacturer,
          'model': androidDeviceInfo.model,
          'product': androidDeviceInfo.product,
          'sdkInt': androidDeviceInfo.version.sdkInt,
          'uuid': androidDeviceInfo.androidId,
        };
      } else if (isIOS) {
        final iosDeviceInfo = await deviceInfoPlugin.iosInfo;
        result = {
          'systemName': iosDeviceInfo.systemName,
          'systemVersion': iosDeviceInfo.systemVersion,
          'model': iosDeviceInfo.model,
          'name': iosDeviceInfo.name,
          'utsname': iosDeviceInfo.utsname,
          'uuid': iosDeviceInfo.identifierForVendor,
        };
      }
      return result;
    } catch (_) {
      return null;
    }
  }
}