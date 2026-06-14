import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trana/core/router/app_router.dart';
import 'package:trana/core/theme/app_theme.dart';
import 'package:trana/core/widgets/primary_button.dart';
import 'package:trana/features/contract/presentation/widgets/modals/modification_request_bottom_sheet.dart';

class ModificationRequestPage extends HookConsumerWidget {
  const ModificationRequestPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: vrc(context).background,
      appBar: AppBar(
        backgroundColor: vrc(context).background,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "전문 보기",
          style: TextStyle(
            color: vrc(context).textPrimary,
            fontSize: 17,
            fontWeight: FontWeight.w700,
            height: 1.5,
            letterSpacing: -0.17,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 40),
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: fxc(context).borderOP!),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(children: [Text("물품 매매 계약서")]),
              ),
            ),
            const SizedBox(height: 40),

            PrimaryButton(
              text: "선택한 n개의 영역 수정 요청하기",
              onTap: () async {
                bool signFlowProceeded = false;
                final router = GoRouter.of(context);
                await showModalBottomSheet<void>(
                  context: context,
                  barrierColor: const Color(0xFF000000).withValues(alpha: 0.75),
                  backgroundColor: Colors.transparent,
                  isScrollControlled: true,
                  builder: (_) => ModificationRequestBottomSheet(
                    parentContext: context,
                    onProceed: () => signFlowProceeded = true,
                  ),
                );
                if (!signFlowProceeded && context.mounted) {
                  router.go(AppRoutes.home);
                }
              },
              backgroundColor: fxc(context).brandColor!,
              foregroundColor: fxc(context).textBrand!,
            ),
          ],
        ),
      ),
    );
  }
}
