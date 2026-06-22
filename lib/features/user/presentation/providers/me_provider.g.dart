// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'me_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// 현재 사용자 조회 (실패/미로그인 시 null)

@ProviderFor(me)
final meProvider = MeProvider._();

/// 현재 사용자 조회 (실패/미로그인 시 null)

final class MeProvider
    extends
        $FunctionalProvider<
          AsyncValue<UserMeEntity?>,
          UserMeEntity?,
          FutureOr<UserMeEntity?>
        >
    with $FutureModifier<UserMeEntity?>, $FutureProvider<UserMeEntity?> {
  /// 현재 사용자 조회 (실패/미로그인 시 null)
  MeProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'meProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$meHash();

  @$internal
  @override
  $FutureProviderElement<UserMeEntity?> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<UserMeEntity?> create(Ref ref) {
    return me(ref);
  }
}

String _$meHash() => r'0f0bc72051f7deb94268aa8632fd5079b0bf5db3';
