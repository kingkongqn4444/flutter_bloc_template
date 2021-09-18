import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:value_pro/router/router.dart';

import '../../constants.dart';
import '../../resources/resources.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();
    await Future.delayed(Duration(seconds: DimensInt.size2), () {
      Navigator.pushNamedAndRemoveUntil(context, Routes.onBroadPage, (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              ImageConstants.imgBGSplash,
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: SvgPicture.asset(
            SVGConstants.appLogo,
            width: Dimens.size220,
          ),
        ),
      ),
    );
  }
}
