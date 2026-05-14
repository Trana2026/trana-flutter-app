import 'package:flutter/material.dart';
import 'package:trana/core/theme/app_theme.dart';
import 'package:trana/features/contract/domain/entities/contract_status.dart';

extension ContractStatusMeta on ContractStatus {
  Color appBarColor(BuildContext context) => switch (this) {
        ContractStatus.draft => fxc(context).statusDraft!,
        ContractStatus.signRequest => fxc(context).statusSignRequest!,
        ContractStatus.signComplete => fxc(context).statusSignSuccess!,
        ContractStatus.tradeDone => fxc(context).brandColor!,
        ContractStatus.reported => fxc(context).statusError!,
      };

  String statusLabel() => switch (this) {
        ContractStatus.draft => "계약서 초안",
        ContractStatus.signRequest => "서명 요청됨",
        ContractStatus.signComplete => "서명 완료",
        ContractStatus.tradeDone => "거래 완료",
        ContractStatus.reported => "신고 접수",
      };

  IconData statusIcon() => switch (this) {
        ContractStatus.draft => Icons.warning_amber_rounded,
        ContractStatus.signRequest => Icons.edit_outlined,
        ContractStatus.signComplete => Icons.check_circle_outline,
        ContractStatus.tradeDone => Icons.check_circle_outline,
        ContractStatus.reported => Icons.warning_amber_rounded,
      };

  Color bannerIconBgColor(BuildContext context) => switch (this) {
        ContractStatus.draft => vrc(context).tertiaryColor!,
        ContractStatus.signRequest => fxc(context).statusSignRequest!,
        ContractStatus.signComplete => fxc(context).statusSignRequest!,
        ContractStatus.tradeDone => fxc(context).brandColor!,
        ContractStatus.reported => fxc(context).statusError!,
      };

  IconData bannerIcon() => switch (this) {
        ContractStatus.draft => Icons.edit_outlined,
        ContractStatus.signRequest => Icons.question_mark,
        ContractStatus.signComplete => Icons.question_mark,
        ContractStatus.tradeDone => Icons.check,
        ContractStatus.reported => Icons.warning_amber_rounded,
      };

  String bannerTopLabel() => switch (this) {
        ContractStatus.draft => "진행 상황",
        ContractStatus.signRequest => "거래 상대방",
        ContractStatus.signComplete => "거래 상대방",
        ContractStatus.tradeDone => "거래 완료!",
        ContractStatus.reported => "진행 상황",
      };

  String bannerBottomLabel() => switch (this) {
        ContractStatus.draft => "계약서 수정하기",
        ContractStatus.signRequest => "현재 서명 대기 중...",
        ContractStatus.signComplete => "서명 완료!",
        ContractStatus.tradeDone => "무사히 거래가 완료되었어요!",
        ContractStatus.reported => "신고 접수 중",
      };

  bool bannerShowChevron() => switch (this) {
        ContractStatus.draft => true,
        ContractStatus.signRequest => true,
        ContractStatus.signComplete => true,
        ContractStatus.tradeDone => false,
        ContractStatus.reported => true,
      };
}
