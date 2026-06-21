package com.trana.trana

import ai.clova.eyed.image.ClovaVisionImage
import ai.clova.eyed.license.ClovaLicenseChecker
import android.content.Context
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.EventChannel
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import java.util.concurrent.Executors

/// Flutter - Native eKYC 브릿지
/// MethodChannel 'com.trana/ekyc': 모드 설정 + 프레임 분석
/// EventChannel 'com.trana/ekyc/id-card-status': 신분증 감지 상태 스트림
/// EventChannel 'com.trana/ekyc/face-status': 얼굴/Liveness 감지 상태 스트림
class EkycNativeHandler(private val context: Context, flutterEngine: FlutterEngine) : MethodChannel.MethodCallHandler {

    private val methodChannel = MethodChannel(
        flutterEngine.dartExecutor.binaryMessenger,
        "com.trana/ekyc",
    )

    private val idCardEventChannel = EventChannel(
        flutterEngine.dartExecutor.binaryMessenger,
        "com.trana/ekyc/id-card-status",
    )

    private val faceEventChannel = EventChannel(
        flutterEngine.dartExecutor.binaryMessenger,
        "com.trana/ekyc/face-status",
    )

    private var idCardEventSink: EventChannel.EventSink? = null
    private var faceEventSink: EventChannel.EventSink? = null

    private var idCardDetector: IdCardDetectorManager? = null
    private var faceDetector: FaceDetectorManager? = null
    private var consecutiveLogCount = 0L

    private enum class DetectionMode { NONE, ID_CARD, FACE }
    private var currentMode = DetectionMode.NONE

    // 단일 스레드 executor.
    // SDK thread-safety 미명시로 동시 호출 원천 차단.
    // 데몬 스레드로 설정해 앱 종료 시 자동 정리
    private val analysisExecutor = Executors.newSingleThreadExecutor { r ->
        Thread(r, "EkycAnalysis").also { it.isDaemon = true }
    }

    init {
        methodChannel.setMethodCallHandler(this)

        idCardEventChannel.setStreamHandler(object : EventChannel.StreamHandler {
            override fun onListen(arguments: Any?, events: EventChannel.EventSink?) {
                idCardEventSink = events
            }
            override fun onCancel(arguments: Any?) {
                idCardEventSink = null
            }
        })

        faceEventChannel.setStreamHandler(object : EventChannel.StreamHandler {
            override fun onListen(arguments: Any?, events: EventChannel.EventSink?) {
                faceEventSink = events
            }
            override fun onCancel(arguments: Any?) {
                faceEventSink = null
            }
        })
    }

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        when (call.method) {
            "startIdCardDetection" -> {
                currentMode = DetectionMode.ID_CARD
                idCardDetector = IdCardDetectorManager { idCardEventSink }
                result.success(null)
            }
            "startFaceDetection" -> {
                currentMode = DetectionMode.FACE
                val existing = faceDetector
                if (existing != null) {
                    existing.reset()
                } else {
                    faceDetector = FaceDetectorManager(context) { faceEventSink }
                }
                result.success(null)
            }
            "stopDetection" -> {
                currentMode = DetectionMode.NONE
                idCardDetector = null
                faceDetector = null
                result.success(null)
            }
            "verifyLicense" -> {
                val invokeUrl = call.argument<String>("invokeUrl") ?: ""
                val secretKey = call.argument<String>("secretKey") ?: ""
                handleVerifyLicense(invokeUrl, secretKey, result)
            }
            "analyzeFrame" -> {
                handleAnalyzeFrame(call, result)
            }
            else -> result.notImplemented()
        }
    }

    /// NCP 라이선스 검증 (SDK 감지 활성화의 전제 조건임)
    private fun handleVerifyLicense(invokeUrl: String, secretKey: String, result: MethodChannel.Result) {
        analysisExecutor.execute {
            try {
                val validateResult = ClovaLicenseChecker.Companion.verify(invokeUrl, secretKey)
                val isVerified = ClovaLicenseChecker.Companion.isVerified()
                android.util.Log.d("EkycNativeHandler", "라이선스 검증 완료: isVerified=$isVerified, meta=${validateResult.meta}, error=${validateResult.apiError}")
                android.os.Handler(android.os.Looper.getMainLooper()).post {
                    result.success(isVerified)
                }
            } catch (e: Exception) {
                android.util.Log.e("EkycNativeHandler", "라이선스 검증 실패", e)
                android.os.Handler(android.os.Looper.getMainLooper()).post {
                    result.error("LICENSE_ERROR", e.message, null)
                }
            }
        }
    }

    private fun handleAnalyzeFrame(call: MethodCall, result: MethodChannel.Result) {
        val bytes = call.argument<ByteArray>("bytes")
        val width = call.argument<Int>("width")
        val height = call.argument<Int>("height")
        val flip = call.argument<Boolean>("flip") ?: false
        val sensorOrientation = call.argument<Int>("sensorOrientation") ?: 90

        if (bytes == null || width == null || height == null) {
            result.success(null)
            return
        }

        // 센서 방향(후면 90 / 전면 270)에 맞춰 회전 보정.
        // 하드코딩 D90 시 전면 얼굴이 어긋나서 센서 방향에 맞춰 회전하도록함
        val rotation = when (sensorOrientation) {
            90   -> ClovaVisionImage.RotationDegrees.D90
            180  -> ClovaVisionImage.RotationDegrees.D180
            270  -> ClovaVisionImage.RotationDegrees.D270
            else -> ClovaVisionImage.RotationDegrees.D0
        }

        // 비동기 처리 중 상태 변경 방지를 위해 현재 값들을 스냅샷 처럼 저장.
        // 비동기 처리는 백그라운드에서 이루어지는데, 메인 스레드에서 해당 상태값들이 작업 수행 도중에 바뀔수있기때문.
        val capturedMode = currentMode
        val capturedIdCard = idCardDetector
        val capturedFace = faceDetector

        result.success(null) // 메인 스레드 즉시 반환. ML 추론을 기다리지 않음

        analysisExecutor.execute {
            // [DEBUG] 이미지 크기 확인 (최초 1회)
            if (consecutiveLogCount == 0L) {
                android.util.Log.d("EkycNativeHandler", "frame size: ${width}x${height}, mode=$capturedMode, sensorOrientation=$sensorOrientation, rotation=$rotation, flip=$flip")
            }
            consecutiveLogCount++

            val visionImage = ClovaVisionImage(
                bytes,
                width,
                height,
                ClovaVisionImage.ImageFormat.NV21,
                rotation,
                flip,
            )
            when (capturedMode) {
                DetectionMode.ID_CARD -> capturedIdCard?.analyze(visionImage)
                DetectionMode.FACE    -> capturedFace?.analyze(visionImage)
                DetectionMode.NONE    -> { /* no-op */ }
            }
        }
    }
}
