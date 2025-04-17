/// Application-wide constants
class AppConstants {
  AppConstants._();

  /// App information
  static const String appName = 'Flutter App Template';
  static const String appVersion = '1.0.0';
  static const String appBuildNumber = '1';
  static const String appPackageName = 'com.example.flutter_app_template';

  /// API constants
  static const int apiConnectTimeout = 30000; // 30 seconds
  static const int apiReceiveTimeout = 30000; // 30 seconds
  static const int apiSendTimeout = 30000; // 30 seconds

  /// Local storage configuration
  static const String databaseName = 'app_database.db';
  static const int databaseVersion = 1;

  /// Animation durations
  static const Duration shortAnimationDuration = Duration(milliseconds: 200);
  static const Duration mediumAnimationDuration = Duration(milliseconds: 350);
  static const Duration longAnimationDuration = Duration(milliseconds: 500);

  /// UI constants
  static const double defaultBorderRadius = 8.0;
  static const double defaultPadding = 16.0;
  static const double defaultMargin = 16.0;
  static const double defaultElevation = 2.0;

  /// Cache configuration
  static const Duration cacheValidDuration = Duration(hours: 24);
  static const int maxCacheItems = 100;
  static const int maxCacheSizeBytes = 10 * 1024 * 1024; // 10 MB

  /// Auth constants
  static const Duration tokenExpirationThreshold = Duration(minutes: 5);
  static const Duration sessionTimeout = Duration(minutes: 30);

  /// Image constants
  static const double defaultImageQuality = 0.8;
  static const double defaultImageMaxWidth = 1920.0;
  static const double defaultImageMaxHeight = 1080.0;

  /// Network timeouts and retry configuration
  static const Duration networkTimeoutDuration = Duration(seconds: 30);
  static const int maxNetworkRetries = 3;
  static const Duration retryDelayDuration = Duration(seconds: 2);

  /// Pagination
  static const int defaultPageSize = 20;

  /// Rate limiting
  static const Duration defaultApiRateLimitDuration = Duration(minutes: 1);
  static const int maxApiCallsPerMinute = 60;

  /// Feature flags
  static const bool enableAnalytics = true;
  static const bool enableCrashReporting = true;
  static const bool enableRemoteConfig = true;
  static const bool enableOfflineMode = true;

  /// Regex patterns
  static const String emailPattern =
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
  static const String urlPattern =
      r'^(https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w \.-]*)*\/?$';
  static const String phonePattern = r'^\+?[0-9]{8,15}$';

  /// Date formats
  static const String dateFormatFull = 'yyyy-MM-dd HH:mm:ss';
  static const String dateFormatShort = 'yyyy-MM-dd';
  static const String dateFormatISO = 'yyyy-MM-ddTHH:mm:ss.SSSZ';

  /// Default values
  static const String defaultAvatarAsset = 'assets/images/default_avatar.png';
  static const String defaultErrorImage = 'assets/images/error_image.png';
  static const String defaultPlaceholderImage =
      'assets/images/placeholder_image.png';
}
