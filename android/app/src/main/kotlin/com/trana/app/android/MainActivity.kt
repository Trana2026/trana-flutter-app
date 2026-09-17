package com.trana.app.android

import android.content.Intent
import io.flutter.embedding.android.FlutterFragmentActivity
import io.flutter.embedding.engine.FlutterEngine

// local_auth 생체인증이 FragmentActivity 위에서 동작 X
// FlutterFragmentActivity 에서 동작함
class MainActivity : FlutterFragmentActivity() {

    private var ekycHandler: EkycNativeHandler? = null
    private var fileSaveHandler: FileSaveHandler? = null

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        ekycHandler = EkycNativeHandler(this, flutterEngine)
        fileSaveHandler = FileSaveHandler(this, flutterEngine)
    }

    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        // SAF 저장 결과는 플러그인으로 전달하지 않고 자체 처리
        if (fileSaveHandler?.onActivityResult(requestCode, resultCode, data) == true) return
        super.onActivityResult(requestCode, resultCode, data)
    }
}
