// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'toast_visibility_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// 토스트가 화면에 떠 있는지 여부.
/// 홈 하단 배너처럼 토스트와 겹치면 안 되는 UI가 위치를 조정할 때 참조

@ProviderFor(ToastVisibility)
final toastVisibilityProvider = ToastVisibilityProvider._();

/// 토스트가 화면에 떠 있는지 여부.
/// 홈 하단 배너처럼 토스트와 겹치면 안 되는 UI가 위치를 조정할 때 참조
final class ToastVisibilityProvider
    extends $NotifierProvider<ToastVisibility, bool> {
  /// 토스트가 화면에 떠 있는지 여부.
  /// 홈 하단 배너처럼 토스트와 겹치면 안 되는 UI가 위치를 조정할 때 참조
  ToastVisibilityProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'toastVisibilityProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$toastVisibilityHash();

  @$internal
  @override
  ToastVisibility create() => ToastVisibility();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$toastVisibilityHash() => r'8e1efccc7ac3ae707d46b49e548f7b81b7e49b7f';

/// 토스트가 화면에 떠 있는지 여부.
/// 홈 하단 배너처럼 토스트와 겹치면 안 되는 UI가 위치를 조정할 때 참조

abstract class _$ToastVisibility extends $Notifier<bool> {
  bool build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<bool, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<bool, bool>,
              bool,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
