import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_common/common.dart';
import 'package:sdk/flutter_sdk.dart';

import 'text_input_area.dart';

/// For simple usage:
//             DateTimeInputArea(
//               hintText: 'Ngày cấp',
//               onSelectedDate: (date) {
//               },
//             ),
class DateTimeInputArea extends StatefulWidget {
  final Function(DateTime) onSelectedDate;
  final String hintText;
  final TextStyle hintStyle;
  final DateFormat dateFormatDisplay;
  final InputDecoration inputDecoration;
  final FormFieldValidator<String> validator;
  final bool readOnly;
  final bool displayInitialValue;
  final Icon prefixIcon;
  final Icon suffixIcon;
  final DateTime initialDate;
  final DateTime currentDate;
  final DateTime firstDate;
  final DateTime lastDate;
  final DateTime newSelectedDate;
  final double contentPadding;
  final bool enable;

  const DateTimeInputArea({
    Key key,
    this.onSelectedDate,
    this.hintText,
    this.hintStyle,
    this.dateFormatDisplay,
    this.inputDecoration,
    this.validator,
    this.displayInitialValue = true,
    this.readOnly = true,
    this.enable = true,
    this.prefixIcon,
    this.suffixIcon,
    this.initialDate,
    this.currentDate,
    this.newSelectedDate,
    this.contentPadding,
    @required this.firstDate,
    this.lastDate,
  })  : assert(firstDate != null),
        super(key: key);

  @override
  _DateTimeInputAreaState createState() => _DateTimeInputAreaState();
}

class _DateTimeInputAreaState extends State<DateTimeInputArea> {
  DateTime _selectedDate;
  TextEditingController _controller;
  final _defaultLastDate = 2100;
  String _initialValue;
  bool _displayInitialValue;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _displayInitialValue = widget.displayInitialValue ?? true;
    if (widget.initialDate != null) {
      _initialValue = widget.dateFormatDisplay != null
          ? widget.dateFormatDisplay.format(widget.initialDate)
          : DateFormat.yMMMd().format(widget.initialDate);
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void didUpdateWidget(DateTimeInputArea oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (_selectedDate != null &&
        widget.newSelectedDate != null &&
        _selectedDate != widget.newSelectedDate) {
      _selectedDate = widget.newSelectedDate;
      _updateText();
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextInputArea(
      enable: widget.enable,
      prefixIcon: widget.prefixIcon,
      suffixIcon: widget.suffixIcon ?? const Icon(Icons.calendar_today_rounded),
      initialValue: _displayInitialValue ? _initialValue : '',
      validator: widget.validator,
      controller: _controller,
      readOnly: widget.readOnly,
      hintText: widget.hintText,
      hintStyle: widget.hintStyle,
      contentPadding: widget.contentPadding,
      onTap: () {
        _selectDate(context);
      },
      decoration: widget.inputDecoration,
    );
  }

  _selectDate(BuildContext context) async {
    _displayInitialValue = true;

    final newSelectedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? (widget.initialDate ?? widget.firstDate),
      firstDate: widget.firstDate,
      lastDate: widget.lastDate ?? DateTime(_defaultLastDate),
      currentDate: widget.currentDate ?? DateTime.now(),
    );

    if (newSelectedDate != null) {
      _selectedDate = newSelectedDate;
      _updateText();

      widget.onSelectedDate?.call(_selectedDate);
    }
  }

  _updateText() {
    final dateFormatted = widget.dateFormatDisplay?.format(_selectedDate) ??
        _selectedDate.format('dd/MM/yyyy');
    _controller
      ..text = dateFormatted
      ..selection = TextSelection.fromPosition(TextPosition(
          offset: _controller.text.length, affinity: TextAffinity.upstream));
  }
}
