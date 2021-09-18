import 'package:flutter/material.dart';
import 'package:flutter_common/common.dart';

import '../../resources/resources.dart';
import '../widget.dart';
import '../../router/router.dart';

class StepBarPage extends StatefulWidget {
  final PageController pageController;

  StepBarPage({@required this.pageController});

  @override
  _StepBarPageState createState() => _StepBarPageState();
}

class _StepBarPageState extends State<StepBarPage> {
  double _page;

  @override
  void initState() {
    _page = Dimens.size0;
    super.initState();
  }

  @override
  void didChangeDependencies() {
    widget.pageController.addListener(() {
      setState(() {
        _page = widget.pageController.page;
      });
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: Dimens.size150,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          UIHelper.verticalBox8,
          Row(
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
              _buildDotStep(
                isFocus: _page >= 2.5,
              ),
            ],
          ),
          UIHelper.verticalBox32,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _page >= 0.5
                  ? Padding(
                      padding: UIHelper.horizontalEdgeInsets12,
                      child: CircleButtonOutline(
                        onTap: _prePage,
                      ),
                    )
                  : UIHelper.emptyBox,
              _page <= 2.5
                  ? Padding(
                      padding: UIHelper.horizontalEdgeInsets12,
                      child: CircleButtonGradient(
                        onTap: _nextPage,
                      ),
                    )
                  : UIHelper.emptyBox,
              if (_page > 2.5)
                Padding(
                  padding: UIHelper.horizontalEdgeInsets12,
                  child: ButtonGradient(
                    onTap: () => Navigator.pushNamedAndRemoveUntil(
                        context, Routes.homePage, (route) => false),
                    title: 'Bắt đầu ngay',
                    width: Dimens.size180,
                  ),
                )
              else
                UIHelper.emptyBox,
            ],
          ),
        ],
      ),
    );
  }

  void _nextPage() {
    widget.pageController
        .nextPage(duration: UIHelper.duration250, curve: Curves.ease);
  }

  void _prePage() {
    widget.pageController
        .previousPage(duration: UIHelper.duration250, curve: Curves.ease);
  }

  Widget _buildDotStep({bool isFocus}) {
    return AnimatedContainer(
      margin: UIHelper.horizontalEdgeInsets6,
      duration: UIHelper.duration150,
      width: !isFocus ? Dimens.size8 : Dimens.size30,
      height: Dimens.size8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(Dimens.size8),
        gradient: LinearGradient(
            colors: [
              isFocus
                  ? MyColors.primaryTwo
                  : MyColors.primary.withOpacity(0.32),
              MyColors.primary.withOpacity(isFocus ? 1 : 0.32),
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            stops: [0.0, 1.0],
            tileMode: TileMode.clamp),
      ),
    );
  }
}
