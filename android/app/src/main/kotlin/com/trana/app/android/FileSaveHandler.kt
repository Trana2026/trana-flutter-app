package com.trana.app.android

import android.app.Activity
import android.content.Intent
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel

/// Flutter - Native 문서 저장 브릿지
/// MethodChannel 'com.trana/file_save': SAF(ACTION_CREATE_DOCUMENT) 로 저장 위치 선택 후 파일 쓰기
/// 저장소 권한을 요구하지 않아 Play 사진/동영상 권한 정책과 무관
class FileSaveHandler(private val activity: Activity, flutterEngine: FlutterEngine) :
    MethodChannel.MethodCallHandler {

    companion object {
        const val REQUEST_CODE = 0xF11E
    }

    private val channel = MethodChannel(
        flutterEngine.dartExecutor.binaryMessenger,
        "com.trana/file_save",
    )

    private var pendingResult: MethodChannel.Result? = null
    private var pendingBytes: ByteArray? = null

    init {
        channel.setMethodCallHandler(this)
    }

    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        if (call.method != "saveDocument") {
            result.notImplemented()
            return
        }

        // 저장 화면이 이미 열려 있는 경우 (중복 탭)
        if (pendingResult != null) {
            result.error("in_progress", "저장 화면이 이미 열려 있음", null)
            return
        }

        val bytes = call.argument<ByteArray>("bytes")
        val fileName = call.argument<String>("fileName")
        val mimeType = call.argument<String>("mimeType") ?: "application/octet-stream"

        if (bytes == null || fileName.isNullOrEmpty()) {
            result.error("invalid_args", "bytes, fileName 인자 필요", null)
            return
        }

        val intent = Intent(Intent.ACTION_CREATE_DOCUMENT).apply {
            addCategory(Intent.CATEGORY_OPENABLE)
            type = mimeType
            putExtra(Intent.EXTRA_TITLE, fileName)
        }

        pendingResult = result
        pendingBytes = bytes

        try {
            activity.startActivityForResult(intent, REQUEST_CODE)
        } catch (e: Exception) {
            clearPending()
            result.error("unavailable", "저장 화면을 열 수 없음: ${e.message}", null)
        }
    }

    /// SAF 결과 처리 (처리한 요청이면 true, 사용자가 취소하면 Dart 로 false 반환)
    fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?): Boolean {
        if (requestCode != REQUEST_CODE) return false

        val result = pendingResult
        val bytes = pendingBytes
        clearPending()

        if (result == null) return true

        val uri = data?.data
        if (resultCode != Activity.RESULT_OK || uri == null || bytes == null) {
            result.success(false)
            return true
        }

        // 클라우드 제공자(드라이브 등) 대응으로 쓰기는 백그라운드에서 수행
        Thread {
            try {
                activity.contentResolver.openOutputStream(uri).use { stream ->
                    checkNotNull(stream) { "openOutputStream 실패" }
                    stream.write(bytes)
                    stream.flush()
                }
                activity.runOnUiThread { result.success(true) }
            } catch (e: Exception) {
                activity.runOnUiThread { result.error("write_failed", e.message, null) }
            }
        }.start()

        return true
    }

    private fun clearPending() {
        pendingResult = null
        pendingBytes = null
    }
}
