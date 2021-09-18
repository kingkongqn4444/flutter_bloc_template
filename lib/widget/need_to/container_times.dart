import 'package:flutter/material.dart';
import 'package:flutter_common/common.dart';

import '../../resources/resources.dart';
import '../../extensions/extensions.dart';

class ContainerTimes extends StatefulWidget {
  const ContainerTimes({Key key}) : super(key: key);

  @override
  _ContainerTimesState createState() => _ContainerTimesState();
}

class _ContainerTimesState extends State<ContainerTimes> {
  ThemeData _themeData;

  String _stringTime = '';

  @override
  Widget build(BuildContext context) {
    _themeData = Theme.of(context);
    return GridView.count(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: 2,
      padding:const EdgeInsets.all(0),
      childAspectRatio: (MediaQuery.of(context).size.width/2-Dimens.size48)/Dimens.size40,
      mainAxisSpacing: Dimens.size16,
      crossAxisSpacing: Dimens.size16,
      children: _times
          .map(
            (e) => _buildItem(
              title: e,
              isChoose: e == _stringTime,
              onTap: () {
                setState(() {
                  _stringTime = e;
                });
              },
            ),
          )
          .toList(),
    );
  }

  Widget _buildItem(
      {@required String title, bool isChoose = false, VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: Dimens.size40,
        padding: UIHelper.horizontalEdgeInsets16,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [
                isChoose ? MyColors.primaryTwo : _themeData.cardColor,
                isChoose ? MyColors.primary : _themeData.cardColor,
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp),
          borderRadius: BorderRadius.circular(Dimens.size16),
        ),
        child: Text(
          title ?? '--',
          style: _themeData.textTheme.subtitle2.size14
              .weight(isChoose ? FontWeight.w500 : FontWeight.w400)
              .letterSpacing0p6
              .textColor(
                isChoose
                    ? MyColors.primaryWhite
                    : MyColors.primaryBlack.withOpacity(0.38),
              ),
        ),
      ),
    );
  }

  /// dumyData
  List<String> _times = [
    "Any time",
    "Last 24 hours",
    "Last 3 hours",
    "Last 7 days",
    "Last 14 days",
  ];
}
