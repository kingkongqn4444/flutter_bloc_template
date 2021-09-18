import 'package:flutter/material.dart';
import 'package:flutter_common/common.dart';

import '../../constants.dart';
import '../../resources/resources.dart';
import '../widget.dart';

class BackgroundIMGNeedTo extends StatelessWidget {
  final Widget child;
  final EdgeInsetsGeometry padding;
  final List<Widget> stacks;
  final VoidCallback onClose;

  BackgroundIMGNeedTo({@required this.child, this.padding,this.stacks,this.onClose});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          alignment: Alignment.center,
          padding: padding ,
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: const AssetImage(ImageConstants.imgBGNeedTo),fit: BoxFit.fill,
            ),
          ),
          child: child ?? UIHelper.emptyBox,
        ),
        Positioned(
          top: Dimens.size56,
          left: Dimens.size16,
          child: CircleButton(
            onTap: onClose,
            radius: Dimens.size16,

          ),
        ),
        ...stacks??[UIHelper.emptyBox],
      ],
    );
  }
}
