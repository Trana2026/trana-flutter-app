// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_page_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(MyPageViewModel)
final myPageViewModelProvider = MyPageViewModelProvider._();

final class MyPageViewModelProvider
    extends $NotifierProvider<MyPageViewModel, MyPageState> {
  MyPageViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'myPageViewModelProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$myPageViewModelHash();

  @$internal
  @override
  MyPageViewModel create() => MyPageViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MyPageState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MyPageState>(value),
    );
  }
}

String _$myPageViewModelHash() => r'ce0d2733e636e25d887d7d8c2e3481a57044b60e';

abstract class _$MyPageViewModel extends $Notifier<MyPageState> {
  MyPageState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<MyPageState, MyPageState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<MyPageState, MyPageState>,
              MyPageState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
