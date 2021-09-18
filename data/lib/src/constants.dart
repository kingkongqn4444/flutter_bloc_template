class HttpStatusCode {
  static const int success = 200;
  static const int badRequest = 400;
  static const int unAuthorized = 401;
  static const int forbidden = 403;
  static const int internalServerError = 500;
}

class ResultStatus {
  static const String success = 'Success';
  static const String failed = 'Failed';
}

class SharedPreferencesKey {
  static const String language = 'language';
  static const String theme = 'theme';
  static const String refreshExpiresIn = 'refresh_expires_in';
  static const String env = 'env';
  static const String firstRun = 'first_run';
}
