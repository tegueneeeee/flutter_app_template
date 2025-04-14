import 'package:flutter/foundation.dart';
import 'package:simple_logger/simple_logger.dart';

final logger =
    SimpleLogger()..setLevel(
      kReleaseMode ? Level.WARNING : Level.FINEST,
      includeCallerInfo: true,
    );
