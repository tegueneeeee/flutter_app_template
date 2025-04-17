/// Configuration library for accessing app config, flavors, and env variables
library shared_config;

// Main config classes
export 'src/build_config/app_build_config.dart';
export 'src/build_config/build_config.dart';
// Flavor management
export 'src/flavors/flavor.dart';
// Environment utilities
export 'src/utils/env_reader.dart';
export 'src/utils/utils.dart';
