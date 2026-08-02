import 'dart:typed_data';

/// 신분증 감지 이벤트 (Native SDK → Flutter)
sealed class IdCardDetectionEvent {}

/// 신분증 감지 중 → 품질 이상 없음
class IdCardDetecting extends IdCardDetectionEvent {}

/// 신분증 정렬 완료 → 촬영 가능
/// [croppedImageBytes]: SDK가 크롭 및 정렬한 JPEG 바이트 (null이면 takePicture 폴백)
class IdCardReadyToCapture extends IdCardDetectionEvent {
  final Uint8List? croppedImageBytes;
  IdCardReadyToCapture({this.croppedImageBytes});
}

/// 신분증 감지 품질 이슈
class IdCardError extends IdCardDetectionEvent {
  final String message;
  IdCardError(this.message);
}

/// 얼굴/Liveness 감지 이벤트 (Native SDK → Flutter)
sealed class FaceDetectionEvent {}

/// 얼굴 감지 중 → 모션 지시
class FaceDetecting extends FaceDetectionEvent {
  final String instruction;
  FaceDetecting(this.instruction);
}

/// Liveness 모션 검증 완료 → 캡처 게이트 진입 (정면 바라보고 움직이지 마세요 안내 나오는 구간)
class FaceLivenessComplete extends FaceDetectionEvent {}

/// 캡처 품질 게이트 통과 (정면 + 양눈 OPEN) → 촬영 수행
class FaceReadyToCapture extends FaceDetectionEvent {}

/// 얼굴 감지 실패
class FaceError extends FaceDetectionEvent {}
