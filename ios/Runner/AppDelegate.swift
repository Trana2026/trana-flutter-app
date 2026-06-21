import Flutter
import UIKit
import ClovaEyeD

@main
@objc class AppDelegate: FlutterAppDelegate, FlutterImplicitEngineDelegate {
  private var ekycHandler: EkycNativeHandler?

  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }

  func didInitializeImplicitFlutterEngine(_ engineBridge: FlutterImplicitEngineBridge) {
    GeneratedPluginRegistrant.register(with: engineBridge.pluginRegistry)
    if let registrar = engineBridge.pluginRegistry.registrar(forPlugin: "EkycNativeHandler") {
      ekycHandler = EkycNativeHandler(messenger: registrar.messenger())
    }
  }
}

// MARK: - Flutter - Native eKYC 브릿지

/// MethodChannel 'com.trana/ekyc': 모드 설정 + 프레임 분석
/// EventChannel '/id-card-status', '/face-status': 감지 상태 스트림
final class EkycNativeHandler: NSObject {
  private let methodChannel: FlutterMethodChannel
  private let idCardEventChannel: FlutterEventChannel
  private let faceEventChannel: FlutterEventChannel

  private var idCardSink: FlutterEventSink?
  private var faceSink: FlutterEventSink?

  private var idCardDetector: IdCardDetectorManager?
  private var faceDetector: FaceDetectorManager?

  private enum Mode { case none, idCard, face }
  private var mode: Mode = .none

  // 단일 직렬 큐. SDK 동시 호출 차단
  private let analysisQueue = DispatchQueue(label: "EkycAnalysis")
  private var firstFrameLogged = false

  init(messenger: FlutterBinaryMessenger) {
    methodChannel = FlutterMethodChannel(name: "com.trana/ekyc", binaryMessenger: messenger)
    idCardEventChannel = FlutterEventChannel(name: "com.trana/ekyc/id-card-status", binaryMessenger: messenger)
    faceEventChannel = FlutterEventChannel(name: "com.trana/ekyc/face-status", binaryMessenger: messenger)
    super.init()

    methodChannel.setMethodCallHandler { [weak self] call, result in
      self?.handle(call, result)
    }
    idCardEventChannel.setStreamHandler(EkycStreamHandler(
      onListen: { [weak self] sink in self?.idCardSink = sink },
      onCancel: { [weak self] in self?.idCardSink = nil }))
    faceEventChannel.setStreamHandler(EkycStreamHandler(
      onListen: { [weak self] sink in self?.faceSink = sink },
      onCancel: { [weak self] in self?.faceSink = nil }))
  }

  private func handle(_ call: FlutterMethodCall, _ result: @escaping FlutterResult) {
    switch call.method {
    case "verifyLicense":
      let args = call.arguments as? [String: Any]
      let url = args?["invokeUrl"] as? String ?? ""
      let key = args?["secretKey"] as? String ?? ""
      ClovaLicenseChecker.shared().verify(invokeUrl: url, secretKey: key) { res in
        let ok = (res == .success) && ClovaLicenseChecker.shared().isVerified
        NSLog("EkycNativeHandler 라이선스 검증: res=\(res.rawValue), isVerified=\(ClovaLicenseChecker.shared().isVerified)")
        DispatchQueue.main.async { result(ok) }
      }

    case "startIdCardDetection":
      mode = .idCard
      idCardDetector = IdCardDetectorManager { [weak self] in self?.idCardSink }
      result(nil)

    case "startFaceDetection":
      mode = .face
      if let existing = faceDetector {
        existing.reset()
      } else {
        faceDetector = FaceDetectorManager { [weak self] in self?.faceSink }
      }
      result(nil)

    case "stopDetection":
      mode = .none
      idCardDetector = nil
      faceDetector = nil
      result(nil)

    case "analyzeFrame":
      handleAnalyzeFrame(call, result)

    default:
      result(FlutterMethodNotImplemented)
    }
  }

