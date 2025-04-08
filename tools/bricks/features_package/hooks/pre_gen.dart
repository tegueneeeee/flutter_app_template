import 'dart:io';

import 'package:mason/mason.dart';

void run(HookContext context) {
  final featureName = context.vars['feature_name'] as String;
  final featurePath = 'packages/features/$featureName';

  final isExists = Directory(featurePath).existsSync();

  if (isExists) {
    throw Exception('$featurePath already exists');
  }

  _addFeaturePath(featurePath: featurePath, logger: context.logger); 
}

void _addFeaturePath({
  required String featurePath,
  required Logger logger,
}) {
  logger.info('📦 Adding feature path...');

  final pubspecFile = File('pubspec.yaml');
  final newFeature = '''  - $featurePath''';
  final lines = pubspecFile.readAsLinesSync();

  bool foundFeatures = false;
  for (int i = 0; i < lines.length; i++) {
    if (lines[i].trim() == '# features') {
      foundFeatures = true;
      int j = i + 1;
      while (j < lines.length && 
             lines[j].trim().startsWith('-') && 
             !lines[j].trim().startsWith('#')) {
        j++;
      }
      lines.insert(j, newFeature);
      break;
    }
  }

  if (!foundFeatures) {
    logger.warn('⚠️ Could not find the "features" section in pubspec.yaml. Manual addition is required.');
    return;
  }

  pubspecFile.writeAsStringSync(lines.join('\n'));
  logger.success('✅ Feature path added successfully! $featurePath');
}
