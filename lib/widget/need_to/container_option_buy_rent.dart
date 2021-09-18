import 'package:flutter/material.dart';
import 'package:flutter_common/common.dart';

import '../../resources/resources.dart';
import '../../extensions/extensions.dart';

class ContainerOptionBuyRent extends StatefulWidget {
  const ContainerOptionBuyRent({Key key}) : super(key: key);

  @override
  _ContainerOptionBuyRentState createState() => _ContainerOptionBuyRentState();
}

class _ContainerOptionBuyRentState extends State<ContainerOptionBuyRent> {
  bool _isBuy = true;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: Dimens.size112,
          height: Dimens.size36,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimens.size16),
            border: Border.all(
              color: MyColors.primaryWhite.withOpacity(0.38),
            ),
          ),
        ),
        AnimatedPositioned(
            left: _isBuy ? 0 : Dimens.size56,
            top: 0,
            child: AnimatedContainer(
              duration: UIHelper.duration150,
              width: Dimens.size56,
              height: Dimens.size36,
              decoration: BoxDecoration(
                color: MyColors.primaryWhite,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(Dimens.size16),
                  topRight: Radius.circular(Dimens.size16),
                  bottomLeft: Radius.circular(_isBuy ? Dimens.size16 : 0),
                  bottomRight: Radius.circular(_isBuy ? 0 : Dimens.size16),
                ),
              ),
            ),
            duration: UIHelper.duration150),
        Container(
          alignment: Alignment.center,
          width: Dimens.size112,
          height: Dimens.size36,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimens.size16),
            color: Colors.transparent,
          ),
          child: Row(
            children: [
              _buildText(
                  title: "Buy",
                  onTap: () {
                    setState(() {
                      _isBuy = true;
                    });
                  },
                  isChoose: _isBuy),
              _buildText(
                  title: "Rent",
                  onTap: () {
                    setState(() {
                      _isBuy = false;
                    });
                  },
                  isChoose: !_isBuy),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildText({String title, VoidCallback onTap, bool isChoose = false}) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Text(
          title ?? "--",
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .caption
              .size14
              .letterSpacing0p6
              .weight(isChoose ? FontWeight.w600 : FontWeight.w400)
              .textColor(
                isChoose
                    ? MyColors.primary
                    : MyColors.primaryWhite.withOpacity(0.6),
              ),
        ),
      ),
    );
  }
}
