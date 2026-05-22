import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trana/core/di/provider.dart';
import 'package:trana/core/error/result.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

part 'ai_auto_fill_view_model.freezed.dart';
part 'ai_auto_fill_view_model.g.dart';

// ==================== State ====================

@freezed
abstract class AiAutoFillState with _$AiAutoFillState {
  const factory AiAutoFillState({
    @Default('') String name, // 상품명 (AI 분석 결과)
    @Default(0) int amount, // 가격 (AI 분석 결과)
    @Default('') String condition, // 상품 상태 (AI 분석 결과)
    @Default('') String details, // 상품 상세 정보 (AI 분석 결과)
    @Default(false) bool isLoading,
    @Default(false) bool completed,
    String? error,
  }) = _AiAutoFillState;
}

// ==================== ViewModel ====================

@riverpod
class AiAutoFillViewModel extends _$AiAutoFillViewModel {
  @override
  AiAutoFillState build() {
    return const AiAutoFillState();
  }

  /// 이미지 분석
  Future<void> analyzeImages(List<AssetEntity> images) async {
    if (images.isEmpty) return;
    state = state.copyWith(isLoading: true, error: null);

    try {
      final xFiles = await Future.wait(
        images.map((image) async {
          final file = await image.file;
          return XFile(file!.path);
        }),
      );

      final result = await ref
          .read(aiAutoFillRepositoryProvider)
          .analyzeImages(xFiles);

      state = switch (result) {
        Success(:final data) => state.copyWith(
          isLoading: false,
          completed: true,
          name: data.productName ?? '',
          amount: data.amount ?? 0,
          condition: data.conditionSummary ?? '',
          details: data.conditionDetails ?? '',
        ),
        Failure(:final failure) => state.copyWith(
          isLoading: false,
          error: failure.message,
        ),
      };
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
    }
  }

  void clearError() => state = state.copyWith(error: null);
}
