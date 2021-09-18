import 'package:flutter/material.dart';
import 'package:flutter_common/common.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:value_pro/constants.dart';

import '../../resources/resources.dart';
import '../../extensions/extensions.dart';

class SearchWidget extends StatefulWidget {
  final String titleSearch;

  final Function(String) onSearch;

  final Function onCancel;

  final Radius radius;

  final String text;

  final bool autoFocus;

  final Color colorBackground;

  final bool isIconSearch;

  SearchWidget(this.titleSearch,
      {this.text = '',
      this.onSearch,
      this.onCancel,
      this.autoFocus = false,
      this.colorBackground = Colors.white,
      this.radius = Radius.zero,this.isIconSearch=true});

  @override
  _SearchWidgetState createState() => _SearchWidgetState();
}

class _SearchWidgetState extends State<SearchWidget> {
  final TextEditingController controller = TextEditingController();
  bool _showCancel = false;

  @override
  void didChangeDependencies() {
    controller.addListener(() {
      if (controller.text.isNotEmpty) {
        setState(() {
          _showCancel = true;
        });
      } else {
        setState(() {
          _showCancel = false;
        });
      }
    });
    // ignore: cascade_invocations
    controller.text=widget.text??'';
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final _theme = Theme.of(context);
    return Container(
    padding: UIHelper.horizontalEdgeInsets8,
      decoration: BoxDecoration(

        color: widget.colorBackground,
        border: Border.all(
          color: MyColors.primaryBlack.withOpacity(0.16),
        ),
        borderRadius: BorderRadius.circular(Dimens.size18),
      ),
      alignment: AlignmentDirectional.center,
      height: Dimens.size45,
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextField(
                autofocus: widget.autoFocus,
                onChanged: (val) {
                  setState(() {
                    if (val != null && val != "")
                      _showCancel = true;
                    else
                      _showCancel = false;
                  });
                  widget.onSearch?.call(val);
                },
                style: _theme
                    .textTheme.subtitle1.regular.letterSpacing0p6.textBlack.size14,
                controller: controller,
                textCapitalization: TextCapitalization.sentences,
                decoration: InputDecoration(

                  contentPadding: const EdgeInsets.symmetric(
                      vertical: Dimens.size12, horizontal: Dimens.size10),
                  hintText: widget.titleSearch,
                  suffixIcon: (widget.onCancel != null)
                      ? _showCancel
                          ? InkWell(
                              onTap: () {
                                widget.onCancel?.call();
                                controller.text = "";
                              },
                              child: Container(
                                width: Dimens.size20,
                                height: Dimens.size20,
                                margin: UIHelper.paddingAll12,
                                decoration: BoxDecoration(
                                    color: MyColors.primaryBlack.withOpacity(0.38),
                                    shape: BoxShape.circle),
                                child: const Center(
                                    child: Icon(
                                  Icons.clear,
                                  color: MyColors.primaryWhite,
                                  size: Dimens.size12,
                                )),
                              ),
                            )
                          : const SizedBox()
                      : const Center(),

                  hintStyle:
                      TextStyle(color: MyColors.primaryBlack.withOpacity(0.32),letterSpacing: 0.6),
                  enabledBorder:  const OutlineInputBorder(
                    borderSide: BorderSide(width: 0, color: Colors.transparent),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderSide: BorderSide(width: 0, color: Colors.transparent),
                  ),
                )),
          ),
          if (widget.isIconSearch) Image.asset(SVGConstants.icSearchLocation,color: MyColors.primary,) else UIHelper.emptyBox,
          const SizedBox(width: Dimens.size10),
        ],
      ),
    );
  }
}
