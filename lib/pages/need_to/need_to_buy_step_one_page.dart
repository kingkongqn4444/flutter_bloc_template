import 'package:data/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_common/common.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:keyboard_visibility/keyboard_visibility.dart';
import 'package:rxdart/rxdart.dart';

import '../../constants.dart';
import '../../extensions/extensions.dart';
import '../../resources/resources.dart';
import '../../widget/widget.dart';

class NeedToBuyStepOnePage extends StatefulWidget {
  final PageController pageController;

  NeedToBuyStepOnePage({@required this.pageController});

  @override
  _NeedToBuyStepOnePageState createState() => _NeedToBuyStepOnePageState();
}

class _NeedToBuyStepOnePageState extends State<NeedToBuyStepOnePage>
    with TickerProviderStateMixin {
  ThemeData _themeData;

  final BehaviorSubject<bool> _isSearch = BehaviorSubject<bool>.seeded(false);

  final BehaviorSubject<bool> _isSelectLocation =
      BehaviorSubject<bool>.seeded(false);

  final BehaviorSubject<bool> _isShowKeyBroad =
      BehaviorSubject<bool>.seeded(false);

  final BehaviorSubject<double> _opacity = BehaviorSubject<double>.seeded(0);

  final ScrollController _scrollController = ScrollController();

  final TextEditingController _locationController =
      TextEditingController(text: 'Manchester, Greater Manchester');

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.offset > Dimens.size200) {
        _opacity.add(1);
      } else {
        _opacity.add(
            1 - Dimens.size100 / (_scrollController.offset + Dimens.size100));
      }
    });
    KeyboardVisibilityNotification().addNewListener(
      onChange: (visible) {
        _isShowKeyBroad.add(visible);
      },
    );
  }

  @override
  void dispose() {
    _isSearch.close();
    _isSelectLocation.close();
    _opacity.close();
    _isShowKeyBroad.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _themeData = Theme.of(context);
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.transparent,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              StreamBuilder<double>(
                  stream: _opacity,
                  initialData: 1,
                  builder: (context, snapshot) {
                    return AnimatedOpacity(
                      opacity: snapshot.data,
                      duration: UIHelper.duration150,
                      child: _buildLocation(),
                    );
                  }),
              StreamBuilder<bool>(
                  stream: _isSelectLocation,
                  initialData: false,
                  builder: (context, snapshot1) {
                    return snapshot1.data
                        ? _buildAfterSelectLocation()
                        : _buildBeforeSelectLocation();
                  }),
            ],
          ),
        ),
        StreamBuilder<double>(
            stream: _opacity,
            initialData: 1,
            builder: (context, snapshot) {
              return AnimatedOpacity(
                duration: UIHelper.duration150,
                opacity: 1 - snapshot.data,
                child: Container(
                  width: Dimens.size60,
                  height: Dimens.size60,
                  decoration: BoxDecoration(
                    color: MyColors.primaryWhite.withOpacity(0.5),
                    borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(Dimens.size16),
                      topLeft: Radius.circular(Dimens.size16),
                    ),
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.all(Dimens.size4),
                    decoration: BoxDecoration(
                      color: MyColors.primaryWhite,
                      borderRadius: BorderRadius.circular(Dimens.size14),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: Dimens.size2,
                          blurRadius: Dimens.size4,
                          offset: const Offset(
                              0, Dimens.size2), // changes position of shadow
                        ),
                      ],
                    ),
                    child: Image.asset(
                      ImageConstants.imgHomeSearch,
                      width: Dimens.size30,
                    ),
                  ),
                ),
              );
            }),
      ],
    );
  }

  Widget _buildBeforeSelectLocation() {
    return Expanded(
      child: AnimatedSize(
        vsync: this,
        alignment: Alignment.topCenter,
        duration: UIHelper.duration500,
        curve: Curves.fastLinearToSlowEaseIn,
        child: AnimatedContainer(
          duration: UIHelper.duration500,
          width: double.infinity,
          height: !_isSelectLocation.value ? double.infinity : 0,
          padding: UIHelper.horizontalEdgeInsets16,
          decoration: BoxDecoration(
            color: MyColors.primaryWhite.withOpacity(0.92),
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(Dimens.size24),
              topLeft: Radius.circular(Dimens.size24),
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                UIHelper.verticalBox48,
                SearchWidget(
                  'Your location',
                  autoFocus: true,
                  onCancel: () {},
                  onSearch: (val) {
                    if (val != null && val != '') {
                      _isSearch.add(true);
                    } else {
                      _isSearch.add(false);
                    }
                  },
                ),
                UIHelper.verticalBox16,
                StreamBuilder<bool>(
                    stream: _isSearch,
                    initialData: false,
                    builder: (context, snapshot) {
                      return snapshot.data
                          ? _buildSearchLocation()
                          : _buildHistoryLocation();
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAfterSelectLocation() {
    return Expanded(
      child: AnimatedSize(
        vsync: this,
        alignment: Alignment.topCenter,
        duration: UIHelper.duration500,
        curve: Curves.fastLinearToSlowEaseIn,
        child: AnimatedContainer(
          duration: UIHelper.duration500,
          width: double.infinity,
          height: _isSelectLocation.value ? double.infinity : 0,
          child: Column(
            children: [
              Expanded(
                child: StreamBuilder<double>(
                    stream: _opacity,
                    initialData: 0,
                    builder: (context, snapshotOpacity) {
                      return AnimatedContainer(
                        duration: UIHelper.duration150,
                        width: double.infinity,
                        height: double.infinity,
                        decoration: BoxDecoration(
                          color: MyColors.primaryWhite.withOpacity(0.92),
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(
                                Dimens.size24 * (1 - snapshotOpacity.data)),
                            topLeft: Radius.circular(
                                Dimens.size24 * (1 - snapshotOpacity.data)),
                          ),
                        ),
                        child: Padding(
                          padding: UIHelper.horizontalEdgeInsets16,
                          child: SingleChildScrollView(
                            controller: _scrollController,
                            physics: const ClampingScrollPhysics(),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                UIHelper.verticalBox48,
                                SearchWidget(
                                  'Your location',
                                  text: 'Manchester, Greater Manchester',
                                  onCancel: () {},
                                  onSearch: (val) {},
                                  isIconSearch: false,
                                ),
                                UIHelper.verticalBox24,
                                _buildContainerTitleAndData(
                                  title: 'Property type',
                                  widget: const ContainerPropertyTypeBuy(),
                                ),
                                UIHelper.verticalBox24,
                                ContainerPriceRange(),
                                const ContainerArea(),
                                UIHelper.verticalBox24,
                                _buildContainerTitleAndData(
                                  title: 'Number of rooms',
                                  widget: const ContainerNumberOfRoom(),
                                ),
                                UIHelper.verticalBox24,
                                _buildContainerTitleAndData(
                                  title: 'Direction',
                                  widget: const ContainerDirection(),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
              ),
              StreamBuilder<bool>(
                  stream: _isShowKeyBroad,
                  initialData: false,
                  builder: (context, snapshot) {
                    return snapshot.data
                        ? UIHelper.emptyBox
                        : _buildBottomButton();
                  }),
            ],
          ),
        ),
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
          color: MyColors.primaryWhite.withOpacity(0.92),
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
              SVGUrl: SVGConstants.icNext,
              onTap: () {
                widget.pageController.animateToPage(1,
                    duration: UIHelper.duration150, curve: Curves.linear);
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildHistoryLocation() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ItemSelectHistoryLocation(
          model: _dataByType(type: ResultSearchLocation.location)[0],
          callBack: () {
            _isSelectLocation.add(true);
          },
        ),
        ItemSelectHistoryLocation(
          model: _dataByType(type: ResultSearchLocation.location)[2],
          callBack: () {
            _isSelectLocation.add(true);
          },
        ),
        Padding(
          padding: const EdgeInsets.only(left: Dimens.size28),
          child: Divider(
            color: MyColors.primary.withOpacity(0.16),
          ),
        ),
        ItemSelectHistoryLocation(
          model: _dataByType(type: ResultSearchLocation.home)[1],
          callBack: () {
            _isSelectLocation.add(true);
          },
        ),
        ItemSelectHistoryLocation(
          model: _dataByType(type: ResultSearchLocation.home)[0],
          callBack: () {
            _isSelectLocation.add(true);
          },
        ),
      ],
    );
  }

  Widget _buildSearchLocation() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ItemSearchLocation(
          model: _dataByType(type: ResultSearchLocation.location)[0],
          callBack: () {
            _isSelectLocation.add(true);
          },
        ),
        ItemSearchLocation(
          model: _dataByType(type: ResultSearchLocation.location)[2],
          callBack: () {
            _isSelectLocation.add(true);
          },
        ),
        Padding(
          padding: const EdgeInsets.only(left: Dimens.size28),
          child: Divider(
            color: MyColors.primary.withOpacity(0.16),
          ),
        ),
        ItemSearchLocation(
          model: _dataByType(type: ResultSearchLocation.building)[1],
          callBack: () {
            _isSelectLocation.add(true);
          },
        ),
        ItemSearchLocation(
          model: _dataByType(type: ResultSearchLocation.building)[0],
          callBack: () {
            _isSelectLocation.add(true);
          },
        ),
      ],
    );
  }

  List<ResultSearchLocationModel> _dataByType({ResultSearchLocation type}) {
    return [
      ResultSearchLocationModel(
          title: 'Đông hồ', subTitle: 'Quận 8, hồ chí minh', type: type),
      ResultSearchLocationModel(
          title: 'Hồ Tùng mậu', subTitle: 'Quận 1, hồ chí minh', type: type),
      ResultSearchLocationModel(
          title: 'Chung cư 35 hồ Học lãm',
          subTitle: 'Phường an lạc, bình tân, hồ chí minh',
          type: type),
    ];
  }
}
