import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'reload_view.dart';

class ReloadListView extends StatelessWidget {
  ReloadListView({
    Key key,
    @required this.itemBuilder,
    this.controller,
    this.onReachEnd,
    this.onRefresh,
    this.separatorBuilder,
    this.itemCount,
    this.isLoadingMore,
    this.padding,
    this.loadingIndicatorBuilder,
    this.shrinkWrap,
    this.physics,
    this.cacheScreenQty,
    this.noDataMessage,
  })  : _data = {},
        super(key: key);

  final IndexedWidgetBuilder itemBuilder;
  final int itemCount;
  final int cacheScreenQty;
  final EdgeInsetsGeometry padding;
  final ReloadCallback onRefresh;
  final ReloadCallback onReachEnd;
  final IndexedWidgetBuilder separatorBuilder;
  final IndexedWidgetBuilder loadingIndicatorBuilder;
  final bool isLoadingMore;
  final bool shrinkWrap;
  final ScrollPhysics physics;
  final ScrollController controller;
  final String noDataMessage;

  final Map<String, dynamic> _data;
  static const String _loadingMoreKey = 'is_loading_more';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screenSize = MediaQuery.of(context).size;

    if ((itemCount ?? 0) <= 0) {
      return Stack(
        alignment: Alignment.center,
        children: [
          Text(noDataMessage ?? '', style: theme.textTheme.caption),
          Positioned.fill(
            child: ReloadView(
              onRefresh: onRefresh,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      width: double.infinity,
                      height: screenSize.height + 100.0,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      );
    }

    final Widget _child = NotificationListener(
      onNotification: _onNotification,
      child: ListView.separated(
        controller: controller,
        shrinkWrap: shrinkWrap ?? false,
        itemBuilder: (context, index) => Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            itemBuilder(context, index),
            if (index == itemCount - 1 && (isLoadingMore ?? false))
              loadingIndicatorBuilder != null
                  ? loadingIndicatorBuilder(context, index)
                  : Container(
                      padding: const EdgeInsets.all(8.0),
                      alignment: Alignment.center,
                      child: SpinKitThreeBounce(
                          color: theme.primaryColor, size: 16.0),
                    )
            else
              Container(),
          ],
        ),
        itemCount: itemCount ?? 0,
        separatorBuilder: separatorBuilder ?? (_, __) => Container(),
        padding:
            (padding ?? EdgeInsets.zero).add(EdgeInsets.only(bottom: 32.0)),
        physics: physics,
        cacheExtent: screenSize.height * (cacheScreenQty ?? 3),
      ),
    );
    return onRefresh == null
        ? _child
        : ReloadView(onRefresh: onRefresh, child: _child);
  }

  bool _onNotification(ScrollNotification notification) {
    final metrics = notification.metrics;
    if (metrics.atEdge &&
        metrics.pixels != 0 &&
        (_data['$_loadingMoreKey'] ?? false) == false) {
      _data['$_loadingMoreKey'] = true;
      if (onReachEnd != null) {
        onReachEnd.call().then((value) => _data['$_loadingMoreKey'] = false);
      } else {
        _data['$_loadingMoreKey'] = false;
      }
    }
    return false;
  }
}
