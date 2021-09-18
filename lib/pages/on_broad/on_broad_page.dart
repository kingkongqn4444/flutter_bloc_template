import 'package:flutter/material.dart';
import 'package:flutter_common/common.dart';
import 'package:sdk/flutter_sdk.dart';

import '../../constants.dart';
import '../../extensions/extensions.dart';
import '../../resources/resources.dart';
import '../../router/router.dart';
import '../../widget/widget.dart';

class OnBroadPage extends StatefulWidget {
  const OnBroadPage({Key key}) : super(key: key);

  @override
  _OnBroadPageState createState() => _OnBroadPageState();
}

class _OnBroadPageState extends BaseState<OnBroadPage, BaseBloc> {
  PageController _pageController;

  BehaviorSubject<bool> _visibleSkip;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
    _visibleSkip = BehaviorSubject<bool>.seeded(false);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _pageController.addListener(() {
      if (_pageController.page > 2.5) {
        _visibleSkip.add(true);
      } else {
        _visibleSkip.add(false);
      }
    });
  }

  @override
  void dispose() {
    _visibleSkip.close();
    super.dispose();
  }

  @override
  Widget buildContent(BuildContext context) {
    return  Container(
      width: double.infinity,
      child: Column(
        children: [
          UIHelper.verticalBox32,
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {
                Navigator.pushNamedAndRemoveUntil(context, Routes.homePage, (route) => false);
              },
              child: StreamBuilder<bool>(
                  stream: _visibleSkip,
                  builder: (context, snapshot) {
                    return Text(
                      (snapshot?.data??false) ? "" : "SKIP",
                      style: themeData
                          .textTheme.subtitle2.semiBold.size14.textPrimary,
                    );
                  }),
            ),
          ),
          Image.asset(
            ImageConstants.imgLogoSlogan,
            width: Dimens.size180,
          ),
          Expanded(
            child: PageView(
              controller: _pageController,
              physics: const ClampingScrollPhysics(),
              children: [
                ContainerImageTitle(
                  assetImage: ImageConstants.imgOnBroadOne,
                  title: 'Những properties bán / cho thuê \n hấp dẫn',
                  content:
                  'KimCasa giúp bạn tìm kiếm những properties \n phù hợp với mong muốn bạn',
                ),
                ContainerImageTitle(
                  assetImage: ImageConstants.imgOnBroadTwo,
                  title: "Xem nhanh các properties \n đang quan tâm",
                  content:
                  "Ứng dụng tự động gợi ý khi xuất hiện \n những properties mới phù hợp với nhu cầu bạn cần",
                ),
                ContainerImageTitle(
                  assetImage: ImageConstants.imgOnBroadThree,
                  title: "So sánh để lựa chọn \n chính xác hơn",
                  content:
                  "KimCasa giúp bạn so sánh các properties \n mà bạn đang cân nhắc chọn lựa",
                ),
                ContainerImageTitle(
                  assetImage: ImageConstants.imgOnBroadFour,
                  title: "Ước tính nhanh chóng \n giá nhà & các loại phí",
                  content:
                  "KimCasa giúp bạn so sánh các properties \n mà bạn đang cân nhắc chọn lựa",
                ),
              ],
            ),
          ),
          StepBarPage(
            pageController: _pageController,
          ),
        ],
      ),
    );
  }

  @override
  BaseBloc get bloc => null;
}
