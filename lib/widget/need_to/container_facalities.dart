import 'package:flutter/material.dart';
import 'package:flutter_common/common.dart';

import '../../resources/resources.dart';
import '../../extensions/extensions.dart';

class ContainerFacilities extends StatefulWidget {
  const ContainerFacilities({Key key}) : super(key: key);

  @override
  _ContainerFacilitiesState createState() => _ContainerFacilitiesState();
}

class _ContainerFacilitiesState extends State<ContainerFacilities> {
  ThemeData _themeData;

  List<String> _facilitiesSelect = [];

  @override
  Widget build(BuildContext context) {
    _themeData = Theme.of(context);
    return Container(
      width: double.infinity,
      child: Wrap(
        spacing:Dimens.size8,
        runSpacing: Dimens.size8,
        children: _facilities
            .map(
              (e) => _buildItem(
                title: e,
                isChoose: _facilitiesSelect.contains(e),
                onTap: () {
                  setState(() {
                    if (_facilitiesSelect.contains(e))
                      _facilitiesSelect.removeWhere((element) => e == element);
                    else
                      _facilitiesSelect.add(e);
                  });
                },
              ),
            )
            .toList(),
      ),
    );
  }

  Widget _buildItem(
      {@required String title, bool isChoose = false, VoidCallback onTap}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: Dimens.size40,
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
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
          ],
        ),
      ),
    );
  }

  /// dumyData
  List<String> _facilities = [
    "Dining room",
    "Bathub",
    "TV room",
    "Bedroom",
    "Kitchen",
    "Drawing room",
    "Basin",
    "Bathroom",
    "Dressing room",
  ];
}
