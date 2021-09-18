extension StringExtension on String {
  bool parseBool() {
    final value = (this ?? '').toLowerCase();
    return value == 'true' || value == '1';
  }

  DateTime toDate() {
    final args = split('-');
    if (args.length == 3) {
      final year = int.tryParse(args[0]) ?? 0;
      final month = int.tryParse(args[1]) ?? 0;
      final day = int.tryParse(args[2]) ?? 0;
      if (year * month * day > 0) {
        return DateTime(year, month, day);
      }
    }
    return null;
  }
}
