import 'package:flutter/material.dart';
import 'package:flutter_common/common.dart';
import 'package:sdk/flutter_sdk.dart';

import '../../extensions/extensions.dart';
import '../../pages/pages.dart';
import '../../resources/resources.dart';
import '../../widget/widget.dart';

class NeedToPage extends StatefulWidget {
  const NeedToPage({Key key}) : super(key: key);

  @override
  _NeedToPageState createState() => _NeedToPageState();
}

class _NeedToPageState extends BaseState<NeedToPage,BaseBloc> {
  ThemeData _themeData;
  @override
  Widget build(BuildContext context) {
    _themeData = Theme.of(context);
    return Scaffold(
        body: BackgroundIMGNeedTo(
          padding: UIHelper.horizontalEdgeInsets16,
      onClose: (){
            Navigator.pop(context);
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'I need to',
            style: _themeData.textTheme.headline6.size20.regular
                .letterSpa(0.6)
                .textWhite,
          ),
          UIHelper.verticalBox24,
          Row(
            children: [
              Expanded(
                child: _buildButtonChoose(title: 'Buy',onTap: (){
                  nextPageBottomToTop(const NeedToBuyPage());
                }),
              ),
              UIHelper.horizontalBox16,
              Expanded(
                child: _buildButtonChoose(title: 'Rent',onTap: (){
                  nextPageBottomToTop(const InfoProjectPage());
                }),
              ),
            ],
          ),
        ],
      ),
    ));
  }

  Widget _buildButtonChoose({@required String title, VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: double.infinity,
        height: Dimens.size40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimens.size16),
          border: Border.all(color: MyColors.borderGray.withOpacity(0.38),),
        ),
        child: Text(
          title ?? '--',
          style: _themeData
              .textTheme.bodyText2.size14.medium.letterSpacing0p6.textWhite,
        ),
      ),
    );
  }

  @override
  BaseBloc get bloc => null;
}

