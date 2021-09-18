import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingDialog extends StatelessWidget {
  static bool isOpen = false;

  static Future show(BuildContext context, {Function method}) async {
    if (isOpen) {
      close(context);
      return;
    }

    isOpen = true;
    showDialog(
        context: context,
        barrierDismissible: false,
        useRootNavigator: true,
        builder: (BuildContext context) => LoadingDialog());
  }

  static void close(BuildContext context) {
    if (!isOpen) {
      return;
    }
    Navigator.pop(context);
    isOpen = false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Dialog(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        child: Center(
          child: SpinKitRing(
            color: Theme.of(context).primaryColor,
            size: 50,
            lineWidth: 4,
          ),
        ),
      ),
    );
  }
}
