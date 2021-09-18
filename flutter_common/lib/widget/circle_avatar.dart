import 'package:flutter/material.dart';
import 'package:sdk/flutter_sdk.dart';

class CircleAvatarWidget extends StatefulWidget {
  final String url;
  final double borderWidth;
  final Color borderColor;
  final double size;
  final AssetImage errorAssetImage;
  final bool showDebugLog;

  CircleAvatarWidget(
    this.url, {
    Key key,
    @required this.errorAssetImage,
    this.size = 64.0,
    this.borderWidth = 2.0,
    this.borderColor,
    this.showDebugLog = false,
  }) : super(key: key);

  @override
  _CircleAvatarWidgetState createState() => _CircleAvatarWidgetState();
}

class _CircleAvatarWidgetState extends State<CircleAvatarWidget> {
  ThemeData _theme;
  ImageProvider _image;

  @override
  void initState() {
    _image = NetworkImage(widget.url);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _theme ??= Theme.of(context);
    return Container(
      width: widget.size ?? 64.0,
      height: widget.size ?? 64.0,
      decoration: BoxDecoration(
        color: _theme.disabledColor,
        image: DecorationImage(
          image: _image,
          fit: BoxFit.cover,
          onError: (exception, stackTrace) {
            if (widget.showDebugLog ?? false) {
              Log.e(exception.toString(), tag: '$runtimeType');
            }
            setState(() => _image = widget.errorAssetImage);
          },
        ),
        border: new Border.all(
          color: widget.borderColor ?? _theme.primaryColor,
          width: widget.borderWidth ?? 2.0,
        ),
        shape: BoxShape.circle,
      ),
    );
  }
}
