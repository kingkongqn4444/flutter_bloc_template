class LogUtil {
  static const String _defTag = 'Log';
  static bool _debugMode = false;
  static int _maxLen = 128;
  static String _tagValue = _defTag;

  static void init({
    String tag = _defTag,
    bool isDebug = false,
    int maxLen = 128,
  }) {
    _tagValue = tag;
    _debugMode = isDebug;
    _maxLen = maxLen;
  }

  static void e(Object object, {String tag}) {
    _printLog(tag, ' error', object);
  }

  static void d(Object object, {String tag}) {
    if (_debugMode) {
      _printLog(tag, ' debug', object);
    }
  }

  static void _printLog(String tag, String stag, Object object) {
    var da = object.toString();
    tag = tag ?? _tagValue;
    if (da.length <= _maxLen) {
      print("$tag$stag $da");
      return;
    }
    print(
        '$tag$stag — — — — — — — — — — — — — — — — start — — — — — — — — — — — — — — — —');
    while (da.isNotEmpty) {
      if (da.length > _maxLen) {
        print("$tag$stag| ${da.substring(0, _maxLen)}");
        da = da.substring(_maxLen, da.length);
      } else {
        print("$tag$stag| $da");
        da = '';
      }
    }
    print(
        '$tag$stag — — — — — — — — — — — — — — — — end — — — — — — — — — — — — — — — — —');
  }
}