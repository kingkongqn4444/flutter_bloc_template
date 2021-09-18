import 'package:flutter/material.dart';
import 'package:flutter_common/common.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../widget/widget.dart';
import '../../constants.dart';
import '../../resources/resources.dart';
import '../../extensions/extensions.dart';

class ContainerArea extends StatefulWidget {
  const ContainerArea({Key key}) : super(key: key);

  @override
  _ContainerAreaState createState() => _ContainerAreaState();
}

class _ContainerAreaState extends State<ContainerArea>
    with TickerProviderStateMixin {
  ThemeData _themeData;

  bool _isExpanded = false;

  double _minValue = 0;

  double _maxValue = 700;

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
          },
          child: Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Text(
                      "Area",
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
                "m²",
                style: _themeData.textTheme.caption.size12.regular
                    .letterSpacing0p6.textBlack38,
              ),
            ],
          ),
        ),
        _buildAreBySlideRange(),
        _buildContainerChoose()
      ],
    );
  }

  Widget _buildAreBySlideRange() {
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
              maxValue: 700,
              maxDistance: 800,
              callBack: (min, max) {
                setState(() {
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
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(Dimens.size24),
              bottomLeft: Radius.circular(Dimens.size24),
              bottomRight: Radius.circular(Dimens.size24),
            ),
          ),
          child: GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              childAspectRatio: 6,
              padding: const EdgeInsets.all(0),
              mainAxisSpacing: 4.0,
              crossAxisSpacing: 4.0,
              children: _values.map((String e) {
                return _buildItemSelect(val: e);
              }).toList()),
        ),
      ),
    );
  }

  Widget _buildItemSelect({@required String val}) {
    return InkWell(
      onTap: () {
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
            " m²",
            style: _themeData
                .textTheme.caption.size12.letterSpacing0p6.textBlack38.light,
          ),
        ],
      ),
    );
  }

  void _checkValueByString({String val}) {
    switch (val) {
      case "<30":
        setState(() {
          _minValue = 0;
          _maxValue = 30;
          _isExpanded = !_isExpanded;
        });
        break;
      case "30-50":
        setState(() {
          _minValue = 30;
          _maxValue = 50;
          _isExpanded = !_isExpanded;
        });
        break;
      case "50-80":
        setState(() {
          _minValue = 50;
          _maxValue = 80;
          _isExpanded = !_isExpanded;
        });
        break;
      case "80-100":
        setState(() {
          _minValue = 80;
          _maxValue = 100;
          _isExpanded = !_isExpanded;
        });
        break;
      case "100-150":
        setState(() {
          _minValue = 100;
          _maxValue = 150;
          _isExpanded = !_isExpanded;
        });
        break;
      case "150-300":
        setState(() {
          _minValue = 150;
          _maxValue = 300;
          _isExpanded = !_isExpanded;
        });
        break;
      case "300-500":
        setState(() {
          _minValue = 300;
          _maxValue = 500;
          _isExpanded = !_isExpanded;
        });
        break;
      case ">500":
        setState(() {
          _minValue = 500;
          _maxValue = 700;
          _isExpanded = !_isExpanded;
        });
        break;
    }
  }

  List<String> _values = [
    "<30",
    "100-150",
    "30-50",
    "150-300",
    "50-80",
    "300-500",
    "80-100",
    ">500",
  ];
}
