import 'package:flutter/material.dart';
import 'package:flutter_common/common.dart';
import 'package:sdk/flutter_sdk.dart';

import '../../constants.dart';
import '../../extensions/extensions.dart';
import '../../resources/resources.dart';
import '../../widget/widget.dart';

class InfoProjectPage extends StatefulWidget {
  const InfoProjectPage({Key key}) : super(key: key);

  @override
  _InfoProjectPageState createState() => _InfoProjectPageState();
}

class _InfoProjectPageState extends BaseState<InfoProjectPage, BaseBloc> {
  ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController ??= ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _buildBackgroundHeader(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeaderInfo(scrollController: _scrollController),
              _buildContainerData(),
            ],
          ),
        ],
      ),
    );
  }

  @override
  BaseBloc get bloc => null;

  Widget _buildBackgroundHeader() {
    return Container(
      alignment: Alignment.topCenter,
      height: MediaQuery.of(context).size.height,
      width: double.infinity,
      child: Container(
        height: Dimens.size220,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(ImageConstants.imgHeaderInfoPage),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderProperties() {
    return Row(
      children: [
        Expanded(
            child: Divider(
          color: MyColors.borderGray,
        )),
        UIHelper.horizontalBox16,
        Text(
          'Properties',
          style: themeData.textTheme.subtitle1.semiBold.size18.textBlack,
        ),
        UIHelper.horizontalBox16,
        Expanded(
            child: Divider(
          color: MyColors.borderGray,
        )),
      ],
    );
  }

  Widget _buildContainerData() {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.fromLTRB(
            Dimens.size16, Dimens.size16, Dimens.size16, 0),
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          color: themeData.scaffoldBackgroundColor,
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(Dimens.size24),
            topLeft: Radius.circular(Dimens.size24),
          ),
        ),
        child: SingleChildScrollView(
          controller: _scrollController,
          physics: const ClampingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Heading 1',
                style: themeData.textTheme.subtitle1.semiBold.size16.textBlack,
              ),
              UIHelper.verticalBox8,
              ReadMoreText(
                  maxLines: 10,
                  text:
                      'Discerning buyers will find their new residences elegant yet practical, inspirational yet reassuring and refreshing yet familiar. City icons such as Notre Dame Cathedral and Reunification Palace are within walking distance, as are top shopping destinations such as Diamond Plaza and Takashimaya.\n \n Additionally, The Marq’s convenient location means residents will have easy access to amenities, including schools, hospitals, cinemas, bars, restaurants and historical sites.'),
              UIHelper.verticalBox24,
              _buildHeaderProperties(),
              UIHelper.verticalBox16,
              ReloadListView(
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (_, index) => ItemProperties(),
                separatorBuilder: (_, __) => UIHelper.verticalBox20,
                onRefresh: () async {},
                onReachEnd: () async {},
                isLoadingMore: false,
                noDataMessage: "",
                physics: const NeverScrollableScrollPhysics(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
