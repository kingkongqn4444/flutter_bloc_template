import 'package:intl/intl.dart';

import '../constants.dart';

extension DoubleExtensions on double {
  String toHoursMinutes() {
    var hour = toInt();
    var minute = ((this - hour) * 60).toInt();
    var duration = Duration(hours: hour, minutes: minute);
    String twoDigitMinutes = _toTwoDigits(duration.inMinutes.remainder(60));
    return '${duration.inHours}:$twoDigitMinutes';
  }

  String _toTwoDigits(int n) {
    if (n >= 10) return '$n';
    return '0$n';
  }

  String toStringWithDot() {
    final formatter = new NumberFormat(Constants.decimalFormat);
    return formatter.format(this);
  }

  String toPercentage(int fractionDigits, bool showSymbol) {
    final double result = this * 100.0;
    return (result.toStringAsFixed(fractionDigits) + ' ${showSymbol ? Constants.percentage : ''}').trim();
  }

  String removeTrailingZeros() {
    return toStringAsFixed(truncateToDouble() == this ? 0 : 1);
  }
}
