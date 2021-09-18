import 'package:flutter/material.dart';
import 'package:flutter_common/common.dart';
import 'package:sdk/flutter_sdk.dart';

import '../../extensions/extensions.dart';
import '../../resources/resources.dart';
import '../../widget/widget.dart';
import 'need_to.dart';

class NeedToBuyPage extends StatefulWidget {
  const NeedToBuyPage({Key key}) : super(key: key);

  @override
  _NeedToBuyPageState createState() => _NeedToBuyPageState();
}

class _NeedToBuyPageState extends BaseState<NeedToBuyPage, BaseBloc> {
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController ??= PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget buildContent(BuildContext context) {
    return BackgroundIMGNeedTo(
      onClose: (){
        Navigator.pop(context);
      },
      stacks: [
        Positioned(
          top: Dimens.size62,
          left: MediaQuery.of(context).size.width / 2 - Dimens.size28,
          child: StepIndicatorBuy(
            pageController: _pageController,
          ),
        ),
        Positioned(
          top: Dimens.size64,
          right: Dimens.size16,
          child: Text(
            "CLEAR",
            style: themeData
                .textTheme.subtitle2.semiBold.size14.textWhite.letterSpacing0p6,
          ),
        ),
        Positioned(
          top: Dimens.size120,
          left: Dimens.size16,
          child: Text(
            "I need to",
            style: themeData
                .textTheme.caption.size14.regular.letterSpacing0p6.textWhite,
          ),
        ),
        const Positioned(
          top: Dimens.size112,
          right: Dimens.size16,
          child: ContainerOptionBuyRent(),
        ),
      ],
      child: Column(
        children: [
          Container(
            height: Dimens.size180,
            width: double.infinity,
          ),
          Expanded(
            child: PageView(
              allowImplicitScrolling: true,
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                NeedToBuyStepOnePage(pageController: _pageController,),
                NeedToBuyStepTwoPage(pageController: _pageController,),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  BaseBloc get bloc => null;
}
