// ignore_for_file: constant_identifier_names

/// Enum representing different environment flavors
enum FlavorStatus {
  /// Development environment
  DEVELOPMENT,

  /// Staging environment
  STAGING,

  /// Production environment
  PRODUCTION,
}

/// Class for managing application flavor
class Flavor {
  const Flavor._();

  /// Current application flavor
  static FlavorStatus? flavor;

  /// Sets the application flavor
  static void setFlavor(FlavorStatus flavorStatus) {
    flavor = flavorStatus;
  }

  /// Returns true if the current flavor is development
  static bool get isDevelopment => flavor == FlavorStatus.DEVELOPMENT;

  /// Returns true if the current flavor is staging
  static bool get isStaging => flavor == FlavorStatus.STAGING;

  /// Returns true if the current flavor is production
  static bool get isProduction => flavor == FlavorStatus.PRODUCTION;
}
