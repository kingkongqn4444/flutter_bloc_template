import 'package:flutter/material.dart';
import 'package:flutter_common/common.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_xlider/flutter_xlider.dart';

import '../../resources/resources.dart';
import '../../constants.dart';

class CustomSlideRange extends StatelessWidget {
  final double minValue;
  final double maxValue;
  final List<double> initValue;
  final double minDistance;
  final double maxDistance;
  final Function(double, double) callBack;

  // ignore: sort_constructors_first
  const CustomSlideRange(
      {@required this.minValue,
      @required this.maxValue,
      this.initValue,
      this.minDistance = 1,
      this.maxDistance = 1000,
      this.callBack});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: UIHelper.horizontalEdgeInsets4,
      child: FlutterSlider(
        values: initValue ?? [minValue ?? 0, maxValue ?? 10],
        max: maxValue ?? 10,
        min: minValue ?? 0,
        maximumDistance: maxDistance,
        minimumDistance: minDistance,
        rangeSlider: true,
        rtl: false,
        handlerAnimation: const FlutterSliderHandlerAnimation(
            curve: Curves.elasticOut,
            reverseCurve: Curves.bounceIn,
            duration: UIHelper.duration250,
            scale: 1
        ),
        handler: FlutterSliderHandler(
          child: _buildButton(),
        ),
        rightHandler: FlutterSliderHandler(
          child:_buildButton(),
        ),
        tooltip: null,
        trackBar: FlutterSliderTrackBar(
          inactiveTrackBarHeight: Dimens.size8,
          activeTrackBarHeight: Dimens.size8,
          inactiveTrackBar: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimens.size350),
            color: MyColors.primaryWhite,
          ),
          activeTrackBar: BoxDecoration(
            borderRadius: BorderRadius.circular(Dimens.size350),
            gradient: const LinearGradient(
                colors: [
                  MyColors.primaryTwo,
                  MyColors.primary,
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
                stops: [0.0, 1.0],
                tileMode: TileMode.clamp),
          ),
        ),
        onDragging: (handlerIndex, lowerValue, upperValue) {
          callBack?.call(lowerValue, upperValue);
        },
      ),
    );
  }

  Widget _buildButton(){
    return  Material(
      type: MaterialType.canvas,
      color: Colors.transparent,
      elevation: 0,
      child: Container(
        width: Dimens.size42,
        height: Dimens.size42,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
              colors: [
                MyColors.primaryTwo,
                MyColors.primary,
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp),
          shape: BoxShape.circle,
          border:
          Border.all(color: MyColors.primaryWhite, width: Dimens.size2),
          boxShadow: [
            BoxShadow(
              color: MyColors.primary.withOpacity(0.4),
              spreadRadius: 1,
              blurRadius: 6,
              offset: Offset(0, 2), // changes position of shadow
            ),
          ],
        ),
        child: SvgPicture.asset(SVGConstants.icSlideRange,width: Dimens.size16,),
      ),
    );
  }
}
