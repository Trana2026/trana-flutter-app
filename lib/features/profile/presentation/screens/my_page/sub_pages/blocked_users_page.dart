import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trana/core/theme/app_text_style.dart';
import 'package:trana/core/theme/app_theme.dart';
import 'package:trana/core/theme/coolicons_icon.dart';
import 'package:trana/core/utils/date_time_extensions.dart';
import 'package:trana/core/widgets/app_icon.dart';
import 'package:trana/core/widgets/custom_app_bar.dart';
import 'package:trana/core/widgets/custom_toast.dart';
import 'package:trana/features/profile/domain/entities/blocked_user_entity.dart';
import 'package:trana/features/profile/presentation/viewmodels/block_view_model.dart';

class BlockedUsersPage extends HookConsumerWidget {
  const BlockedUsersPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final blocks = ref.watch(blockViewModelProvider.select((s) => s.blocks));

    return Scaffold(
      backgroundColor: vrc(context).background,
      appBar: CustomAppBar.leading(
        title: "차단 관리",
        onTapLeading: () => context.pop(),
      ),
      body: blocks.isEmpty
          ? Center(
              child: Text(
                "차단한 사용자가 없어요",
                style: context.txt(color: vrc(context).textPrimary),
              ),
            )
          : ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: blocks.length,
              itemBuilder: (_, i) => _BlockedUserListItem(block: blocks[i]),
            ),
    );
  }
}

class _BlockedUserListItem extends HookConsumerWidget {
  const _BlockedUserListItem({required this.block});

  final BlockedUserEntity block;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isPending = useRef(false);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: vrc(context).borderPrimary!)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 24,
            width: 24,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: vrc(context).secondaryColor,
            ),
            child: AppIcon.data(icon: CooliconsIcon.user01, size: 16),
          ),
          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  block.shareCode,
                  style: context.txt(
                    color: vrc(context).textPrimary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  "${block.blockedAt.toDotFormat} · ${block.blockedAt.toTimeFormat}",
                  style: context.txt(
                    color: vrc(context).textTertiary,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),

          GestureDetector(
            onTap: () async {
              if (isPending.value) return;
              isPending.value = true;
              try {
                // 차단 해제
                final blockVM = ref.read(blockViewModelProvider.notifier);
                final success = await blockVM.unblock(block.shareCode);
                if (!context.mounted) return;
                if (!success) {
                  final state = ref.read(blockViewModelProvider);
                  showErrorToast(context, state.error!);
                  blockVM.clearError();
                }
              } finally {
                isPending.value = false;
              }
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: fxc(context).opacityError,
              ),
              child: Text(
                "차단 해제하기",
                style: context.txt(
                  color: fxc(context).textDanger,
                  fontSize: 12,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
