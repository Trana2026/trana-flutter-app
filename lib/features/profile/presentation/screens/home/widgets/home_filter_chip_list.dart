import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trana/core/theme/app_text_style.dart';
import 'package:trana/core/theme/app_theme.dart';
import 'package:trana/features/contract/domain/enums/contract_status.dart';
import 'package:trana/features/profile/presentation/viewmodels/home_contract_view_model.dart';

class HomeFilterChipList extends ConsumerWidget {
  const HomeFilterChipList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedStatus = ref.watch(
      homeContractViewModelProvider.select((s) => s.selectedStatus),
    );

    return SizedBox(
      height: 28,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        itemCount: _representatives.length,
        separatorBuilder: (_, _) => const SizedBox(width: 8),
        itemBuilder: (context, index) {
          final status = _representatives[index];
          final label = _labelFor(status);
          final isSelected = status == null
              ? selectedStatus == null
              : selectedStatus == status;
          return GestureDetector(
            onTap: () {
              final homeVM = ref.read(homeContractViewModelProvider.notifier);
              homeVM.applyStatus(status);
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: isSelected
                    ? vrc(context).textPrimary
                    : vrc(context).secondaryColor,
                borderRadius: BorderRadius.circular(isSelected ? 10 : 8),
              ),
              child: Text(
                label,
                style: context.txt(
                  color: isSelected
                      ? vrc(context).secondaryColor
                      : vrc(context).textDisable,
                  fontSize: 12,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  /// 필터에 보일 상태 목록
  static const _representatives = <ContractStatus?>[
    null, // 전체
    ContractStatus.ready, // 계약서 초안 (inProgress, draft, ready)
    ContractStatus.shared, // 서명 요청
    ContractStatus.revisionRequested, // 수정 요청
    ContractStatus.receiverSigned, // 최종 서명 요청
    ContractStatus.signed, // 서명 완료
    ContractStatus.reported, // 신고 접수
    ContractStatus.cancelRequested, // 취소 요청
    ContractStatus.completed, // 거래 완료
  ];

  /// 필터에 보일 상태 상태별 라벨
  String _labelFor(ContractStatus? status) => switch (status) {
    null => '전체',
    ContractStatus.inProgress ||
    ContractStatus.draft ||
    ContractStatus.ready => '계약서 초안',
    ContractStatus.shared => '서명 요청',
    ContractStatus.revisionRequested => '수정 요청',
    ContractStatus.receiverSigned => '최종 서명 요청',
    ContractStatus.signed => '서명 완료',
    ContractStatus.reported => '신고 접수',
    ContractStatus.cancelRequested => '취소 요청',
    ContractStatus.completed => '거래 완료',
    ContractStatus.cancelled || ContractStatus.expired => '',
  };
}
