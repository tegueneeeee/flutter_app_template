/// Storage keys used across the application
///
/// This centralizes all keys used for SharedPreferences, local storage,
/// or other key-value storage mechanisms. Using this class helps prevent
/// key conflicts and makes it easier to track all persistent data.
class StorageKeys {
  StorageKeys._();

  /// User-related storage keys
  static const String userToken = 'user_token';
  static const String refreshToken = 'refresh_token';
  static const String userId = 'user_id';
  static const String userEmail = 'user_email';
  static const String userName = 'user_name';
  static const String userProfileImage = 'user_profile_image';
  static const String isUserLoggedIn = 'is_user_logged_in';
  static const String lastLoginDate = 'last_login_date';

  /// Settings-related storage keys
  static const String appTheme = 'app_theme';
  static const String appLanguage = 'app_language';
  static const String appLocale = 'app_locale';
  static const String pushNotificationsEnabled = 'push_notifications_enabled';
  static const String emailNotificationsEnabled = 'email_notifications_enabled';
  static const String marketingNotificationsEnabled =
      'marketing_notifications_enabled';
  static const String biometricAuthEnabled = 'biometric_auth_enabled';
  static const String darkModeEnabled = 'dark_mode_enabled';
  static const String fontScale = 'font_scale';
  static const String defaultView = 'default_view';

  /// Cache-related storage keys
  static const String lastCacheUpdate = 'last_cache_update';
  static const String cachedUserData = 'cached_user_data';
  static const String cachedAppConfig = 'cached_app_config';
  static const String cachedHomeData = 'cached_home_data';
  static const String cacheVersion = 'cache_version';

  /// Feature flag keys
  static const String featureFlagPremium = 'feature_flag_premium';
  static const String featureFlagBeta = 'feature_flag_beta';
  static const String featureFlagNewUi = 'feature_flag_new_ui';

  /// App state keys
  static const String appFirstLaunch = 'app_first_launch';
  static const String appLastVersion = 'app_last_version';
  static const String onboardingCompleted = 'onboarding_completed';
  static const String termsAccepted = 'terms_accepted';
  static const String privacyPolicyAccepted = 'privacy_policy_accepted';
  static const String deviceToken = 'device_token';
  static const String installationId = 'installation_id';

  /// Content-related storage keys
  static const String recentSearches = 'recent_searches';
  static const String favoriteItems = 'favorite_items';
  static const String lastViewedItems = 'last_viewed_items';
  static const String bookmarks = 'bookmarks';
  static const String downloadedContent = 'downloaded_content';
  static const String savedDrafts = 'saved_drafts';

  /// Session-related storage keys
  static const String sessionStart = 'session_start';
  static const String sessionId = 'session_id';
  static const String lastActiveTime = 'last_active_time';
  static const String sessionCount = 'session_count';

  /// Developer/debug keys
  static const String debugModeEnabled = 'debug_mode_enabled';
  static const String mockApiEnabled = 'mock_api_enabled';
  static const String logLevel = 'log_level';
}
