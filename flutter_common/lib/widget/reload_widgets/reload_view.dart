import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

typedef ReloadCallback = Future<void> Function();

class ReloadView extends StatelessWidget {
  const ReloadView({
    Key key,
    @required this.onRefresh,
    this.child,
    this.displacement = 0.0,
  }) : super(key: key);

  final Widget child;
  final ReloadCallback onRefresh;
  final double displacement;

  @override
  Widget build(BuildContext context) {
    Widget _child;
    if (child != null &&
        (child is ScrollView ||
            child is SingleChildScrollView ||
            child is NotificationListener)) {
      _child = child;
    }

    _child ??= SingleChildScrollView(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: MediaQuery.of(context).size.height,
          minWidth: MediaQuery.of(context).size.width,
        ),
        child: Column(
          children: [child],
        ),
      ),
    );

    return RefreshIndicator(
      displacement: displacement ?? 0.0,
      onRefresh: () async {
        final dt1 = DateTime.now();
        if (onRefresh != null) await onRefresh();
        final dt2 = DateTime.now();
        if (dt1.difference(dt2).inMilliseconds.abs() < 200) {
          await Future.delayed(const Duration(milliseconds: 200));
        }
      },
      child: _child,
    );
  }
}
