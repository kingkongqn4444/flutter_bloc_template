import 'package:flutter/material.dart';
import 'package:flutter_common/common.dart';

import '../../resources/resources.dart';
import '../../extensions/extensions.dart';

class ContainerDontShow extends StatefulWidget {
  const ContainerDontShow({Key key}) : super(key: key);

  @override
  _ContainerDontShowState createState() => _ContainerDontShowState();
}

class _ContainerDontShowState extends State<ContainerDontShow> {
  ThemeData _themeData;

  List<String> _dontShowSelect = [];

  @override
  Widget build(BuildContext context) {
    _themeData = Theme.of(context);
    return ListView.builder(
      shrinkWrap: true,
      padding:const EdgeInsets.all(0),
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return _buildItem(
          title: _dontShows[index],
          isChoose: _dontShowSelect.contains(_dontShows[index]),
          onTap: () {
            setState(() {
              if (_dontShowSelect.contains(_dontShows[index]))
                _dontShowSelect
                    .removeWhere((element) => _dontShows[index] == element);
              else
                _dontShowSelect.add(_dontShows[index]);
            });
          },
        );
      },
      itemCount: _dontShows.length,
    );
  }

  Widget _buildItem(
      {@required String title, bool isChoose = false, VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: UIHelper.verticalEdgeInsets8,
        alignment: Alignment.centerLeft,
        height: Dimens.size42,
        padding: UIHelper.horizontalEdgeInsets16,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [
                MyColors.primaryTwo.withOpacity(isChoose ? 0.1 : 0),
                MyColors.primary.withOpacity(isChoose ? 0.1 : 0),
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp),
          borderRadius: BorderRadius.circular(Dimens.size16),
          border: Border.all(
            color: isChoose
                ? MyColors.primary.withOpacity(0.4)
                : MyColors.borderGray,
          ),
        ),
        child: Text(
          title ?? '--',
          style: _themeData.textTheme.subtitle2.size14
              .weight(isChoose ? FontWeight.w500 : FontWeight.w400)
              .letterSpacing0p6
              .textColor(
                isChoose
                    ? MyColors.primary
                    : MyColors.primaryBlack.withOpacity(0.38),
              ),
        ),
      ),
    );
  }

  /// dumyData
  List<String> _dontShows = [
    "House share",
    "Retirement home",
    "Student accommodation",
  ];
}
