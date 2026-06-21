package com.trana.trana

import ai.clova.eyed.card.ClovaIdCardDetectorOption
import ai.clova.eyed.card.ncp.ClovaIdCardDetector
import ai.clova.eyed.face.ClovaFaceDetectorOption
import ai.clova.eyed.image.ClovaVisionImage
import android.graphics.Bitmap
import android.os.Handler
import android.os.Looper
import android.util.Log
import io.flutter.plugin.common.EventChannel
import java.io.ByteArrayOutputStream

/// ClovaIdCardDetector 래퍼.
/// 매 프레임 신분증 감지 후 EventSink로 상태 전달
/// analyze()는 백그라운드 단일 스레드에서 호출됨 (EkycNativeHandler.analysisExecutor)
class IdCardDetectorManager(private val getSink: () -> EventChannel.EventSink?) {

    private val detector = ClovaIdCardDetector(ClovaFaceDetectorOption())
    private val mainHandler = Handler(Looper.getMainLooper())
    private var consecutiveGoodFrames = 0
    private val CONSECUTIVE_REQUIRED = 3  // 연속 N프레임 인식 성공 시 자동촬영 트리거

    init {
        // faceLocation=NONE: 얼굴 감지 비활성화 (얼굴 미감지 시 rectInfo null 가능성 차단)
        // minimumSize=0.1f, angleOffset=90: 크기·각도 필터 최대 완화 (진단용)
        val option = ClovaIdCardDetectorOption(
            cardRatio = 1.585f,
            targetAngle = 90,
            angleOffset = 90,
            minimumSize = 0.1f,
            faceLocation = ClovaIdCardDetectorOption.IdFaceLocation.NONE,
        )
        detector.setOption(option)
    }

    /// 프레임 분석.
    /// readyToCapture / detecting / error 상태를 EventSink로 전달.
    /// shotIdCard 대신 consecutiveGoodFrames 카운터로 자동촬영 판단.
    /// 백그라운드 스레드에서 호출, EventSink는 mainHandler.post{}로 메인 스레드 보장.
    fun analyze(visionImage: ClovaVisionImage) {
        try {
            val result = detector.detectIdCard(visionImage)

            // [DEBUG] 매 10프레임마다 로그 출력. 자동촬영 미작동 확인 용도
            if (consecutiveGoodFrames == 0 || consecutiveGoodFrames % 10 == 0) {
                Log.d("IdCardDetector", "rectInfo=${result.rectInfo != null}, " +
                    "errorInfo=${result.errorInfo}, " +
                    "shaky=${result.errorInfo?.isShakyCamera}, " +
                    "blurry=${result.errorInfo?.isBlurryImage}, " +
                    "dark=${result.errorInfo?.isDarkImage}, " +
                    "glare=${result.errorInfo?.isGlareDetected}, " +
                    "consecutiveFrames=$consecutiveGoodFrames")
            }

            val payload: Map<String, Any?> = if (result.rectInfo != null) {
                // 카드 인식 성공 시 연속 카운터 증가
                consecutiveGoodFrames++
                Log.d("IdCardDetector", "카드 인식됨, angle=${result.rectInfo!!.angle}, consecutiveFrames=$consecutiveGoodFrames")

                if (consecutiveGoodFrames >= CONSECUTIVE_REQUIRED) {
                    // N프레임 연속 인식시 자동촬영 트리거 실행
                    consecutiveGoodFrames = 0
                    val cardImage = result.rectInfo!!.cardImage
                    Log.d("IdCardDetector", "readyToCapture 전송, cardImage=${cardImage != null}")
                    val croppedBytes = cardImage?.let { convertToJpeg(it) }
                    mapOf("status" to "readyToCapture", "croppedImage" to croppedBytes)
                } else {
                    mapOf("status" to "detecting")
                }
            } else {
                // 카드 미인식이면 카운터 리셋
                if (consecutiveGoodFrames > 0) {
                    Log.d("IdCardDetector", "카드 미인식으로 카운터 리셋 ($consecutiveGoodFrames = 0)")
                }
                consecutiveGoodFrames = 0

                val errorInfo = result.errorInfo
                val message = when {
                    errorInfo == null            -> null
                    errorInfo.isShakyCamera      -> "카메라를 움직이지 마세요"
                    errorInfo.isBlurryImage      -> "흐릿한 이미지"
                    errorInfo.isDarkImage        -> "어두운 환경"
                    errorInfo.isGlareDetected    -> "빛 반사 감지"
                    else                         -> null
                }
                if (message != null) mapOf("status" to "error", "message" to message)
                else mapOf("status" to "detecting")
            }

            // EventSink는 메인 스레드에서만 호출 가능
            mainHandler.post { getSink()?.success(payload) }

        } catch (e: Exception) {
            Log.e("IdCardDetectorManager", "analyze error", e)
        }
    }

    /// ClovaVisionImage 내부 이미지를 Bitmap으로 추출한 뒤 JPEG ByteArray 변환
    /// SDK가 제공하는 getBitmap() 사용. 실패 시 null 반환 - Flutter takePicture 폴백
    private fun convertToJpeg(image: ClovaVisionImage): ByteArray? {
        return try {
            val bitmap = image.getBitmap()
            val stream = ByteArrayOutputStream()
            bitmap.compress(Bitmap.CompressFormat.JPEG, 90, stream)
            stream.toByteArray()
        } catch (e: Exception) {
            Log.w("IdCardDetectorManager", "크롭 이미지 변환 실패. takePicture 폴백 사용: ${e.message}")
            null
        }
    }
}
