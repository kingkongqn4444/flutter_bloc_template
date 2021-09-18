import 'package:flutter/material.dart';
import 'package:flutter_common/common.dart';

import '../../resources/resources.dart';
import '../../extensions/extensions.dart';

class ContainerNumberOfRoom extends StatefulWidget {
  const ContainerNumberOfRoom({Key key}) : super(key: key);

  @override
  _ContainerNumberOfRoomState createState() => _ContainerNumberOfRoomState();
}

class _ContainerNumberOfRoomState extends State<ContainerNumberOfRoom> {
  ThemeData _themeData;

  String _bedRoom = '';
  String _bathRoom = '';

  @override
  Widget build(BuildContext context) {
    _themeData = Theme.of(context);
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(top: Dimens.size8, left: Dimens.size12),
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(
            color: MyColors.primaryBlack.withOpacity(0.12),
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          _buildRoom(
              title: "Bedroom",
              room: _bedRoom,
              callback: (val) {
                setState(() {
                  _bedRoom = val;
                });
              }),
          UIHelper.verticalBox16,
          _buildRoom(
              title: "Bathroom",
              room: _bathRoom,
              callback: (val) {
                setState(() {
                  _bathRoom = val;
                });
              }),
        ],
      ),
    );
  }

  Widget _buildRoom({String title, String room, Function(String) callback}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          title ?? '',
          style: _themeData.textTheme.caption.size12.letterSpacing0p6.medium.textBlack,
        ),
        UIHelper.verticalBox8,
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: _numbers
                .map((e) => _buildItem(
                    title: e,
                    isChoose: room == e,
                    onTap: () {
                      callback?.call(e);
                    }))
                .toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildItem(
      {@required String title, bool isChoose = false, VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        height: Dimens.size45,
        width: Dimens.size45,
        margin: const EdgeInsets.only(right: Dimens.size12),
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
          title ?? '-',
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
  List<String> _numbers = [
    "1",
    "2",
    "3",
    "4",
    "5+",
  ];
}
