// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edit_profile_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(EditProfileViewModel)
final editProfileViewModelProvider = EditProfileViewModelProvider._();

final class EditProfileViewModelProvider
    extends $NotifierProvider<EditProfileViewModel, EditProfileState> {
  EditProfileViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'editProfileViewModelProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$editProfileViewModelHash();

  @$internal
  @override
  EditProfileViewModel create() => EditProfileViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(EditProfileState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<EditProfileState>(value),
    );
  }
}

String _$editProfileViewModelHash() =>
    r'6d970c56f8cc009531486ed08e49904a103d257f';

abstract class _$EditProfileViewModel extends $Notifier<EditProfileState> {
  EditProfileState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<EditProfileState, EditProfileState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<EditProfileState, EditProfileState>,
              EditProfileState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
