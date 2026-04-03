import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart'; 
import 'package:hooks_riverpod/hooks_riverpod.dart'; 
import 'package:trana/core/theme/app_theme.dart';

class FaceVerifyPage extends HookConsumerWidget { 
  const FaceVerifyPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = useState<CameraController?>(null);
    final isInitialized = useState(false);

    useEffect(() {
      Future<void> initCamera() async {
        try {
          final cameras = await availableCameras();
          final front = cameras.firstWhere(
            (c) => c.lensDirection == CameraLensDirection.front,
          );
          
          final cameraController = CameraController(front, ResolutionPreset.high);
          await cameraController.initialize();
          
          controller.value = cameraController;
          isInitialized.value = true;
        } catch (e) {
          debugPrint('카메라 초기화 실패: $e');
        }
      }

      initCamera();

      return () {
        controller.value?.dispose();
      };
    }, const []); 
    const int currentStep = 3;
    const int totalStep = 5;
    final double progress = currentStep / totalStep;
    final double screenWidth = MediaQuery.of(context).size.width;
    final double barWidth = screenWidth * progress;

    return Scaffold(
      backgroundColor: vrc(context).background,
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "본인 인증",
          style: TextStyle(
            color: vrc(context).textPrimary,
            fontSize: 17,
            fontFamily: "PretendardBold"
          ),
        ),
        backgroundColor: vrc(context).background,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(0),
          child: Align(
            alignment: Alignment.centerLeft,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              height: 4,
              width: barWidth,
              color: fxc(context).brandColor,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 1.5),
              child: Text(
                "실물 인증",
                style: TextStyle(
                  color: vrc(context).textPrimary,
                  fontSize: 20,
                  fontFamily: "PretendardBold"
                ),
              ),
            ),
            const SizedBox(height: 5),
            Padding(
              padding: const EdgeInsets.only(left: 1.5),
              child: Text(
                "본인 여부를 확인합니다, 화면을 응시해주세요",
                style: TextStyle(
                  color: vrc(context).textSecondary,
                  fontSize: 15,
                  fontFamily: "PretendardMedium"
                ),
              ),
            ),
            const SizedBox(height: 80),
            Align(
              alignment: const Alignment(0, -0.1),
              child: Column(
                children: [
                  Container(
                    width: 350,
                    height: 350,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: fxc(context).brandColor!,
                        width: 4,
                      ),
                    ),
                    child: ClipOval(
                      child: isInitialized.value && controller.value != null
                          ? FittedBox(
                              fit: BoxFit.cover,
                              child: SizedBox(
                                width: controller.value!.value.previewSize!.height,
                                height: controller.value!.value.previewSize!.width,
                                child: CameraPreview(controller.value!),
                              ),
                            )
                          : const Center(
                              child: CircularProgressIndicator(),
                            ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 7),
                    decoration: BoxDecoration(
                      color: vrc(context).secondaryColor,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Text(
                      "정면을 응시해주세요",
                      style: TextStyle(
                        color: vrc(context).textSecondary,
                        fontSize: 17,
                        fontFamily: "PretendardSemiBold"
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}