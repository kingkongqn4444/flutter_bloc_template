import 'package:flutter/material.dart';
import 'package:flutter_common/common.dart';

import '../../constants.dart';
import '../widget.dart';

class ContainerPropertyTypeBuy extends StatefulWidget {
  const ContainerPropertyTypeBuy({Key key}) : super(key: key);

  @override
  _ContainerPropertyTypeBuyState createState() =>
      _ContainerPropertyTypeBuyState();
}

class _ContainerPropertyTypeBuyState extends State<ContainerPropertyTypeBuy> {
  List<int> _chooseIds = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: ItemPropertyType(
                isChoose: _chooseIds.contains(0),
                urlImg: ImageConstants.imgPropertyTypeAll,
                title: "All",
                onTap: () {
                  setState(() {
                    if (_chooseIds.contains(0)) {
                      _chooseIds.removeWhere((element) => element == 0);
                    } else
                      _chooseIds.add(0);
                  });
                },
              ),
            ),
            UIHelper.horizontalBox16,
            Expanded(
              child: ItemPropertyType(
                urlImg: ImageConstants.imgPropertyTypeParkHome,
                title: "Park home",
                isChoose: _chooseIds.contains(1),
                onTap: () {
                  setState(() {
                    if (_chooseIds.contains(1)) {
                      _chooseIds.removeWhere((element) => element == 1);
                    } else
                      _chooseIds.add(1);
                  });
                },
              ),
            ),
          ],
        ),
        UIHelper.verticalBox16,
        Row(
          children: [
            Expanded(
              child: ItemPropertyType(
                isChoose: _chooseIds.contains(2),
                urlImg: ImageConstants.imgPropertyTypeDetached,
                title: "Detached",
                onTap: () {
                  setState(() {
                    if (_chooseIds.contains(2)) {
                      _chooseIds.removeWhere((element) => element == 2);
                    } else
                      _chooseIds.add(2);
                  });
                },
              ),
            ),
            UIHelper.horizontalBox16,
            Expanded(
              child: ItemPropertyType(
                urlImg: ImageConstants.imgPropertyTypeSemiDetached,
                isChoose: _chooseIds.contains(3),
                title: "Semi - detached",
                onTap: () {
                  setState(() {
                    if (_chooseIds.contains(3)) {
                      _chooseIds.removeWhere((element) => element == 3);
                    } else
                      _chooseIds.add(3);
                  });
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
