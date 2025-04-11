import 'package:equatable/equatable.dart';
import 'package:features_force_update/src/domain/value_objects/value_objects.dart';
import 'package:flutter/foundation.dart';

class ForceUpdateTargetVersion extends Equatable {
  const ForceUpdateTargetVersion({
    required this.iosVersion,
    required this.androidVersion,
  });

  final Version iosVersion;
  final Version androidVersion;

  Version? get defaultTargetPlatformVersion {
    return switch (defaultTargetPlatform) {
      TargetPlatform.iOS => iosVersion,
      TargetPlatform.android => androidVersion,
      _ => null,
    };
  }
  
  @override
  List<Object?> get props => [iosVersion, androidVersion];
}
