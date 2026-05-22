import 'package:flutter/material.dart';
import 'package:trana/core/theme/app_theme.dart';
import 'package:trana/features/contract/domain/enums/contract_status.dart';

extension ContractStatusMeta on ContractStatus {
  Color appBarColor(BuildContext context) => switch (this) {
    ContractStatus.draft => fxc(context).statusDraft!,
    ContractStatus.signRequested => fxc(context).statusSignRequest!,
    ContractStatus.signed => fxc(context).statusSignSuccess!,
    ContractStatus.completed => fxc(context).brandColor!,
    ContractStatus.reported => fxc(context).statusError!,
  };

  String statusLabel() => switch (this) {
    ContractStatus.draft => "계약서 초안",
    ContractStatus.signRequested => "서명 요청됨",
    ContractStatus.signed => "서명 완료",
    ContractStatus.completed => "거래 완료",
    ContractStatus.reported => "신고 접수",
  };

  IconData statusIcon() => switch (this) {
    ContractStatus.draft => Icons.warning_amber_rounded,
    ContractStatus.signRequested => Icons.edit_outlined,
    ContractStatus.signed => Icons.check_circle_outline,
    ContractStatus.completed => Icons.check_circle_outline,
    ContractStatus.reported => Icons.warning_amber_rounded,
  };

  Color bannerIconBgColor(BuildContext context) => switch (this) {
    ContractStatus.draft => vrc(context).tertiaryColor!,
    ContractStatus.signRequested => fxc(context).statusSignRequest!,
    ContractStatus.signed => fxc(context).statusSignRequest!,
    ContractStatus.completed => fxc(context).brandColor!,
    ContractStatus.reported => fxc(context).statusError!,
  };

  IconData bannerIcon() => switch (this) {
    ContractStatus.draft => Icons.edit_outlined,
    ContractStatus.signRequested => Icons.question_mark,
    ContractStatus.signed => Icons.question_mark,
    ContractStatus.completed => Icons.check,
    ContractStatus.reported => Icons.warning_amber_rounded,
  };

  String bannerTopLabel() => switch (this) {
    ContractStatus.draft => "진행 상황",
    ContractStatus.signRequested => "거래 상대방",
    ContractStatus.signed => "거래 상대방",
    ContractStatus.completed => "거래 완료!",
    ContractStatus.reported => "진행 상황",
  };

  String bannerBottomLabel() => switch (this) {
    ContractStatus.draft => "계약서 수정하기",
    ContractStatus.signRequested => "현재 서명 대기 중...",
    ContractStatus.signed => "서명 완료!",
    ContractStatus.completed => "무사히 거래가 완료되었어요!",
    ContractStatus.reported => "신고 접수 중",
  };

  bool bannerShowChevron() => switch (this) {
    ContractStatus.draft => true,
    ContractStatus.signRequested => true,
    ContractStatus.signed => true,
    ContractStatus.completed => false,
    ContractStatus.reported => true,
  };
}
