// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'terms_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// 약관 목록 조회 및 동의 처리 ViewModel

@ProviderFor(TermsViewModel)
final termsViewModelProvider = TermsViewModelProvider._();

/// 약관 목록 조회 및 동의 처리 ViewModel
final class TermsViewModelProvider
    extends $AsyncNotifierProvider<TermsViewModel, List<TermsEntity>> {
  /// 약관 목록 조회 및 동의 처리 ViewModel
  TermsViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'termsViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$termsViewModelHash();

  @$internal
  @override
  TermsViewModel create() => TermsViewModel();
}

String _$termsViewModelHash() => r'6acd2b7e494d31bc9aa3950f36d070dd3d012d0a';

/// 약관 목록 조회 및 동의 처리 ViewModel

abstract class _$TermsViewModel extends $AsyncNotifier<List<TermsEntity>> {
  FutureOr<List<TermsEntity>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref =
        this.ref as $Ref<AsyncValue<List<TermsEntity>>, List<TermsEntity>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<TermsEntity>>, List<TermsEntity>>,
              AsyncValue<List<TermsEntity>>,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
