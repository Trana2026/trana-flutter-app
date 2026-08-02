import 'dart:io';
import 'dart:typed_data';

import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:trana/legacy/idcard_face_ekyc/ekyc/domain/entities/detection_event.dart';

/// Native SDK 감지 결과를 Flutter로 스트리밍하는 서비스
///
/// MethodChannel 'com.trana/ekyc'로 모드 설정 + 프레임 전송
/// EventChannel로 감지 상태 수신
class EkycDetectionService {
  static const _channel = MethodChannel('com.trana/ekyc');
  static const _idCardEvents = EventChannel('com.trana/ekyc/id-card-status');
  static const _faceEvents = EventChannel('com.trana/ekyc/face-status');

  // MethodChannel 큐 과부하 방지 rate limiter
  // 백그라운드 이동 후 invokeMethod가 즉시 반환되므로 프레임이 빠르게 누적될 수 있음
  // _pendingFrames > 0이면 이전 전송이 아직 처리 중 = 해당 프레임 skip
  int _pendingFrames = 0;
  int _frameLogCount = 0;

  /// 신분증 감지 상태 스트림
  Stream<IdCardDetectionEvent> get idCardStream => _idCardEvents
      .receiveBroadcastStream()
      .map((event) => _parseIdCardEvent(event as Map));

  /// 얼굴/Liveness 감지 상태 스트림
  Stream<FaceDetectionEvent> get faceStream => _faceEvents
      .receiveBroadcastStream()
      .map((event) => _parseFaceEvent(event as Map));

  /// NCP CLOVA eyed 라이선스 검증 (SDK 감지 활성화를 위해 필요)
  Future<bool> verifyLicense({
    required String invokeUrl,
    required String secretKey,
  }) async {
    final result = await _channel.invokeMethod<bool>('verifyLicense', {
      'invokeUrl': invokeUrl,
      'secretKey': secretKey,
    });
    return result ?? false;
  }

  Future<void> startIdCardDetection() =>
      _channel.invokeMethod('startIdCardDetection');

  Future<void> startFaceDetection() =>
      _channel.invokeMethod('startFaceDetection');

  Future<void> stopDetection() => _channel.invokeMethod('stopDetection');

  /// CameraImage 프레임을 NV21로 변환 후 Native에 전송
  /// Native 측이 즉시 반환하므로 _pendingFrames는 MethodChannel 전송 시간만큼만 증가
  /// [sensorOrientation]: 카메라 센서 방향(후면 90 / 전면 270), 회전 보정에 사용
  Future<void> analyzeFrame(
    CameraImage image, {
    bool isFrontCamera = false,
    int sensorOrientation = 90,
  }) async {
    if (_pendingFrames > 0) return;
    _pendingFrames++;
    try {
      final Map<String, dynamic> args;
      if (Platform.isIOS) {
        // iOS: BGRA8888 단일 plane이므로 변환 없이 그대로 전달 (bytesPerRow 포함)
        final plane = image.planes.first;
        if (_frameLogCount < 5) {
          _frameLogCount++;
          debugPrint(
            '[eKYC-iOS] frame ${image.width}x${image.height} '
            'planes=${image.planes.length} bpr=${plane.bytesPerRow} '
            'group=${image.format.group}',
          );
        }
        args = {
          'bytes': plane.bytes,
          'width': image.width,
          'height': image.height,
          'bytesPerRow': plane.bytesPerRow,
          'flip': isFrontCamera,
          // iOS 카메라 플러그인은 프레임을 이미 화면 방향으로 회전해 전달하므로 추가 회전 0
          'sensorOrientation': 0,
        };
      } else {
        // Android: YUV_420_888은 3 plane이므로 NV21로 변환
        args = {
          'bytes': _convertToNV21(image),
          'width': image.width,
          'height': image.height,
          'flip': isFrontCamera,
          'sensorOrientation': sensorOrientation,
        };
      }
      await _channel.invokeMethod('analyzeFrame', args);
    } finally {
      _pendingFrames--;
    }
  }

  /// YUV_420_888(CameraImage)를 NV21(ByteArray)로 변환
  static Uint8List _convertToNV21(CameraImage image) {
    final int width = image.width;
    final int height = image.height;
    final yPlane = image.planes[0];
    final uPlane = image.planes[1];
    final vPlane = image.planes[2];

    final nv21 = Uint8List(width * height + (width * height) ~/ 2);
    int idx = 0;

    // Y plane
    for (int row = 0; row < height; row++) {
      final rowOffset = row * yPlane.bytesPerRow;
      for (int col = 0; col < width; col++) {
        nv21[idx++] = yPlane.bytes[rowOffset + col];
      }
    }

    // VU interleaved (NV21 format)
    final uvHeight = height ~/ 2;
    final uvWidth = width ~/ 2;
    final uBytesPerPixel = uPlane.bytesPerPixel ?? 1;
    final vBytesPerPixel = vPlane.bytesPerPixel ?? 1;

    for (int row = 0; row < uvHeight; row++) {
      for (int col = 0; col < uvWidth; col++) {
        final uIdx = row * uPlane.bytesPerRow + col * uBytesPerPixel;
        final vIdx = row * vPlane.bytesPerRow + col * vBytesPerPixel;
        nv21[idx++] = vPlane.bytes[vIdx]; // V first in NV21
        nv21[idx++] = uPlane.bytes[uIdx];
      }
    }

    return nv21;
  }

  IdCardDetectionEvent _parseIdCardEvent(Map event) {
    final debug = event['debug'] as String?;
    if (debug != null) debugPrint('[eKYC-iOS][IdCard] $debug');
    final status = event['status'] as String?;
    return switch (status) {
      'readyToCapture' => IdCardReadyToCapture(
        croppedImageBytes: event['croppedImage'] as Uint8List?,
      ),
      'error' => IdCardError(event['message'] as String? ?? '인식 실패'),
      _ => IdCardDetecting(),
    };
  }

  FaceDetectionEvent _parseFaceEvent(Map event) {
    final status = event['status'] as String?;
    return switch (status) {
      'livenessComplete' => FaceLivenessComplete(),
      'readyToCapture' => FaceReadyToCapture(),
      'error' => FaceError(),
      _ => FaceDetecting(event['instruction'] as String? ?? '정면을 응시해주세요'),
    };
  }
}
