import 'package:flutter/material.dart';
import 'package:flutter_common/common.dart';

import '../../resources/resources.dart';
import '../../extensions/extensions.dart';

class StepIndicatorBuy extends StatefulWidget {
  final PageController pageController;

  StepIndicatorBuy({@required this.pageController});

  @override
  _StepIndicatorBuyState createState() => _StepIndicatorBuyState();
}

class _StepIndicatorBuyState extends State<StepIndicatorBuy> {
  double _page;

  @override
  void initState() {
    _page = Dimens.size0;
    super.initState();
  }

  @override
  void didChangeDependencies() {
    widget.pageController.addListener(() {
      setState(() {
        _page = widget.pageController.page;
      });
      print(_page);
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);

    return Container(
      width: Dimens.size56,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '${_page.toInt() + 1}',
                style: _theme.textTheme.caption.bold.letterSpacing0p6.textWhite,
              ),
              Text(
                " /2",
                style: _theme.textTheme.caption.regular.letterSpacing0p6.textColor(
                  _theme.cardColor.withOpacity(0.6),
                ),
              )
            ],
          ),
          UIHelper.verticalBox4,
          Stack(
            children: [
              Container(
                width: Dimens.size56,
                height: Dimens.size4,
                decoration: BoxDecoration(
                  color: MyColors.primaryWhite.withOpacity(0.32),
                  borderRadius: BorderRadius.circular(Dimens.size180),
                ),
              ),
              AnimatedContainer(
                duration: UIHelper.duration150,
                width: Dimens.size56,
                height: Dimens.size4,
                margin: EdgeInsets.only(right: (1-_page)*Dimens.size28,),
                decoration: BoxDecoration(
                  color: MyColors.primaryWhite,
                  borderRadius: BorderRadius.circular(Dimens.size180),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
