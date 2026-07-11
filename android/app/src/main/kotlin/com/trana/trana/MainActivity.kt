package com.trana.trana

import io.flutter.embedding.android.FlutterFragmentActivity
import io.flutter.embedding.engine.FlutterEngine

// local_auth 생체인증이 FragmentActivity 위에서 동작 X
// FlutterFragmentActivity 에서 동작함
class MainActivity : FlutterFragmentActivity() {

    private var ekycHandler: EkycNativeHandler? = null

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        ekycHandler = EkycNativeHandler(this, flutterEngine)
    }
}
