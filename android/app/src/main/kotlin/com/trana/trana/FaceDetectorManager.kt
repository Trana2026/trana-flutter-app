package com.trana.trana

import ai.clova.eyed.face.ClovaFaceDetectorOption
import ai.clova.eyed.face.data.ClovaFaceOpenableState
import ai.clova.eyed.face.data.ClovaPose
import ai.clova.eyed.face.ncp.ClovaFaceDetector
import ai.clova.eyed.image.ClovaVisionImage
import android.content.Context
import android.os.Handler
import android.os.Looper
import android.util.Log
import io.flutter.plugin.common.EventChannel

private enum class MotionType(val korean: String) {
    HEAD_SHAKE("고개를 좌우로 흔들어주세요"),
    EYE_BLINK("눈을 깜빡여주세요"),
}

/// ClovaFaceDetector 래퍼. 매 프레임 얼굴/Liveness 감지 후 EventSink로 상태 전달.
/// analyze()는 백그라운드 단일 스레드에서 호출됨 (EkycNativeHandler.analysisExecutor)
class FaceDetectorManager(context: Context, private val getSink: () -> EventChannel.EventSink?) {

    private val detector = ClovaFaceDetector(
        ClovaFaceDetectorOption(
            stageTypes = ClovaFaceDetectorOption.StageTypes(
                detector = ClovaFaceDetectorOption.Stage(
                    isEnabled = true,
                    context = context,
                    modelFilePathFromAsset = "clovaeyes/face_detection_video_1.0.0.model",
                ),
                landmarker = ClovaFaceDetectorOption.Stage(
                    isEnabled = true,
                    context = context,
                    modelFilePathFromAsset = "clovaeyes/face_landmark_video_1.0.0.model",
                ),
                aligner = ClovaFaceDetectorOption.Stage(isEnabled = true),
                recognizer = ClovaFaceDetectorOption.Stage(
                    isEnabled = true,
                    context = context,
                    modelFilePathFromAsset = "clovaeyes/face_recognition_video_1.0.0.model",
                ),
            ),
        ),
    )
    private val mainHandler = Handler(Looper.getMainLooper())

    private val motionSequence = listOf(MotionType.EYE_BLINK, MotionType.HEAD_SHAKE)
    private var currentMotionIndex = 0
    private var motionsComplete = false

    // 캡처 품질 게이트 
    // 모션 완료 후 정면+양눈 OPEN이 연속 N프레임일 때만 촬영 신호
    private var captureSignaled = false
    private var goodFrames = 0
    private val GATE_FRAMES_REQUIRED = 6

    // 카메라 초기화 직후 얼굴 미감지 에러
    // 연속 N프레임 이후에만 error 이벤트 전송
    private var consecutiveErrorFrames = 0
    private val ERROR_FRAMES_REQUIRED = 45

    /// 프레임 분석.
    /// detecting(instruction) / livenessComplete / error 상태를 EventSink로 전달.
    /// 백그라운드 스레드에서 호출, EventSink는 mainHandler.post{}로 메인 스레드 보장
    fun analyze(visionImage: ClovaVisionImage) {
        if (captureSignaled) return

        try {
            val result = detector.detectFace(visionImage)
            val faces = result.faces

            if (faces.isNullOrEmpty()) {
                consecutiveErrorFrames++
                goodFrames = 0
                if (consecutiveErrorFrames >= ERROR_FRAMES_REQUIRED) {
                    mainHandler.post { getSink()?.success(mapOf("status" to "error")) }
                }
                return
            }

            consecutiveErrorFrames = 0
            val face = faces.first()

            // 모션 시퀀스 (눈 깜빡이기 후 고개 좌우로 돌리기)
            if (!motionsComplete) {
                val currentMotion = motionSequence[currentMotionIndex]
                val isDone = when (currentMotion) {
                    MotionType.HEAD_SHAKE -> face.motions.headShake
                    MotionType.EYE_BLINK  -> face.motions.eyeBlink
                }
                if (isDone) currentMotionIndex++

                if (currentMotionIndex >= motionSequence.size) {
                    motionsComplete = true
                    mainHandler.post {
                        getSink()?.success(mapOf("status" to "livenessComplete"))
                    }
                } else {
                    val instruction = motionSequence[currentMotionIndex].korean
                    mainHandler.post {
                        getSink()?.success(mapOf("status" to "detecting", "instruction" to instruction))
                    }
                }
                return
            }

            // 캡처 품질 게이트. 정면 + 양눈 OPEN이 연속일 때만 촬영
            val frontal = face.pose == ClovaPose.FRONT
            val eyesOpen = face.leftEye.state == ClovaFaceOpenableState.OPEN &&
                face.rightEye.state == ClovaFaceOpenableState.OPEN

            if (frontal && eyesOpen) {
                goodFrames++
                if (goodFrames >= GATE_FRAMES_REQUIRED) {
                    captureSignaled = true
                    mainHandler.post { getSink()?.success(mapOf("status" to "readyToCapture")) }
                    return
                }
            } else {
                goodFrames = 0
            }

            mainHandler.post {
                getSink()?.success(mapOf("status" to "detecting", "instruction" to "정면을 바라보고 움직이지 마세요"))
            }

        } catch (e: Exception) {
            Log.e("FaceDetectorManager", "analyze error", e)
        }
    }

    fun reset() {
        currentMotionIndex = 0
        motionsComplete = false
        captureSignaled = false
        goodFrames = 0
        consecutiveErrorFrames = 0
    }
}
