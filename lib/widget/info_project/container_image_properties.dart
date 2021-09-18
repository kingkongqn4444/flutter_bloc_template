import 'package:flutter/material.dart';
import 'package:flutter_common/common.dart';

import '../../resources/resources.dart';

class ContainerImageProperties extends StatefulWidget {
  const ContainerImageProperties({Key key}) : super(key: key);

  @override
  _ContainerImagePropertiesState createState() =>
      _ContainerImagePropertiesState();
}

class _ContainerImagePropertiesState extends State<ContainerImageProperties> {
  PageController _pageController;

  ThemeData _theme;

  double _page = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  void didChangeDependencies() {
    _pageController.addListener(() {
      setState(() {
        _page = _pageController.page;
      });
    });
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _theme = Theme.of(context);
    return Stack(
      alignment: Alignment.bottomLeft,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(Dimens.size24),
              topRight: Radius.circular(Dimens.size24)),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            child: _buildPageViewImage(),
          ),
        ),
        _buildStep(),
        Positioned(
          right: Dimens.size16,
          top: Dimens.size16,
          child: _buildRowContact(),
        ),
      ],
    );
  }

  Widget _buildPageViewImage() {
    return PageView(
      controller: _pageController,
      physics: const ClampingScrollPhysics(),
      children: [
        CustomImageNetWork(
          width: double.infinity,
          url:
              "http://diaocancu.net/wp-content/uploads/2019/05/khu-do-thi-vincity-grand-park-quan-9.jpg",
          boxFit: BoxFit.cover,
        ),
        CustomImageNetWork(
          width: double.infinity,
          url:
              "https://tuyenmai.com/wp-content/uploads/2020/08/Vinhomes-Grand-Park-32.jpg",
          boxFit: BoxFit.cover,
        ),
        CustomImageNetWork(
          width: double.infinity,
          url:
              "https://hugemienbac.vn/wp-content/uploads/2019/05/phong-thuy-cua-nha-o-800x480.jpg",
          boxFit: BoxFit.cover,
        ),
      ],
    );
  }

  Widget _buildStep() {
    return Container(
      width: Dimens.size76,
      height: Dimens.size28,
      decoration: BoxDecoration(
          color: MyColors.primaryWhite.withOpacity(0.3),
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(Dimens.size16),
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildDotStep(
            isFocus: _page < 0.3,
          ),
          _buildDotStep(
            isFocus: _page >= 0.3 && _page < Dimens.size1p5,
          ),
          _buildDotStep(
            isFocus: _page >= Dimens.size1p5 && _page < 2.5,
          ),
        ],
      ),
    );
  }

  Widget _buildDotStep({bool isFocus}) {
    return AnimatedContainer(
      margin: UIHelper.horizontalEdgeInsets4,
      duration: UIHelper.duration150,
      width: isFocus ? Dimens.size12 : Dimens.size8,
      height: isFocus ? Dimens.size12 : Dimens.size8,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isFocus ? _theme.cardColor : Colors.transparent,
        border: Border.all(color: _theme.cardColor),
      ),
    );
  }

  Widget _buildRowContact() {
    return Row(
      children: [
        _buildButtonContact(icon: Icons.email_sharp),
        _buildButtonContact(icon: Icons.phone),
      ],
    );
  }

  Widget _buildButtonContact({VoidCallback onTap, @required IconData icon}) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: UIHelper.horizontalEdgeInsets6,
        alignment: Alignment.center,
        height: Dimens.size38,
        width: Dimens.size38,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: _theme.cardColor.withOpacity(0.3),
        ),
        child: Icon(
          icon,
          size: Dimens.size16,
          color: _theme.cardColor,
        ),
      ),
    );
  }
}
