import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_common/common.dart';
import 'package:sdk/flutter_sdk.dart';

class TextInputArea extends StatefulWidget {
  final String title;
  final TextEditingController controller;
  final ValueChanged<String> onChanged;
  final ValueChanged<String> onDone;
  final String initialValue;
  final String hintText;
  final TextStyle hintStyle;
  final Icon prefixIcon;
  final Icon suffixIcon;
  final String prefixText;
  final String suffixText;
  final FocusNode focusNode;
  final FocusNode nextFocus;
  final TextAlign textAlign;
  final bool important;
  final bool readOnly;
  final bool password;
  final int maxLines;
  final int minLines;
  final int maxLength;
  final double contentPadding;
  final bool visibleCounterText;
  final TextInputAction textInputAction;
  final TextInputType keyboardType;
  final List<TextInputFormatter> inputFormatters;
  final TextStyle titleStyle;
  final Function() onTap;
  final Function(StreamController<bool>) onInitDeleteController;
  final InputDecoration decoration;
  final FormFieldValidator<String> validator;
  final bool enable;
  final TextCapitalization textCapitalization;
  final StreamController<bool> _onDeleteFieldController = StreamController<bool>();

  TextInputArea({
    Key key,
    this.title,
    this.controller,
    this.onChanged,
    this.onDone,
    this.initialValue,
    this.hintText,
    this.hintStyle,
    this.prefixIcon,
    this.suffixIcon,
    this.focusNode,
    this.nextFocus,
    this.textAlign = TextAlign.start,
    this.important = false,
    this.readOnly = false,
    this.password = false,
    this.enable = true,
    this.maxLines,
    this.maxLength,
    this.keyboardType,
    this.inputFormatters,
    this.prefixText,
    this.suffixText,
    this.titleStyle,
    this.onTap,
    this.decoration,
    this.minLines = 1,
    this.validator,
    this.contentPadding,
    this.visibleCounterText,
    this.textInputAction,
    this.textCapitalization = TextCapitalization.sentences,
    this.onInitDeleteController,
  }) : super(key: key);

  @override
  _TextInputAreaState createState() => _TextInputAreaState();
}

class _TextInputAreaState extends State<TextInputArea> {
  TextEditingController _controller;
  FocusNode _focusNode;
  bool _hidden = false;
  TextCapitalization _textCapitalization = TextCapitalization.none;

  @override
  void initState() {
    _mapTextCapitalization();
    _controller ??= widget.controller ?? TextEditingController();
    _hidden = widget.password ?? false;
    if (widget.initialValue != null)
      _controller.value = _controller.value.copyWith(
        text: widget.initialValue ?? '',
        selection: TextSelection(
          baseOffset: widget.initialValue?.length ?? 0,
          extentOffset: widget.initialValue?.length ?? 0,
        ),
      );

    _focusNode = widget.focusNode ?? FocusNode();
    _focusNode.addListener(onFocused);
    super.initState();

    widget._onDeleteFieldController.stream.listen((event) {
      if (event != null && event is bool && event) {
        _controller?.clear();
        widget.onChanged?.call('');
      }
    });

    widget.onInitDeleteController?.call(widget._onDeleteFieldController);
  }

  void _mapTextCapitalization() {
    _textCapitalization = widget.textCapitalization ?? TextCapitalization.none;
    final keyboardType = widget.keyboardType ?? TextInputType.text;
    if (keyboardType.index == TextInputType.name.index) {
      _textCapitalization = TextCapitalization.words;
    } else if (keyboardType.index == TextInputType.emailAddress.index) {
      _textCapitalization = TextCapitalization.none;
    } else {
      _textCapitalization = TextCapitalization.sentences;
    }
  }

  void onFocused() {
    final text = _controller.text;
    if (mounted) {
      setState(() {
        _controller.value = _controller.value.copyWith(
          text: text ?? '',
          selection: TextSelection(baseOffset: text?.length ?? 0, extentOffset: text?.length ?? 0),
        );
      });
    }
  }

  @override
  void dispose() {
    widget._onDeleteFieldController?.close();
    _controller.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      enabled: widget.enable,
      onFieldSubmitted: (value) {
        FocusScope.of(context).requestFocus(widget.nextFocus ?? FocusNode());
        widget.onDone?.call(value);
      },
      style: widget.enable ? theme.textTheme.bodyText1 : theme.textTheme.bodyText1.textColor(theme.disabledColor),
      validator: widget.validator,
      controller: _controller,
      onChanged: (value) => widget.onChanged?.call(value),
      readOnly: widget.readOnly,
      inputFormatters: widget.inputFormatters,
      onEditingComplete: () => Log.d('onEditingComplete (${_controller.text})'),
      onTap: () => widget.onTap?.call(),
      obscureText: _hidden ?? false,
      cursorColor: theme.primaryColor,
      maxLines: widget.password ? 1 : widget.maxLines,
      minLines: widget.minLines,
      maxLength: widget.maxLength,
      focusNode: _focusNode,
      textInputAction: widget.textInputAction ?? TextInputAction.done,
      textAlign: widget.textAlign ?? TextAlign.start,
      textCapitalization: _textCapitalization,
      keyboardType: widget.keyboardType ?? TextInputType.text,
      buildCounter: (BuildContext context, {int currentLength, int maxLength, bool isFocused}) {
        if (widget.visibleCounterText ?? true && maxLength != null) {
          return Text(
            '$currentLength/$maxLength',
            style: theme.textTheme.bodyText2,
          );
        }
        return null;
      },
      decoration: widget.decoration ??
          InputDecoration(
            filled: true,
            fillColor: Color(0xFFF4F6F6),
            suffixIcon: widget.suffixIcon,
            prefixIcon: widget.prefixIcon,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: theme.primaryColor),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.transparent),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: Colors.transparent),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            hintText: widget.hintText,
            hintStyle: widget?.hintStyle ?? Theme.of(context).textTheme.bodyText1.apply(color: theme.hintColor),
            contentPadding: EdgeInsets.all(widget.contentPadding ?? 8),
          ),
    );
  }
}
