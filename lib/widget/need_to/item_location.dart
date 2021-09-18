import 'package:data/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_common/common.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../extensions/extensions.dart';
import '../../constants.dart';

class ItemSelectHistoryLocation extends StatelessWidget {
  final ResultSearchLocationModel model;
  final VoidCallback callBack;
  final VoidCallback onDelete;

  ItemSelectHistoryLocation(
      {@required this.model, this.callBack, this.onDelete});

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);

    String _svg;
    switch (model?.type) {
      case ResultSearchLocation.building:
        _svg = SVGConstants.icBuilding;
        break;
      case ResultSearchLocation.location:
        _svg = SVGConstants.icLocation;
        break;
      case ResultSearchLocation.home:
        _svg = SVGConstants.icHome;
        break;
      default:
        _svg = SVGConstants.icHome;
        break;
    }
    return Padding(
      padding: UIHelper.verticalEdgeInsets8,
      child: Row(
        children: [
          SvgPicture.asset(_svg),
          UIHelper.horizontalBox16,
          Expanded(
            child: InkWell(
              onTap: callBack,
              child: Text(
                model?.title ?? '--',
                style: _theme.textTheme.subtitle2.regular.size14
                    .letterSpacing0p6.textBlack,
              ),
            ),
          ),
          UIHelper.horizontalBox16,
          InkWell(
            onTap: onDelete,
            child: SvgPicture.asset(SVGConstants.icClose),
          ),
        ],
      ),
    );
  }
}

class ItemSearchLocation extends StatelessWidget {
  final ResultSearchLocationModel model;
  final VoidCallback callBack;

  ItemSearchLocation({@required this.model, this.callBack});

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    String _svg;
    switch (model?.type) {
      case ResultSearchLocation.building:
        _svg = SVGConstants.icBuilding;
        break;
      case ResultSearchLocation.location:
        _svg = SVGConstants.icLocation;
        break;
      case ResultSearchLocation.home:
        _svg = SVGConstants.icHome;
        break;
      default:
        _svg = SVGConstants.icLocation;
        break;
    }
    return Padding(
      padding: UIHelper.verticalEdgeInsets8,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(_svg),
          UIHelper.horizontalBox16,
          Text(
            model?.title ?? '--',
            style: _theme
                .textTheme.subtitle2.regular.size14.letterSpacing0p6.textBlack,
          ),
          Text(
            " • ",
            style: _theme.textTheme.subtitle2.regular.size14.letterSpacing0p6
                .textBlack38,
          ),
          Expanded(
            child: Text(
              model?.subTitle ?? '--',
              style: _theme.textTheme.subtitle2.regular.size14.letterSpacing0p6
                  .textBlack38,
            ),
          ),
        ],
      ),
    );
  }
}
