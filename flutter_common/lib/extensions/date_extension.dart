import 'package:intl/intl.dart';

import '../constants.dart';

extension DateTimeExtensionCommon on DateTime {
  String formatWithArrayPattern(List<String> patterns, {String separator = ' '}) {
    final dateFormat = DateFormat();
    for (var pattern in patterns) {
      dateFormat.addPattern(pattern, separator);
    }
    return dateFormat.format(this);
  }

  String format(String pattern) => DateFormat(pattern).format(this);

  DateTime addMonths(int skipCount, {bool convertToUTC}) {
    if ((skipCount ?? 0) <= 0) return this;

    DateTime input = DateTime.fromMicrosecondsSinceEpoch(microsecondsSinceEpoch).toLocal();
    final result = DateTime(
      input.year,
      input.month + skipCount,
      input.day,
      input.hour,
      input.minute,
      input.second,
      input.millisecond,
      input.microsecond,
    );

    if (convertToUTC ?? false) return result.toUtc();
    return result;
  }

  int get daysInMonthCommon {
    if (month == DateTime.february) {
      final bool isLeapYear = (year % 4 == 0) && (year % 100 != 0) || (year % 400 == 0);
      if (isLeapYear) return 29;
      return 28;
    }
    return DateTimePattern.daysInMonths[month - 1];
  }

  bool isSameDayCommon(DateTime other) {
    return year == other.year && month == other.month && day == other.day;
  }
}
