import 'package:flutter/material.dart';
import 'package:flutter_common/common.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';
import 'package:sdk/flutter_sdk.dart';

import '../../constants.dart';
import '../../extensions/extensions.dart';
import '../../resources/resources.dart';
import '../../widget/widget.dart';

class NeedToBuyStepTwoPage extends StatefulWidget {
  final PageController pageController;

  NeedToBuyStepTwoPage({@required this.pageController});

  @override
  _NeedToBuyStepTwoPageState createState() => _NeedToBuyStepTwoPageState();
}

class _NeedToBuyStepTwoPageState extends State<NeedToBuyStepTwoPage> {
  ThemeData _themeData;

  final TextEditingController _locationController =
      TextEditingController(text: "London Fields, London");

  final BehaviorSubject<bool> _isShowKeyBroad =
      BehaviorSubject<bool>.seeded(false);

  @override
  void initState() {
    super.initState();
    KeyboardVisibilityNotification().addNewListener(
      onChange: (visible) {
        _isShowKeyBroad.add(visible);
      },
    );
  }

  @override
  void dispose() {
    _isShowKeyBroad.close();
    _locationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _themeData = Theme.of(context);
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        color: MyColors.primaryWhite.withOpacity(0.92),
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(Dimens.size24),
          topLeft: Radius.circular(Dimens.size24),
        ),
      ),
      child: Column(
        children: [
          _buildLocation(),
          Expanded(
            child: Padding(
              padding: UIHelper.horizontalEdgeInsets16,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    UIHelper.verticalBox16,
                    _buildContainerTitleAndData(
                      title: 'Facilities',
                      widget: const ContainerFacilities(),
                    ),
                    UIHelper.verticalBox24,
                    _buildContainerTitleAndData(
                      title: 'Time',
                      widget: const ContainerTimes(),
                    ),
                    UIHelper.verticalBox24,
                    _buildContainerTitleAndData(
                      title: 'Don’t show',
                      widget: const ContainerDontShow(),
                    ),
                  ],
                ),
              ),
            ),
          ),
          StreamBuilder<bool>(
              stream: _isShowKeyBroad,
              initialData: false,
              builder: (context, snapshot) {
                return snapshot.data ? UIHelper.emptyBox : _buildBottomButton();
              }),
        ],
      ),
    );
  }

  Widget _buildLocation() {
    return Container(
      width: double.infinity,
      padding: UIHelper.horizontalEdgeInsets16,
      height: Dimens.size40,
      decoration: const BoxDecoration(
        color: MyColors.primaryWhite,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(Dimens.size24),
          topLeft: Radius.circular(Dimens.size24),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: TextField(
              enabled: false,
              controller: _locationController,
              textCapitalization: TextCapitalization.sentences,
              decoration: InputDecoration(
                hintText: 'Your location',
                contentPadding: const EdgeInsets.only(bottom: Dimens.size6),
                border: InputBorder.none,
                hintStyle: TextStyle(
                    color: MyColors.primaryBlack.withOpacity(0.38),
                    letterSpacing: 0.6),
              ),
              style: _themeData.textTheme.subtitle2.regular.size14
                  .letterSpacing0p6.textBlack,
            ),
          ),
          UIHelper.horizontalBox12,
          InkWell(
            onTap: () {
              _locationController.clear();
            },
            child: SvgPicture.asset(SVGConstants.icCloseCircle),
          ),
        ],
      ),
    );
  }

  Widget _buildContainerTitleAndData(
      {@required String title, @required Widget widget}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          title ?? '--',
          style: _themeData
              .textTheme.subtitle2.size14.semiBold.letterSpacing0p6.textBlack,
        ),
        UIHelper.verticalBox12,
        widget ?? UIHelper.emptyBox,
      ],
    );
  }

  Widget _buildBottomButton() {
    return Stack(
      children: [
        Container(
          alignment: Alignment.bottomCenter,
          height: Dimens.size110,
          width: double.infinity,
          child: Container(
            height: Dimens.size66,
            width: double.infinity,
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: AssetImage(ImageConstants.imgBottomNeedToBuy),
            )),
          ),
        ),
        Positioned(
          left: MediaQuery.of(context).size.width / 2 - Dimens.size40,
          top: Dimens.size10,
          child: Container(
            alignment: Alignment.center,
            width: Dimens.size80,
            height: Dimens.size80,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.transparent,
              border: Border.all(
                  color: MyColors.primary, width: Dimens.halfSize0p4),
            ),
            child: CircleButtonGradient(
              SVGUrl: SVGConstants.icSearch,
              colorIcon: MyColors.primaryWhite,
            ),
          ),
        ),
        Positioned(
          top: Dimens.size22,
          left: Dimens.size16,
          child: CircleButton(
            icon: Icons.arrow_back_ios_sharp,
            size: Dimens.size48,
            colorIcon: MyColors.primaryBlack.withOpacity(0.6),
            onTap: () {
              widget.pageController.animateToPage(0,
                  duration: UIHelper.duration150, curve: Curves.linear);
            },
          ),
        ),
      ],
    );
  }
}
