import 'package:flutter/material.dart';
import 'package:flutter_common/common.dart';

import '../../extensions/extensions.dart';
import '../../resources/resources.dart';

class ReadMoreText extends StatefulWidget {
  final String text;
  final int maxLines;
  final TextStyle textStyle;
  final TextStyle textStyleButton;
  ReadMoreText(
      {@required this.text,
      this.textStyle,
      this.textStyleButton,
      this.maxLines = 5});

  @override
  _ReadMoreTextState createState() => _ReadMoreTextState();
}

class _ReadMoreTextState extends State<ReadMoreText>
    with TickerProviderStateMixin {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    return LayoutBuilder(
      builder: (context, size) {
        final span = TextSpan(
            text: widget.text,
            style: widget.textStyle ??
                _theme.textTheme.subtitle2.size14.regular
                    .letterSpa(0.6)
                    .textBlack60);
        final tp = TextPainter(
            text: span,
            textDirection: TextDirection.ltr,
            maxLines: widget.maxLines);
        tp.layout(maxWidth: size.maxWidth);
        if (tp.didExceedMaxLines) {
          return Column(
            children: <Widget>[
              AnimatedSize(
                vsync: this,
                alignment: Alignment.topCenter,
                duration: UIHelper.duration500,
                curve: Curves.fastLinearToSlowEaseIn,
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Container(
                      child: Text(
                        widget.text,
                        style: widget.textStyle ??
                            _theme.textTheme.subtitle2.size14.regular
                                .letterSpa(0.6)
                                .textBlack60,
                        maxLines: _isExpanded ? null : widget.maxLines,
                      ),
                    ),
                    if (!_isExpanded)
                      Container(
                        width: double.infinity,
                        height: Dimens.size22,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                              colors: [
                                MyColors.scaffoldBackgroundColor
                                    .withOpacity(0.5),
                                MyColors.scaffoldBackgroundColor,
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              stops: [0.0, 1.0],
                              tileMode: TileMode.clamp),
                        ),
                      )
                    else
                      UIHelper.emptyBox,
                  ],
                ),
              ),
              UIHelper.verticalBox6,
              InkWell(
                onTap: () {
                  setState(() {
                    _isExpanded = !_isExpanded;
                  });
                },
                child: Text(
                  '${_isExpanded ? 'Show less' : 'Read more'}',
                  style: widget.textStyleButton ??
                      _theme.textTheme.subtitle2.size14.semiBold
                          .letterSpa(0.6)
                          .textPrimary,
                ),
              ),
            ],
          );
        } else {
          return Text(
            widget.text,
            style: widget.textStyle ??
                _theme.textTheme.subtitle2.size14.regular
                    .letterSpa(0.6)
                    .textBlack60,
          );
        }
      },
    );
  }
}
