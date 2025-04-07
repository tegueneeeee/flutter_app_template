import 'dart:io';

import 'package:mason/mason.dart';

void run(HookContext context) {
  final featureName = context.vars['feature_name'] as String;
  final useRiverpod = context.vars['use_riverpod'] as bool;
  final useFreezed = context.vars['use_freezed'] as bool;

  _addDependency(
    featureName: featureName,
    useRiverpod: useRiverpod,
    useFreezed: useFreezed,
    logger: context.logger,
  );

  _replaceAnalysisOptionsYaml(
    featureName: featureName,
    useRiverpod: useRiverpod,
    useFreezed: useFreezed,
    logger: context.logger
  );

  _replaceBuildYaml(
    featureName: featureName,
    useRiverpod: useRiverpod,
    useFreezed: useFreezed,
    logger: context.logger
  );

  if (useRiverpod || useFreezed) {
    Process.runSync('melos', ['bootstrap']);
  }

  _addFeatureDependency(featureName: featureName, logger: context.logger);

  Process.runSync('dart', ['fix', '--apply']);
}

void _addDependency({
  required String featureName,
  required bool useRiverpod,
  required bool useFreezed,
  required Logger logger,
}) {
  if (!useRiverpod && !useFreezed) {
    return;
  }
  logger.info('📦 Adding dependencies...');
  if (useRiverpod) {
    Process.runSync('dart', [
      'pub',
      'add',
      'flutter_hooks',
      'hooks_riverpod',
      'riverpod_annotation',
      'dev:riverpod_generator',
      'dev:riverpod_lint',
      'dev:custom_lint',
    ], workingDirectory: 'packages/features/$featureName');
  }

  if (useFreezed) {
    Process.runSync('dart', [
      'pub',
      'add',
      'freezed_annotation',
      'json_annotation',
      'dev:freezed',
      'dev:json_serializable',
    ], workingDirectory: 'packages/features/$featureName');
  }
  logger.success('✅ Dependencies added successfully!');
}

void _replaceAnalysisOptionsYaml({
  required String featureName,
  required bool useRiverpod,
  required bool useFreezed,
  required Logger logger,
}) {
  logger.info('📄 Replacing analysis_options.yaml...');
  final filePath = 'packages/features/$featureName/analysis_options.yaml';

  final sb = StringBuffer();
  sb.write('''
include: package:very_good_analysis/analysis_options.7.0.0.yaml
    
analyzer:
''');

  if (useRiverpod) {
    sb.write('''
  plugins:
    # https://riverpod.dev/docs/introduction/getting_started#enabling-riverpod_lintcustom_lint
    - custom_lint
  exclude:
    - "**/*.g.dart"
    - "**/*.freezed.dart"
''');
  }
  sb.write('''
  errors:
    public_member_api_docs: ignore
    use_setters_to_change_properties: ignore
''');
  if (useFreezed) {
    sb.write('''
    invalid_annotation_target: ignore
''');
  }

  File(filePath).writeAsStringSync(sb.toString());
  logger.success('✅ analysis_options.yaml replaced successfully!');
}

void _replaceBuildYaml({
  required String featureName,
  required bool useRiverpod,
  required bool useFreezed,
  required Logger logger,
}) {
  logger.info('📄 Replacing build.yaml...');
  final filePath = 'packages/features/$featureName/build.yaml';

  final sb = StringBuffer();
  sb.write('''
targets:
  \$default:
    builders:
''');

  if (useRiverpod) {
    sb.write('''
      riverpod_generator:
        generate_for:
          include:
            - lib/{provider,**/provider}/**.dart
            # ページファイル内で navigatorProvider を定義できるようにする
            - lib/**/*_page.dart
''');
  }
  if (useFreezed) {
    sb.write('''
      freezed:
        # https://github.com/dart-lang/build/blob/master/docs/faq.md#how-do-i-avoid-running-builders-on-unnecessary-inputs
        generate_for:
          include:
            - lib/{model,**/model}/**.dart
      # https://github.com/google/json_serializable.dart/tree/master/json_serializable#build-configuration
      json_serializable:
        generate_for:
          include:
            - lib/{model,**/model}/**.dart
        options:
          field_rename: snake
          checked: true
''');
  }

  if (useRiverpod || useFreezed) {
    sb.write('''
      # https://github.com/dart-lang/source_gen#ignore_for_file
      source_gen:combining_builder:
        options:
          ignore_for_file:
            - type=lint
            - duplicate_ignore
''');
  }

  File(filePath).writeAsStringSync(sb.toString());
  logger.success('✅ build.yaml replaced successfully!');
}

void _addFeatureDependency({
  required String featureName,
  required Logger logger,
}) {
  logger.info('📦 Adding feature dependency in app');
  Process.runSync(
    'dart',
    [
      'pub',
      'add',
      'features_$featureName:{"path":"../../packages/features/$featureName"}',
    ],
    workingDirectory: 'apps/app',
  );
  logger.success('✅ Dependencies added successfully!');
}
