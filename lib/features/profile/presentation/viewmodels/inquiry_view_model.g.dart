// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'inquiry_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(InquiryViewModel)
final inquiryViewModelProvider = InquiryViewModelProvider._();

final class InquiryViewModelProvider
    extends $NotifierProvider<InquiryViewModel, InquiryState> {
  InquiryViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'inquiryViewModelProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$inquiryViewModelHash();

  @$internal
  @override
  InquiryViewModel create() => InquiryViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(InquiryState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<InquiryState>(value),
    );
  }
}

String _$inquiryViewModelHash() => r'5c344b20eab4cb370a5c7694f8b1eadb26e8bab2';

abstract class _$InquiryViewModel extends $Notifier<InquiryState> {
  InquiryState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<InquiryState, InquiryState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<InquiryState, InquiryState>,
              InquiryState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
