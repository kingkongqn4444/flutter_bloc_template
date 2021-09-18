import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'app.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'dependencies/app_dependencies.dart';

void main() async {
//  LicenseRegistry.addLicense(() async* {
//    final license = await rootBundle.loadString('assets/licenses/OFL_SFPro.txt');
//    yield LicenseEntryWithLineBreaks(['google_fonts'], license);
//  });
  WidgetsFlutterBinding.ensureInitialized();
  await AppDependencies.init();
  await SharedPreferences.getInstance();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent));

  /// Firebase notification

  runApp(MyApp());
}
