import 'package:flutter/material.dart';
import 'package:flutter_common/common.dart';

import '../../resources/resources.dart';
import '../../extensions/extensions.dart';

class ContainerDirection extends StatefulWidget {
  const ContainerDirection({Key key}) : super(key: key);

  @override
  _ContainerDirectionState createState() => _ContainerDirectionState();
}

class _ContainerDirectionState extends State<ContainerDirection> {
  ThemeData _themeData;

  List<String> _select = [];

  @override
  Widget build(BuildContext context) {
    _themeData = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildItem(
              title: "House share",
              isChoose: _select.contains("House share"),
              onTap: () {
                setState(() {
                  if (_select.contains("House share"))
                    _select.removeWhere((element) => "House share" == element);
                  else
                    _select.add("House share");
                });
              },
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildItem(
              title: "North - west",
              isChoose: _select.contains("North - west"),
              onTap: () {
                setState(() {
                  if (_select.contains("North - west"))
                    _select.removeWhere((element) => "North - west" == element);
                  else
                    _select.add("North - west");
                });
              },
            ),
            UIHelper.horizontalBox16,
            _buildItem(
              title: "North - East",
              isChoose: _select.contains("North - East"),
              onTap: () {
                setState(() {
                  if (_select.contains("North - East"))
                    _select.removeWhere((element) => "North - East" == element);
                  else
                    _select.add("North - East");
                });
              },
            ),
          ],
        ),
        Row(
          children: [
            Expanded(
              child: _buildItem(
                title: "west",
                width: double.infinity,
                isChoose: _select.contains("west"),
                onTap: () {
                  setState(() {
                    if (_select.contains("west"))
                      _select.removeWhere((element) => "west" == element);
                    else
                      _select.add("west");
                  });
                },
              ),
            ),
            UIHelper.horizontalBox16,
            Expanded(
              child: _buildItem(
                title: "East",
                width: double.infinity,
                isChoose: _select.contains("East"),
                onTap: () {
                  setState(() {
                    if (_select.contains("East"))
                      _select.removeWhere((element) => "East" == element);
                    else
                      _select.add("East");
                  });
                },
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildItem(
              title: "south - west",
              isChoose: _select.contains("south - west"),
              onTap: () {
                setState(() {
                  if (_select.contains("south - west"))
                    _select.removeWhere((element) => "south - west" == element);
                  else
                    _select.add("south - west");
                });
              },
            ),
            UIHelper.horizontalBox16,
            _buildItem(
              title: "South - East",
              isChoose: _select.contains("South - East"),
              onTap: () {
                setState(() {
                  if (_select.contains("South - East"))
                    _select.removeWhere((element) => "South - East" == element);
                  else
                    _select.add("South - East");
                });
              },
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildItem(
              title: "south - west",
              isChoose: _select.contains("south - west"),
              onTap: () {
                setState(() {
                  if (_select.contains("south - west"))
                    _select.removeWhere((element) => "south - west" == element);
                  else
                    _select.add("south - west");
                });
              },
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildItem(
      {@required String title,
      bool isChoose = false,
      VoidCallback onTap,
      double width}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: UIHelper.verticalEdgeInsets8,
        alignment: width != null ? Alignment.center : Alignment.centerLeft,
        height: Dimens.size42,
        width: width,
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
              .weight(isChoose ? FontWeight.w400 : FontWeight.w300)
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
}
