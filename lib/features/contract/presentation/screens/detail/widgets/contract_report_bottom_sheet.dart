import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trana/core/theme/app_theme.dart';
import 'package:trana/core/widgets/contract_form_field.dart';
import 'package:trana/core/widgets/primary_button.dart';
import 'package:trana/features/contract/domain/entities/contract_status.dart';
import 'package:trana/features/contract/presentation/viewmodels/contract_list_view_model.dart';

class ContractReportBottomSheet extends HookConsumerWidget {
  final String? contractId;

  const ContractReportBottomSheet({super.key, this.contractId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final reasonController = useTextEditingController();
    final detailController = useTextEditingController();

    return Container(
      padding: const EdgeInsets.fromLTRB(20, 15, 20, 30),
      decoration: BoxDecoration(
        color: vrc(context).background,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 110,
              height: 4,
              decoration: BoxDecoration(
                color: vrc(context).disableColor,
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 2),
                child: Icon(
                  Icons.warning_amber_rounded,
                  color: fxc(context).iconDanger,
                  size: 24,
                ),
              ),
              const SizedBox(width: 5),
              Text(
                "문제 신고",
                style: TextStyle(
                  color: vrc(context).textPrimary,
                  fontSize: 18,
                  fontFamily: "PretendardBold"
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          ContractFormField(
            label: "신고 사유",
            hintText: "신고 사유를 입력해주세요.",
            controller: reasonController,
          ),
          const SizedBox(height: 16),

          ContractFormField(
            label: "상세 내용",
            hintText: "문제를 자세히 설명해 주세요.",
            controller: detailController,
            maxLines: 7,
          ),
          const SizedBox(height: 20),

          PrimaryButton(
            text: "다음",
            onTap: () {
              if (contractId != null) {
                ref.read(contractListProvider.notifier).updateStatus(
                  contractId!,
                  ContractStatus.reported,
                );
              }
              Navigator.pop(context);
            },
            backgroundColor: fxc(context).subtitleError!,
            foregroundColor: fxc(context).textDanger!,
          ),
        ],
      ),
    );
  }
}
