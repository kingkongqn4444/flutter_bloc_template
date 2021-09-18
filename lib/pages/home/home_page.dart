import 'package:flutter/material.dart';
import 'package:flutter_common/common.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sdk/flutter_sdk.dart';

import '../../constants.dart';
import '../../extensions/extensions.dart';
import '../../resources/resources.dart';
import '../../widget/widget.dart';
import '../need_to/need_to.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends BaseState<HomePage, BaseBloc> {
  @override
  void onNavigateAsync(Object payload) {
    super.onNavigateAsync(payload);
  }

  @override
  Widget buildContent(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _buildBackGroundHeader(),
          Column(
            children: [
              _buildHeader(),
              _buildListData(),
            ],
          ),
          _buildButtonNext(),
        ],
      ),
    );
  }

  Widget _buildBackGroundHeader() {
    return Container(
      alignment: Alignment.topCenter,
      width: double.infinity,
      height: MediaQuery.of(context).size.width,
      child: Container(
        width: double.infinity,
        height: Dimens.size280,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ImageConstants.imgHeaderHome),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.fromLTRB(
          Dimens.size16, Dimens.size56, Dimens.size16, Dimens.size66),
      width: double.infinity,
      height: Dimens.size250,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SvgPicture.asset(SVGConstants.icStayHome),
          UIHelper.verticalBox24,
          Text(
            'Welcome',
            style: themeData.textTheme.headline6.bold.size24
                .letterSpa(0.6)
                .textWhite,
          ),
          UIHelper.verticalBox8,
          Text(
            'Let us help you find apartments around your location',
            style: themeData.textTheme.bodyText2.regular
                .letterSpa(0.6)
                .heightLine(1.2)
                .textWhite,
            maxLines: DimensInt.size2,
          ),
        ],
      ),
    );
  }

  Widget _buildButtonNext() {
    return Positioned(
      top: Dimens.size200,
      left: MediaQuery.of(context).size.width / 2 - Dimens.size45,
      child: InkWell(
        onTap: () {
          nextPageBottomToTop(const NeedToPage());
        },
        child: Container(
          width: Dimens.size90,
          height: Dimens.size90,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(ImageConstants.imgButtonInHome),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildListData() {
    return Expanded(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: Dimens.size30,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      'assets/images/png/img_white_in_home.png',
                    ),
                    fit: BoxFit.fill)),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.fromLTRB(
                  Dimens.size16, Dimens.size20, Dimens.size16, 0),
              width: double.infinity,
              height: double.infinity,
              color: themeData.scaffoldBackgroundColor,
              child: SingleChildScrollView(
                physics: const ClampingScrollPhysics(),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Recommend For You',
                          style: themeData.textTheme.subtitle1.semiBold.size18
                              .letterSpa(0.6)
                              .textBlack,
                        ),
                        Text(
                          'See All',
                          style: themeData.textTheme.subtitle2.semiBold.size14
                              .letterSpa(0.6)
                              .textPrimary,
                        ),
                      ],
                    ),
                    UIHelper.verticalBox16,
                    ReloadListView(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: 5,
                      itemBuilder: (_, index) => ItemProperties(),
                      separatorBuilder: (_, __) => UIHelper.verticalBox20,
                      onRefresh: () async {},
                      onReachEnd: () async {},
                      isLoadingMore: false,
                      noDataMessage: '',
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  BaseBloc get bloc => null;
}
