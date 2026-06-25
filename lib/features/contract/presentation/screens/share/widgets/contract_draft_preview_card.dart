import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trana/core/theme/app_text_style.dart';
import 'package:trana/core/theme/app_theme.dart';
import 'package:trana/features/contract/presentation/viewmodels/detail_contract_view_model.dart';

class ContractDraftPreviewCard extends HookConsumerWidget {
  const ContractDraftPreviewCard({super.key, required this.publicCode});

  final String publicCode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final shareState = ref.watch(shareContractViewModelProvider);
    final detailState = ref.watch(detailContractViewModelProvider);
    final detailVM = ref.read(detailContractViewModelProvider.notifier);

    final contents = detailState.contents;

    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        detailVM.loadDetail(publicCode);
      });
      return null;
    }, []);

    return Container(
      width: double.infinity,
      height: 180,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: fxc(context).subtitleBlue,
        borderRadius: BorderRadius.circular(18),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                SvgPicture.asset(
                  'assets/icons/file.svg',
                  fit: BoxFit.contain,
                  colorFilter: ColorFilter.mode(
                    fxc(context).textInfo!,
                    BlendMode.srcIn,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  '자동 생성된 계약서',
                  style: context.txt(
                    color: fxc(context).textInfo,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            ...contents.indexed.map((
              (int, ({String title, String body})) entry,
            ) {
              final (i, c) = entry;

              return Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Align(
                  alignment: AlignmentGeometry.centerLeft,
                  child: Text(
                    '${c.title}\n${c.body}',
                    style: context.txt(
                      color: fxc(context).textInfo,
                      fontSize: 12,
                    ),
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
