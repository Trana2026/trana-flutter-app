import 'package:flutter/material.dart';
import 'package:trana/core/widgets/custom_loading_bar.dart';

/// [isPending] == true 일 때 [child] 위에 뜨는 로딩 오버레이.
/// 딤 처리 + 로딩 인디케이터 + 터치 차단
/// 비동기 작업(버튼 탭 등) 진행 중 중복 호출 방지 및 UX 개선 위해 사용
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
          const Positioned.fill(
            child: ModalBarrier(dismissible: false, color: Colors.black26),
          ),
          const Positioned.fill(child: CustomLoadingBar()),
        ],
      ],
    );
  }
}
