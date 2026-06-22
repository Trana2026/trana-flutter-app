import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:trana/core/di/provider.dart';
import 'package:trana/core/error/failure.dart';
import 'package:trana/core/error/result.dart';
import 'package:trana/features/ekyc/domain/entities/adult_kyc_result_entity.dart';
import 'package:trana/features/ekyc/domain/entities/id_card_ocr_entity.dart';
import 'package:trana/features/ekyc/domain/repositories/ekyc_repository.dart';

part 'adult_kyc_view_model.g.dart';

/// 성인 KYC 전체 상태 클래스
class AdultKycState {
  final String? signupSessionId;
  final String? requestId;
  final IdCardOcrEntity? ocrResult;
  final String? idCardImagePath;
  final bool phoneSubmitted;
  final AdultKycResultEntity? kycResult;

  const AdultKycState({
    this.signupSessionId,
    this.requestId,
    this.ocrResult,
    this.idCardImagePath,
    this.phoneSubmitted = false,
    this.kycResult,
  });

  AdultKycState copyWith({
    String? signupSessionId,
    String? requestId,
    IdCardOcrEntity? ocrResult,
    String? idCardImagePath,
    bool? phoneSubmitted,
    AdultKycResultEntity? kycResult,
  }) => AdultKycState(
    signupSessionId: signupSessionId ?? this.signupSessionId,
    requestId: requestId ?? this.requestId,
    ocrResult: ocrResult ?? this.ocrResult,
    idCardImagePath: idCardImagePath ?? this.idCardImagePath,
    phoneSubmitted: phoneSubmitted ?? this.phoneSubmitted,
    kycResult: kycResult ?? this.kycResult,
  );
}

/// 성인 KYC 4단계 인증 흐름 ViewModel
/// keepAlive: 끝날때까지 state 보존 필수
@Riverpod(keepAlive: true)
class AdultKycViewModel extends _$AdultKycViewModel {
  EkycRepository get _repository => ref.read(ekycRepositoryProvider);

  /// 초기 상태 (빈 KYC 상태)
  @override
  AdultKycState build() => const AdultKycState();

  /// TermsViewModel에서 발급받은 signupSessionId 저장
  void setSignupSessionId(String id) {
    state = state.copyWith(signupSessionId: id);
  }

  /// 신분증 OCR 업로드. 페이지에서 촬영한 File을 전달받음
  Future<Result<IdCardOcrEntity>> ocrIdCard(File imageFile) async {
    final signupSessionId = state.signupSessionId;
    debugPrint(
      '[OCR] signupSessionId=$signupSessionId, file=${imageFile.path}',
    );
    if (signupSessionId == null) {
      debugPrint('[OCR] FAIL: signupSessionId is null');
      return Failure(const UnknownFailure('signupSessionId가 없습니다'));
    }

    final result = await _repository.ocrIdCard(
      signupSessionId: signupSessionId,
      imageFile: imageFile,
    );

    debugPrint('[OCR] result=${result.runtimeType}');
    if (result case Failure(:final failure)) {
      debugPrint('[OCR] FAIL: ${failure.runtimeType} - ${failure.message}');
    }
    if (result case Success(:final data)) {
      state = state.copyWith(
        requestId: data.requestId,
        ocrResult: data,
        idCardImagePath: imageFile.path,
      );
    }
    return result;
  }

  /// 신분증 진위확인
  Future<Result<void>> verifyIdCard() async {
    final requestId = state.requestId;
    if (requestId == null)
      return Failure(const UnknownFailure('requestId가 없습니다'));

    return await _repository.verifyIdCard(requestId: requestId);
  }

  /// 휴대폰 번호 기록
  Future<Result<void>> submitPhone({required String phone}) async {
    final requestId = state.requestId;
    if (requestId == null)
      return Failure(const UnknownFailure('requestId가 없습니다'));

    final result = await _repository.submitPhone(
      requestId: requestId,
      phone: phone,
    );
    if (result case Success()) {
      state = state.copyWith(phoneSubmitted: true);
    }
    return result;
  }

  /// 얼굴 비교 + 가입 완료.
  /// 페이지에서 촬영한 File을 전달받아서 수행
  Future<Result<AdultKycResultEntity>> compareFace(File imageFile) async {
    final requestId = state.requestId;
    if (requestId == null) {
      return Failure(const UnknownFailure('requestId가 없습니다'));
    }

    final result = await _repository.compareFace(
      requestId: requestId,
      imageFile: imageFile,
    );
    if (result case Success(:final data)) {
      state = state.copyWith(kycResult: data);
    }
    return result;
  }
}
