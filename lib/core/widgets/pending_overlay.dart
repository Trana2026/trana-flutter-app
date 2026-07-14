import 'package:flutter/material.dart';
import 'package:trana/core/widgets/custom_loading_bar.dart';

/// [isPending]이 true일 때 [child] 위에 살짝 딤 처리된 오버레이 + 로딩 인디케이터를 띄우고
/// 터치를 차단한다. 비동기 작업(버튼 탭 등) 진행 중 화면 전체를 잠글 때 사용.
class PendingOverlay extends StatelessWidget {
  const PendingOverlay({
    super.key,
    required this.isPending,
    required this.child,
  });

  final bool isPending;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        if (isPending) ...[
          const ModalBarrier(dismissible: false, color: Colors.black26),
          const CustomLoadingBar(),
        ],
      ],
    );
  }
}
