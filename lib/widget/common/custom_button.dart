import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_common/common.dart';

import '../../resources/resources.dart';
import '../../extensions/extensions.dart';

class CircleButtonOutline extends StatelessWidget {
  final VoidCallback onTap;
  // ignore: non_constant_identifier_names
  final String SVGUrl;
  final Color colorIcon;
  final double size;
  final Color colorOutline;

  CircleButtonOutline(
      {this.onTap, this.colorIcon, this.SVGUrl, this.size, this.colorOutline});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: size ?? Dimens.size56,
        height: size ?? Dimens.size56,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: colorOutline ?? MyColors.primary),
        ),
        child: SVGUrl != null
            ? SvgPicture.asset(
                SVGUrl,
                color: colorIcon ?? MyColors.primaryWhite,
              )
            : Icon(
                Icons.keyboard_backspace,
                color: MyColors.primary,
              ),
      ),
    );
  }
}

class CircleButtonGradient extends StatelessWidget {
  final VoidCallback onTap;
  final String SVGUrl;
  final Color colorIcon;
  final double size;

  CircleButtonGradient(
      {this.onTap,
      this.size,
      this.colorIcon = MyColors.primaryWhite,
      @required this.SVGUrl});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: size ?? Dimens.size56,
        height: size ?? Dimens.size56,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: LinearGradient(
              colors: [
                MyColors.primaryTwo,
                MyColors.primary,
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp),
          boxShadow: [
            BoxShadow(
              color: MyColors.primary.withOpacity(0.4),
              spreadRadius: 2,
              blurRadius: 6,
              offset: Offset(0, 2), // changes position of shadow
            ),
          ],
        ),
        child: SVGUrl != null
            ? SvgPicture.asset(
                SVGUrl,
                color: colorIcon ?? MyColors.primaryWhite,
              )
            : Icon(
                Icons.trending_neutral,
                color: MyColors.primaryWhite,
              ),
      ),
    );
  }
}

class ButtonGradient extends StatelessWidget {
  final VoidCallback onTap;
  final String title;
  final Color colorTitle;
  final double height;
  final double width;

  ButtonGradient(
      {this.onTap,
      this.width,
      this.height,
      this.colorTitle,
      @required this.title});

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: width ?? double.infinity,
        height: height ?? Dimens.size48,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimens.size16),
          gradient: LinearGradient(
              colors: [
                MyColors.primaryTwo,
                MyColors.primary,
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp),
          boxShadow: [
            BoxShadow(
              color: MyColors.primary.withOpacity(0.35),
              spreadRadius: 1,
              blurRadius: 6,
              offset: Offset(0, 4), // changes position of shadow
            ),
          ],
        ),
        child: Text(
          title ?? "--",
          style: _theme.textTheme.subtitle2.size14.semiBold
              .textColor(colorTitle ?? MyColors.primaryWhite),
        ),
      ),
    );
  }
}

class CircleButton extends StatelessWidget {
  final VoidCallback onTap;
  final IconData icon;
  final Color colorIcon;
  final double size;
  final Color colorButton;
  final double sizeIcon;
  final double radius;

  CircleButton(
      {this.onTap,
      this.size,
      this.colorButton,
      this.sizeIcon,
      this.radius = Dimens.size100,
      this.colorIcon = MyColors.primaryBlack,
      @required this.icon});

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        width: size ?? Dimens.size36,
        height: size ?? Dimens.size36,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
          color: colorButton ?? _theme.cardColor,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: Dimens.size2,
              blurRadius: Dimens.size4,
              offset: Offset(0, Dimens.size2), // changes position of shadow
            ),
          ],
        ),
        child: Icon(
          icon ?? Icons.close,
          color: colorIcon,
          size: sizeIcon,
        ),
      ),
    );
  }
}
