import 'dart:io';

import 'package:mason/mason.dart';

void run(HookContext context) {
  final featureName = context.vars['feature_name'] as String;

  final isExists = Directory('packages/features/$featureName').existsSync();

  if (isExists) {
    throw Exception('packages/features/$featureName already exists');
  }
}
