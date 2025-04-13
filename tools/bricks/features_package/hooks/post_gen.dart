import 'dart:io';

import 'package:mason/mason.dart';

void run(HookContext context) {
  final featureName = context.vars['feature_name'] as String;

  _addFeatureDependency(featureName: featureName, logger: context.logger);

  Process.runSync('melos', ['bootstrap']);
  Process.runSync('dart', ['fix', '--apply']);
}

void _addFeatureDependency({
  required String featureName,
  required Logger logger,
}) {
  logger.info('📦 Adding feature dependency in app');
  Process.runSync('dart', [
    'pub',
    'add',
    'features_$featureName:{"path":"../../packages/features/$featureName"}',
  ], workingDirectory: 'apps/app');
  logger.success('✅ Dependencies added successfully!');
}