  private func handleAnalyzeFrame(_ call: FlutterMethodCall, _ result: @escaping FlutterResult) {
    guard let args = call.arguments as? [String: Any],
          let typed = args["bytes"] as? FlutterStandardTypedData,
          let width = args["width"] as? Int,
          let height = args["height"] as? Int else {
      result(nil)
      return
    }
    let bytesPerRow = (args["bytesPerRow"] as? Int) ?? (width * 4)
    let sensorOrientation = (args["sensorOrientation"] as? Int) ?? 90

    // 가변 상태를 캡처 후 백그라운드 안전 접근
    let capturedMode = mode
    let capturedIdCard = idCardDetector
    let capturedFace = faceDetector
    let data = typed.data

    result(nil) // 즉시 반환함. ML 추론 대기하지 않음

    analysisQueue.async { [weak self] in
      guard let self = self else { return }
      let rotation = self.rotationEnum(sensorOrientation)
      if !self.firstFrameLogged {
        NSLog("EkycNativeHandler frame: \(width)x\(height) bpr=\(bytesPerRow) mode=\(capturedMode) sensorOrientation=\(sensorOrientation)")
        self.firstFrameLogged = true
      }
      var mutable = [UInt8](data)
      mutable.withUnsafeMutableBytes { ptr in
        let vision = ClovaVisionImage(
          rawData: ptr.baseAddress,
          width: Int32(width),
          height: Int32(height),
          format: ClovaImageFormat(rawValue: 1)!,   // 1 = BGRA8888
          rotationDegrees: rotation,
          bytesPerRow: Int32(bytesPerRow))
        switch capturedMode {
        case .idCard: capturedIdCard?.analyze(vision)
        case .face:   capturedFace?.analyze(vision)
        case .none:   break
        }
      }
    }
  }

  /// 센서 방향(deg). ClovaRotationDegrees (rawValue: 0=0°,1=90°,2=180°,3=270°)
  private func rotationEnum(_ deg: Int) -> ClovaRotationDegrees {
    switch deg {
    case 90:  return ClovaRotationDegrees(rawValue: 1)!
    case 180: return ClovaRotationDegrees(rawValue: 2)!
    case 270: return ClovaRotationDegrees(rawValue: 3)!
    default:  return ClovaRotationDegrees(rawValue: 0)!
    }
  }
}

// MARK: - EventChannel StreamHandler 헬퍼

final class EkycStreamHandler: NSObject, FlutterStreamHandler {
  private let onListenCallback: (@escaping FlutterEventSink) -> Void
  private let onCancelCallback: () -> Void

  init(onListen: @escaping (@escaping FlutterEventSink) -> Void, onCancel: @escaping () -> Void) {
    onListenCallback = onListen
    onCancelCallback = onCancel
  }

  func onListen(withArguments arguments: Any?, eventSink events: @escaping FlutterEventSink) -> FlutterError? {
    onListenCallback(events)
    return nil
  }

  func onCancel(withArguments arguments: Any?) -> FlutterError? {
    onCancelCallback()
    return nil
  }
}

// MARK: - 신분증 감지

final class IdCardDetectorManager {
  private let getSink: () -> FlutterEventSink?
  private let detector: ClovaIdCardDetector
  private var consecutiveGoodFrames = 0
  private let consecutiveRequired = 3
  private var debugCount = 0

  init(getSink: @escaping () -> FlutterEventSink?) {
    self.getSink = getSink
    detector = ClovaIdCardDetector(option: ClovaFaceDetectorOption())
    let option = ClovaIdCardDetectorOption()
    option.cardRatio = 1.585
    option.targetAngle = 90
    option.angleOffset = 20
    option.minimumSize = 0.1
    option.faceLocation = .none
    option.checkCameraShaky = true
    option.checkImageBlurry = true
    option.checkImageDark = true
    option.checkGlareDeteced = true
    detector.setOption(option)
  }

  func analyze(_ image: ClovaVisionImage) {
    let result = detector.detectIdCard(with: image)
    var payload: [String: Any] = ["status": "detecting"]

    if let rect = result.rectInfo {
      consecutiveGoodFrames += 1
      if consecutiveGoodFrames >= consecutiveRequired {
        consecutiveGoodFrames = 0
        if let jpeg = rect.cardImage.uiImage().jpegData(compressionQuality: 0.9) {
          payload = ["status": "readyToCapture", "croppedImage": FlutterStandardTypedData(bytes: jpeg)]
        } else {
          payload = ["status": "readyToCapture"]
        }
      }
    } else {
      consecutiveGoodFrames = 0
      let e = result.errorInfo
      if e.isShakyCamera {
        payload = ["status": "error", "message": "카메라를 움직이지 마세요"]
      } else if e.isBlurryImage {
        payload = ["status": "error", "message": "흐릿한 이미지"]
      } else if e.isDarkImage {
        payload = ["status": "error", "message": "어두운 환경"]
      } else if e.isGlareDetected {
        payload = ["status": "error", "message": "빛 반사 감지"]
      }
    }

    // [DEBUG] 감지 진단 NSLog (devicectl 콘솔에서 확인)
    debugCount += 1
    if debugCount % 15 == 0 {
      let e = result.errorInfo
      let r = result.rectInfo
      NSLog("EkycIdCard rect=\(r != nil) angle=\(r?.angle ?? -999) imgW=\(image.width()) imgH=\(image.height()) shaky=\(e.isShakyCamera) blur=\(e.isBlurryImage) dark=\(e.isDarkImage) glare=\(e.isGlareDetected)")
    }

    let sink = getSink
    DispatchQueue.main.async { sink()?(payload) }
  }
}

