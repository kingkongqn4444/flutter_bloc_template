import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../app_localizations/app_localizations.dart';

class LoadingWidget extends StatelessWidget {
  final String titleKeyStr;

  LoadingWidget({this.titleKeyStr});

  @override
  Widget build(BuildContext context) {
    var localizations = AppLocalizations.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: SpinKitRing(
            color: Theme.of(context).primaryColor,
            size: 50,
            lineWidth: 4,
          ),
        ),
        if (titleKeyStr?.isNotEmpty == true) ...[
          const SizedBox(),
          Center(
            child: Text(
              titleKeyStr.isNotEmpty ? localizations.text(titleKeyStr) : '',
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ),
        ]
      ],
    );
  }
}
