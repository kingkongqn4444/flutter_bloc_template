import 'package:flutter/material.dart';
import 'package:flutter_common/common.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../widget/widget.dart';
import '../../constants.dart';
import '../../resources/resources.dart';
import '../../extensions/extensions.dart';

class ContainerPriceRange extends StatefulWidget {
  @override
  _ContainerPriceRangeState createState() => _ContainerPriceRangeState();
}

class _ContainerPriceRangeState extends State<ContainerPriceRange>
    with TickerProviderStateMixin {
  ThemeData _themeData;

  bool _isExpanded = false;

  double _minValue = 0;

  double _maxValue = 1000000000;

  String _whereby = "";

  @override
  Widget build(BuildContext context) {
    _themeData = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {
            setState(() {
              _isExpanded = !_isExpanded;
            });
            print(_isExpanded);
          },
          child: Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Text(
                      "Price range",
                      style: _themeData.textTheme.subtitle2.size14.semiBold
                          .letterSpacing0p6.textBlack,
                    ),
                    UIHelper.horizontalBox8,
                    SvgPicture.asset(
                      !_isExpanded
                          ? SVGConstants.icDropUp
                          : SVGConstants.icDropDown,
                      color: MyColors.primary,
                    ),
                  ],
                ),
              ),
              Text(
                "$_whereby VND",
                style: _themeData.textTheme.caption.size12.regular
                    .letterSpacing0p6.textBlack38,
              ),
            ],
          ),
        ),
        _buildPriceBySlideRange(),
        _buildContainerChoose()
      ],
    );
  }

  Widget _buildPriceBySlideRange() {
    return AnimatedContainer(
      alignment: Alignment.topCenter,
      duration: UIHelper.duration500,
      width: double.infinity,
      height: !_isExpanded ? Dimens.size120 : 0,
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomSlideRange(
              minValue: 0,
              maxValue: 1000000000,
              maxDistance: 100000000000,
              callBack: (min, max) {
                setState(() {
                  _whereby = "";
                  _minValue = min;
                  _maxValue = max;
                });
              },
              initValue: [_minValue, _maxValue],
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    alignment: Alignment.centerLeft,
                    padding: UIHelper.horizontalEdgeInsets12,
                    width: double.infinity,
                    height: Dimens.size40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimens.size16),
                      border: Border.all(
                        color: MyColors.primaryBlack.withOpacity(0.16),
                      ),
                    ),
                    child: Text(
                      _minValue.formatCurrencyNoName,
                      style: _themeData.textTheme.subtitle2.size14.regular
                          .letterSpacing0p6.textBlack,
                    ),
                  ),
                ),
                Text(
                  " - ",
                  style: _themeData.textTheme.subtitle2.size14.regular
                      .letterSpacing0p6.textBlack,
                ),
                Expanded(
                  child: Container(
                    alignment: Alignment.centerLeft,
                    padding: UIHelper.horizontalEdgeInsets12,
                    width: double.infinity,
                    height: Dimens.size40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(Dimens.size16),
                      border: Border.all(
                        color: MyColors.primaryBlack.withOpacity(0.16),
                      ),
                    ),
                    child: Text(
                      _maxValue.formatCurrencyNoName,
                      style: _themeData.textTheme.subtitle2.size14.regular
                          .letterSpacing0p6.textBlack,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContainerChoose() {
    return Card(
      color: Colors.transparent,
      margin: const EdgeInsets.only(top: Dimens.size10),
      elevation: 0,
      child: AnimatedSize(
        vsync: this,
        alignment: Alignment.topCenter,
        duration: UIHelper.duration500,
        child: Container(
          width: double.infinity,
          height: _isExpanded ? null : 0,
          padding: const EdgeInsets.symmetric(
              horizontal: Dimens.size20, vertical: Dimens.size16),
          decoration: BoxDecoration(
            color: MyColors.primary.withOpacity(0.08),
            borderRadius:const BorderRadius.only(
              topRight: Radius.circular(Dimens.size24),
              bottomLeft: Radius.circular(Dimens.size24),
              bottomRight: Radius.circular(Dimens.size24),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildSelectIn(isM2: true),
              UIHelper.verticalBox12,
              _buildSelectIn(isM2: false),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSelectIn({@required bool isM2}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            Container(
              alignment: Alignment.center,
              width: Dimens.size40,
              height: Dimens.size40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Dimens.size16),
                color: MyColors.primaryWhite,
              ),
              child: SvgPicture.asset(
                  isM2 ? SVGConstants.icPriceInM2 : SVGConstants.icPriceInUnit),
            ),
            UIHelper.horizontalBox12,
            Text(
              isM2 ? "Theo m²" : "Theo Unit",
              style: _themeData.textTheme.subtitle2.size14.letterSpacing0p6
                  .textBlack.semiBold,
            ),
          ],
        ),
        UIHelper.verticalBox12,
        GridView.count(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            crossAxisCount: 2,
            childAspectRatio: 6,
            padding: const EdgeInsets.all(0),
            mainAxisSpacing: 4.0,
            crossAxisSpacing: 4.0,
            children: _values.map((String e) {
              return _buildItemSelectM2(
                  val: e,
                  onTap: () {
                    setState(() {
                      if (isM2) {
                        _whereby = "Theo m² • ";
                      } else
                        _whereby = "Theo Unit • ";
                    });
                  });
            }).toList()),
      ],
    );
  }

  Widget _buildItemSelectM2(
      {@required String val, bool isM2 = true, VoidCallback onTap}) {
    return InkWell(
      onTap: () {
        onTap?.call();
        _checkValueByString(val: val);
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            val ?? '-',
            style: _themeData
                .textTheme.subtitle2.size16.letterSpacing0p6.textBlack.medium,
          ),
          Text(
            isM2 ? " millions" : " billions",
            style: _themeData
                .textTheme.caption.size12.letterSpacing0p6.textBlack38.light,
          ),
        ],
      ),
    );
  }

  void _checkValueByString({String val}) {
    switch (val) {
      case "<2":
        setState(() {
          _minValue = 0;
          _maxValue = 2000000;
          _isExpanded = !_isExpanded;
        });
        break;
      case "2-3":
        setState(() {
          _minValue = 2000000;
          _maxValue = 3000000;
          _isExpanded = !_isExpanded;
        });
        break;
      case "3-5":
        setState(() {
          _minValue = 3000000;
          _maxValue = 5000000;
          _isExpanded = !_isExpanded;
        });
        break;
      case "5-7":
        setState(() {
          _minValue = 5000000;
          _maxValue = 7000000;
          _isExpanded = !_isExpanded;
        });
        break;
      case "7-10":
        setState(() {
          _minValue = 7000000;
          _maxValue = 10000000;
          _isExpanded = !_isExpanded;
        });
        break;
      case "10-15":
        setState(() {
          _minValue = 10000000;
          _maxValue = 15000000;
          _isExpanded = !_isExpanded;
        });
        break;
      case "15-20":
        setState(() {
          _minValue = 15000000;
          _maxValue = 20000000;
          _isExpanded = !_isExpanded;
        });
        break;
      case ">20":
        setState(() {
          _minValue = 20000000;
          _maxValue = 1000000000;
          _isExpanded = !_isExpanded;
        });
        break;
    }
  }

  List<String> _values = [
    "<2",
    "7-10",
    "2-3",
    "10-15",
    "3-5",
    "15-20",
    "5-7",
    ">20",
  ];
}
