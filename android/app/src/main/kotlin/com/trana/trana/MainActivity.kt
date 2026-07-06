package com.trana.trana

import io.flutter.embedding.android.FlutterFragmentActivity
import io.flutter.embedding.engine.FlutterEngine

// local_auth의 BiometricPrompt는 FragmentActivity 위에서만 동작
class MainActivity : FlutterFragmentActivity() {

    private var ekycHandler: EkycNativeHandler? = null

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        ekycHandler = EkycNativeHandler(this, flutterEngine)
    }
}
