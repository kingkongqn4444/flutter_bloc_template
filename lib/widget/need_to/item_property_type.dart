import 'package:flutter/material.dart';
import 'package:flutter_common/common.dart';

import '../../resources/resources.dart';
import '../../extensions/extensions.dart';

class ItemPropertyType extends StatelessWidget {
  final String title;
  final String urlImg;
  final bool isChoose;
  final VoidCallback onTap;

  ItemPropertyType(
      {@required this.title,
      @required this.urlImg,
      this.isChoose = false,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    return InkWell(
      onTap: onTap,
      child: Stack(
        alignment: Alignment.centerLeft,
        children: [
          Container(
            height: Dimens.size56,
            width: double.infinity,
            child: Row(
              children: [
                UIHelper.horizontalBox12,
                Expanded(
                  child: Container(
                    alignment: Alignment.centerLeft,
                    width: double.infinity,
                    padding: const EdgeInsets.fromLTRB(Dimens.size50,
                        Dimens.size6, Dimens.size16, Dimens.size6),
                    height: double.infinity,
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
                      style: _theme.textTheme.subtitle2.size14
                          .weight(isChoose ? FontWeight.w500 : FontWeight.w400)
                          .letterSpacing0p6
                          .textColor(
                            isChoose
                                ? MyColors.primary
                                : MyColors.primaryBlack.withOpacity(0.38),
                          ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          _buildIconHeader(),
        ],
      ),
    );
  }

  Widget _buildIconHeader() {
    return Container(
      width: Dimens.size56,
      height: Dimens.size56,
      padding: UIHelper.paddingAll12,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: MyColors.primaryWhite,
        boxShadow: !isChoose
            ? null
            : [
              BoxShadow(
                  color: MyColors.primary.withOpacity(0.15),
                  spreadRadius: 1,
                  blurRadius: 10,
                  offset: Offset(-2, 6), // changes position of shadow
                )
              ],
      ),
      child:Image.asset(urlImg ?? ''),
    );
  }
}
