const List<int> daysInMonths = <int>[31, -1, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];

extension DateTimeExtension on DateTime {
  DateTime get date => DateTime(this.year, this.month, this.day);

  bool operator >=(DateTime other) {
    if (this == null || other == null) return false;
    var now = this.toUtc().millisecondsSinceEpoch;
    var otherUtc = other.toUtc().millisecondsSinceEpoch;
    return now >= otherUtc;
  }

  bool operator >(DateTime other) {
    if (this == null || other == null) return false;
    var now = this.toUtc().millisecondsSinceEpoch;
    var otherUtc = other.toUtc().millisecondsSinceEpoch;
    return now > otherUtc;
  }

  bool operator <=(DateTime other) {
    if (this == null || other == null) return false;
    var now = this.toUtc().millisecondsSinceEpoch;
    var otherUtc = other.toUtc().millisecondsSinceEpoch;
    return now <= otherUtc;
  }

  bool operator <(DateTime other) {
    if (this == null || other == null) return false;
    var now = this.toUtc().millisecondsSinceEpoch;
    var otherUtc = other.toUtc().millisecondsSinceEpoch;
    return now < otherUtc;
  }

  DateTime addMonth(int month) {
    return DateTime(year, this.month + month, day);
  }

  int get daysInMonth {
    if (month == DateTime.february) {
      final bool isLeapYear = (year % 4 == 0) && (year % 100 != 0) || (year % 400 == 0);
      if (isLeapYear) return 29;
      return 28;
    }
    return daysInMonths[month - 1];
  }

  bool isSameDay(DateTime other) {
    if (this == null || other == null) return false;

    return this.year == other.year && this.month == other.month && this.day == other.day;
  }
}
