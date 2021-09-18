import 'package:flutter/material.dart';
import 'package:flutter_common/common.dart';
import 'package:rxdart/rxdart.dart';

import '../../extensions/extensions.dart';
import '../../resources/resources.dart';
import '../widget.dart';

class HeaderInfo extends StatefulWidget {
  final ScrollController scrollController;

  HeaderInfo({@required this.scrollController});

  @override
  _HeaderInfoState createState() => _HeaderInfoState();
}

class _HeaderInfoState extends State<HeaderInfo> {
  BehaviorSubject<double> _scrollOffset;

  ThemeData _themeData;

  @override
  void initState() {
    super.initState();
    _scrollOffset = BehaviorSubject<double>.seeded(Dimens.size220);

    widget.scrollController.addListener(() {
      if (Dimens.size220 - widget.scrollController.offset >= Dimens.size110 &&
          Dimens.size220 - widget.scrollController.offset <= Dimens.size220) {
        _scrollOffset.add(Dimens.size220 - widget.scrollController.offset);
      }
      if (widget.scrollController.offset > Dimens.size220) {
        _scrollOffset.add(Dimens.size110);
      }
      if (widget.scrollController.offset <= Dimens.size1) {
        _scrollOffset.add(Dimens.size220);
      }
    });
  }

  @override
  void dispose() {
    _scrollOffset.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _themeData = Theme.of(context);
    return Stack(
      children: [
        StreamBuilder<double>(
            stream: _scrollOffset,
            builder: (context, snapshot) {
              return AnimatedContainer(
                duration: UIHelper.duration150,
                height: snapshot.data,
                constraints: const BoxConstraints(
                  maxHeight: Dimens.size220,
                  minHeight: Dimens.size110,
                ),
                width: double.infinity,
              );
            }),
        Positioned(
          top: Dimens.size56,
          left: Dimens.size16,
          child: CircleButton(
            radius: Dimens.size16,
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ),
        _buildNameProject(),
        Positioned(
          top: Dimens.size56,
          right: Dimens.size16,
          child: CircleButton(
            colorButton: _themeData.cardColor.withOpacity(0.32),
            colorIcon: _themeData.cardColor,
            icon: Icons.email_sharp,
            sizeIcon: Dimens.size18,
          ),
        ),
        _buildImageProject(),
        _buildDescProject(),
      ],
    );
  }

  Widget _buildNameProject() {
    return StreamBuilder<double>(
        stream: _scrollOffset,
        initialData: Dimens.size220,
        builder: (context, snapshot) {
          double _top = 0;
          if ((48 / 110 * snapshot.data + 16) < Dimens.size62) {
            _top = Dimens.size62;
          } else {
            if ((48 / 110 * snapshot.data + 16) > Dimens.size110) {
              _top = Dimens.size110;
            } else {
              _top = 48 / 110 * snapshot.data + Dimens.size16;
            }
          }
          return AnimatedPositioned(
            duration: UIHelper.duration150,
            top: _top, //62 200-110
            left: 46 / 110 * snapshot.data + Dimens.size20, //64 200-110
            child: Container(
              width: (_top == Dimens.size62)
                  ? MediaQuery.of(context).size.width - Dimens.size100
                  : MediaQuery.of(context).size.width - Dimens.size130,
              child: Text(
                "Vinhomes grand park",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: _themeData.textTheme.subtitle1.semiBold.size18
                    .letterSpa(0.2)
                    .textColor(snapshot.data >= Dimens.size150
                        ? MyColors.colorTextDarkGreen
                        : MyColors.primaryWhite),
              ),
            ),
          );
        });
  }

  Widget _buildImageProject() {
    return Positioned(
      top: Dimens.size110,
      left: Dimens.size16,
      child: StreamBuilder<double>(
          stream: _scrollOffset,
          initialData: Dimens.size220,
          builder: (context, snapshot) {
            return AnimatedOpacity(
              opacity: snapshot.data / Dimens.size110 - 1,
              duration: UIHelper.duration150,
              child: Container(
                width: Dimens.size72,
                height: Dimens.size72,
                decoration: BoxDecoration(
                    color: _themeData.scaffoldBackgroundColor,
                    borderRadius: BorderRadius.circular(Dimens.size24),
                    border: Border.all(color: MyColors.borderGray)),
                child: CustomImageNetWork(
                  width: double.infinity,
                  url:
                      "https://i.pinimg.com/originals/d4/f2/7b/d4f27b97e0739c979229bd32f12cf559.png",
                  boxFit: BoxFit.fill,
                  borderRadius: BorderRadius.circular(Dimens.size24),
                ),
              ),
            );
          }),
    );
  }

  Widget _buildDescProject() {
    return Positioned(
      top: Dimens.size136,
      left: Dimens.size110 + Dimens.size2,
      child: StreamBuilder<double>(
          stream: _scrollOffset,
          initialData: Dimens.size220,
          builder: (context, snapshot) {
            return AnimatedOpacity(
              opacity: (snapshot.data / Dimens.size110) - 1,
              duration: UIHelper.duration150,
              child: Container(
                width: MediaQuery.of(context).size.width - Dimens.size130,
                child: Text(
                    "SH08.C1, 208 Nguyễn Hữu Cảnh, Vinhomes Tân Cảng, Bình Thạnh, Thành phố Hồ Chí Minh",
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    style: _themeData.textTheme.subtitle2.regular.size12
                        .letterSpa(0.6)
                        .heightLine(Dimens.size1p5)
                        .textDarkGreen),
              ),
            );
          }),
    );
  }
}