// MARK: - 얼굴/Liveness 감지 + 캡처 게이트

final class FaceDetectorManager {
  private enum MotionType {
    case eyeBlink, headShake
    var korean: String {
      switch self {
      case .eyeBlink:  return "눈을 깜빡여주세요"
      case .headShake: return "고개를 좌우로 흔들어주세요"
      }
    }
  }

  private let getSink: () -> FlutterEventSink?
  private let detector: ClovaFaceDetector
  private let motionSequence: [MotionType] = [.eyeBlink, .headShake]
  private var currentMotionIndex = 0
  private var motionsComplete = false
  private var captureSignaled = false
  private var goodFrames = 0
  private let gateFramesRequired = 6
  private var consecutiveErrorFrames = 0
  private let errorFramesRequired = 45

  init(getSink: @escaping () -> FlutterEventSink?) {
    self.getSink = getSink
    let option = ClovaFaceDetectorOption()
    var stages: [ClovaPipelineStage] = []
    if let p = Bundle.main.path(forResource: "face_detection_video_1.0.0", ofType: "model") {
      stages.append(ClovaPipelineStage(stageType: .detector, filePath: p))
    }
    if let p = Bundle.main.path(forResource: "face_landmark_video_1.0.0", ofType: "model") {
      stages.append(ClovaPipelineStage(stageType: .landmarker, filePath: p))
    }
    stages.append(ClovaPipelineStage(stageType: .aligner, filePath: nil))
    if let p = Bundle.main.path(forResource: "face_recognition_video_1.0.0", ofType: "model") {
      stages.append(ClovaPipelineStage(stageType: .recognizer, filePath: p))
    }
    option.stages = stages
    detector = ClovaFaceDetector(option: option)
  }

  func analyze(_ image: ClovaVisionImage) {
    if captureSignaled { return }
    let result = detector.detectFace(image)
    let faces = result.faces

    if faces.isEmpty {
      consecutiveErrorFrames += 1
      goodFrames = 0
      if consecutiveErrorFrames >= errorFramesRequired {
        emit(["status": "error"])
      }
      return
    }
    consecutiveErrorFrames = 0
    let face = faces[0]

    // 모션 시퀀스 (눈 깜빡이기 후 고개 좌우돌리기)
    if !motionsComplete {
      let motion = motionSequence[currentMotionIndex]
      let done = (motion == .headShake) ? face.motions.headShake : face.motions.eyeBlink
      if done { currentMotionIndex += 1 }

      if currentMotionIndex >= motionSequence.count {
        motionsComplete = true
        emit(["status": "livenessComplete"])
      } else {
        emit(["status": "detecting", "instruction": motionSequence[currentMotionIndex].korean])
      }
      return
    }

    // 캡처 품질 게이트.
    // 정면 + 양눈 OPEN 연속 프레임 검사
    let frontal = (face.pose == .front)
    let eyesOpen = (face.leftEye.state == .open) && (face.rightEye.state == .open)
    if frontal && eyesOpen {
      goodFrames += 1
      if goodFrames >= gateFramesRequired {
        captureSignaled = true
        emit(["status": "readyToCapture"])
        return
      }
    } else {
      goodFrames = 0
    }
    emit(["status": "detecting", "instruction": "정면을 바라보고 움직이지 마세요"])
  }

  func reset() {
    currentMotionIndex = 0
    motionsComplete = false
    captureSignaled = false
    goodFrames = 0
    consecutiveErrorFrames = 0
  }

  private func emit(_ payload: [String: Any]) {
    let sink = getSink
    DispatchQueue.main.async { sink()?(payload) }
  }
}
