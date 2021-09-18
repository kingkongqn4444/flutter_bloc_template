import 'package:flutter/material.dart';
import 'package:flutter_common/common.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../constants.dart';
import '../../resources/resources.dart';
import '../widget.dart';
import '../../extensions/extensions.dart';

// ignore: must_be_immutable
class ItemProperties extends StatelessWidget {
  ThemeData _theme;
  @override
  Widget build(BuildContext context) {
    _theme = Theme.of(context);
    return InkWell(
      onTap: () {},
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: MyColors.borderGray, width: 1),
          borderRadius: BorderRadius.circular(Dimens.size24),
        ),
        child: Container(
          height: Dimens.size290,
          width: double.infinity,
          child: Column(
            children: [
              const Expanded(
                flex: 5,
                child: ContainerImageProperties(),
              ),
              Expanded(
                flex: 4,
                child: Container(
                  padding: const EdgeInsets.fromLTRB(Dimens.size16,
                      Dimens.size12, Dimens.size16, Dimens.size20),
                  width: double.infinity,
                  height: double.infinity,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(Dimens.size24),
                        bottomRight: Radius.circular(Dimens.size24)),
                  ),
                  child: _buildInfo(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfo() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Căn hộ giá rẻ quận 2, 3 phòng ngủ, không gian sân vườn,hồ bơi, cho nuôi thú cưng, view nhìn  cho nuôi thú cưng, view nhìn ",
          maxLines: DimensInt.size2,
          overflow: TextOverflow.ellipsis,
          style: _theme.textTheme.subtitle2.regular.size13
              .letterSpa(0.6)
              .heightLine(1.5)
              .textBlack60,
        ),
        Row(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                height: Dimens.size48,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          15000000.formatCurrencyNoName,
                          style: _theme.textTheme.subtitle1.semiBold.size18
                              .letterSpa(0.3)
                              .textBlack,
                        ),
                        UIHelper.horizontalBox4,
                        Text(
                          "VNĐ",
                          style: _theme.textTheme.subtitle2.regular.size10
                              .letterSpa(0.4)
                              .textBlack38,
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildDetailInfo(svg: SVGConstants.icBed, title: "3"),
                        _buildDetailInfo(
                            svg: SVGConstants.icBathTub, title: "2"),
                        _buildDetailInfo(
                            svg: SVGConstants.icAcreage, title: "112 m2"),
                      ],
                    )
                  ],
                ),
              ),
            ),
            UIHelper.horizontalBox18,
            Expanded(
              flex: 1,
              child: Container(
                width: double.infinity,
                height: Dimens.size48,
                padding: UIHelper.paddingAll4,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimens.size16),
                    border: Border.all(color: MyColors.borderGray)),
                child: CustomImageNetWork(
                  width: double.infinity,
                  url:
                      "https://i.pinimg.com/originals/d4/f2/7b/d4f27b97e0739c979229bd32f12cf559.png",
                  boxFit: BoxFit.fill,
                  borderRadius:BorderRadius.circular(Dimens.size16),
                ),
              ),
            ),
          ],
        )
      ],
    );
  }

  Widget _buildDetailInfo({@required String svg, @required String title}) {
    return Row(
      children: [
        SvgPicture.asset(
          svg ?? "",
          width: Dimens.size16,
        ),
        UIHelper.horizontalBox8,
        Text(
          title ?? '-',
          style: _theme.textTheme.subtitle2.regular.size12
              .letterSpa(0.6)
              .textBlack60,
        ),
      ],
    );
  }
}
