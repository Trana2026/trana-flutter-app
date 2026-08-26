import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trana/core/config/app_config.dart';

part 'demo_mode_provider.g.dart';

@Riverpod(keepAlive: true)
class DemoMode extends _$DemoMode {
  @override
  bool? build() => null;

  /// 데모 모드 활성 여부 조회
  Future<bool> fetch() async {
    final dio = Dio(BaseOptions(baseUrl: AppConfig.apiBaseUrl));
    try {
      final response = await dio.get<Map<String, dynamic>>('/v1/demo/mode');
      final enabled = (response.data?['enabled'] as bool?) ?? false;
      state = enabled;
      return enabled;
    } on DioException catch (e) {
      debugPrint(
        '[DemoMode] fetch failed: ${e.requestOptions.method} ${e.requestOptions.path} '
        '${e.response?.statusCode} ${e.response?.data}',
      );
      rethrow;
    }
  }
}
