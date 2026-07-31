import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trana/core/theme/app_theme.dart';
import 'package:trana/core/widgets/custom_toast.dart';
import 'package:trana/features/profile/presentation/viewmodels/my_page_view_model.dart';

class TrailingPushToggle extends HookConsumerWidget {
  const TrailingPushToggle({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pushEnabled = ref.watch(
      myPageViewModelProvider.select((s) => s.pushEnabled),
    );

    return SizedBox(
      height: 18,
      child: Transform.scale(
        scale: 0.7,
        alignment: Alignment.centerRight,
        child: CupertinoSwitch(
          value: pushEnabled,
          onChanged: (v) async {
            // 푸시 알림 토글
            final mypageVM = ref.read(myPageViewModelProvider.notifier);
            final success = await mypageVM.togglePushEnagled(v);
            if (!context.mounted) return;
            if (!success) {
              final state = ref.read(myPageViewModelProvider);
              showErrorToast(context, state.error!);
              mypageVM.clearError();
              return;
            }
          },
          activeTrackColor: fxc(context).brandColor,
          inactiveTrackColor: vrc(context).disableColor,
        ),
      ),
    );
  }
}
