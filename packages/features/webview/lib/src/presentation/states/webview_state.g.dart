// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'webview_state.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$webviewStateHash() => r'56b6e611a4c2d4a69fa587656e6ad9effc552050';

/// Provider for the webview state
///
/// Copied from [WebviewState].
@ProviderFor(WebviewState)
final webviewStateProvider =
    AutoDisposeNotifierProvider<WebviewState, AsyncValue<WebUrl?>>.internal(
      WebviewState.new,
      name: r'webviewStateProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$webviewStateHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$WebviewState = AutoDisposeNotifier<AsyncValue<WebUrl?>>;
String _$webViewControllerHash() => r'90d76d71e9c2d28ebbc6cdd7b7d404031a62d91f';

/// Provider for the webview controller
///
/// Copied from [WebViewController].
@ProviderFor(WebViewController)
final webViewControllerProvider = AutoDisposeNotifierProvider<
  WebViewController,
  webview_flutter.WebViewController
>.internal(
  WebViewController.new,
  name: r'webViewControllerProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$webViewControllerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$WebViewController =
    AutoDisposeNotifier<webview_flutter.WebViewController>;
String _$isLoadingHash() => r'0b81f96f0f510f2699cd7784e779dbfc0d030173';

/// Provider for the loading state
///
/// Copied from [IsLoading].
@ProviderFor(IsLoading)
final isLoadingProvider = AutoDisposeNotifierProvider<IsLoading, bool>.internal(
  IsLoading.new,
  name: r'isLoadingProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$isLoadingHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$IsLoading = AutoDisposeNotifier<bool>;
String _$hasErrorHash() => r'3136d141ec93f4b9a8d52b2a695986f9cc39f029';

/// Provider for the error state
///
/// Copied from [HasError].
@ProviderFor(HasError)
final hasErrorProvider = AutoDisposeNotifierProvider<HasError, bool>.internal(
  HasError.new,
  name: r'hasErrorProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$hasErrorHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$HasError = AutoDisposeNotifier<bool>;
String _$progressRateHash() => r'd7ad5c9219c173594f9ddccea56f4828a7e43d06';

/// Provider for the progress rate
///
/// Copied from [ProgressRate].
@ProviderFor(ProgressRate)
final progressRateProvider =
    AutoDisposeNotifierProvider<ProgressRate, double>.internal(
      ProgressRate.new,
      name: r'progressRateProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$progressRateHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$ProgressRate = AutoDisposeNotifier<double>;
String _$canPopHash() => r'15ed949c1ae6af0029a29f256cdf661dd6791c23';

/// Provider for the can pop state
///
/// Copied from [CanPop].
@ProviderFor(CanPop)
final canPopProvider = AutoDisposeNotifierProvider<CanPop, bool>.internal(
  CanPop.new,
  name: r'canPopProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$canPopHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CanPop = AutoDisposeNotifier<bool>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
