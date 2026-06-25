import 'package:flutter/material.dart';
import 'package:trana/core/theme/app_theme.dart';
import 'package:trana/core/theme/coolicons_icon.dart';
import 'package:trana/features/contract/domain/enums/contract_status.dart';

extension ContractStatusMeta on ContractStatus {
  Color statusColor(BuildContext context) => switch (this) {
    ContractStatus.inProgress ||
    ContractStatus.draft ||
    ContractStatus.ready => vrc(context).iconSecondary!,

    ContractStatus.shared => fxc(context).statusSignSuccess!,
    ContractStatus.revisionRequested => fxc(context).statusModifyRequest!,
    ContractStatus.receiverSigned => fxc(context).statusSignSuccess!,
    ContractStatus.cancelRequested => fxc(context).statusError!,
    ContractStatus.cancelled => fxc(context).statusError!,

    ContractStatus.signed => fxc(context).statusSignRequest!,
    ContractStatus.completed => fxc(context).brandColor!,
  };

  Color bgColor(BuildContext context) => switch (this) {
    ContractStatus.inProgress ||
    ContractStatus.draft ||
    ContractStatus.ready => fxc(context).borderOP!,

    ContractStatus.shared => fxc(context).subtitleBlue!,
    ContractStatus.revisionRequested => fxc(context).subtitleWarning!,
    ContractStatus.receiverSigned => fxc(context).subtitleBlue!,
    ContractStatus.cancelRequested => fxc(context).opacityError!,
    ContractStatus.cancelled => fxc(context).opacityError!,

    ContractStatus.signed => fxc(context).subtitleBlue!,
    ContractStatus.completed => fxc(context).opacitySuccess!,
  };

  String statusLabel(bool isCreator) => switch (this) {
    ContractStatus.inProgress ||
    ContractStatus.draft ||
    ContractStatus.ready => "계약서 초안",

    ContractStatus.shared => isCreator ? "서명 요청됨" : "서명 요청",
    ContractStatus.revisionRequested => isCreator ? "수정 요청" : "수정 요청됨",
    ContractStatus.receiverSigned => isCreator ? "최종 서명 요청" : "최종 서명 요청됨",
    ContractStatus.cancelRequested => "취소 요청",
    ContractStatus.cancelled => "",

    ContractStatus.signed => "서명 완료",
    ContractStatus.completed => "거래 완료",
  };

  IconData statusIcon() => switch (this) {
    ContractStatus.inProgress ||
    ContractStatus.draft ||
    ContractStatus.ready => CooliconsIcon.fileDocument,

    ContractStatus.shared => CooliconsIcon.editPencilLine02,
    ContractStatus.revisionRequested => CooliconsIcon.circleHelp,
    ContractStatus.receiverSigned => CooliconsIcon.editPencilLine02,
    ContractStatus.cancelRequested => CooliconsIcon.warning,
    ContractStatus.cancelled => CooliconsIcon.warning,

    ContractStatus.signed => CooliconsIcon.circleCheck,
    ContractStatus.completed => CooliconsIcon.circleCheck,
  };

  Color bannerIconBgColor(BuildContext context) => switch (this) {
    ContractStatus.inProgress ||
    ContractStatus.draft ||
    ContractStatus.ready => vrc(context).tertiaryColor!,

    ContractStatus.shared => fxc(context).statusSignRequest!,
    ContractStatus.revisionRequested => vrc(context).tertiaryColor!,
    ContractStatus.receiverSigned => fxc(context).statusSignRequest!,
    ContractStatus.cancelRequested => fxc(context).statusError!,
    ContractStatus.cancelled => fxc(context).statusError!,

    ContractStatus.signed => fxc(context).statusSignRequest!,
    ContractStatus.completed => fxc(context).brandColor!,
  };

  Color bannerIconColor(BuildContext context) => switch (this) {
    ContractStatus.inProgress ||
    ContractStatus.draft ||
    ContractStatus.ready ||
    ContractStatus.revisionRequested => vrc(context).iconPrimary!,

    ContractStatus.shared ||
    ContractStatus.receiverSigned ||
    ContractStatus.cancelRequested ||
    ContractStatus.cancelled ||
    ContractStatus.signed ||
    ContractStatus.completed => fxc(context).textBrand!,
  };

  IconData bannerIcon(bool isCreator) => switch (this) {
    ContractStatus.inProgress ||
    ContractStatus.draft ||
    ContractStatus.ready => CooliconsIcon.editPencilLine02,

    ContractStatus.shared => CooliconsIcon.help,
    ContractStatus.revisionRequested => CooliconsIcon.editPencilLine02,
    ContractStatus.receiverSigned => CooliconsIcon.help,
    ContractStatus.cancelRequested => CooliconsIcon.warning,
    ContractStatus.cancelled => CooliconsIcon.warning,

    ContractStatus.signed => CooliconsIcon.check,
    ContractStatus.completed => CooliconsIcon.circleCheck,
  };

  String bannerTopLabel(bool isCreator) => switch (this) {
    ContractStatus.inProgress => "",
    ContractStatus.draft => "",
    ContractStatus.ready => "",

    ContractStatus.shared => "거래 상대방",
    ContractStatus.revisionRequested => isCreator ? "" : "거래 상대방",
    ContractStatus.receiverSigned => "거래 상대방",
    ContractStatus.cancelRequested => "진행 상황",
    ContractStatus.cancelled => "",

    ContractStatus.signed => "거래 상대방",
    ContractStatus.completed => "거래 완료",
  };

  String bannerBottomLabel(bool isCreator) => switch (this) {
    ContractStatus.inProgress ||
    ContractStatus.draft ||
    ContractStatus.ready => "계약서 수정하기",

    ContractStatus.shared => "현재 서명 대기 중..",
    ContractStatus.revisionRequested => isCreator ? "계약서 수정하기" : "수정 진행 중...",
    ContractStatus.receiverSigned => "현재 서명 대기 중..",
    ContractStatus.cancelRequested => "계약 취소 진행 중",
    ContractStatus.cancelled => "",

    ContractStatus.signed => "서명 완료",
    ContractStatus.completed => "무사히 거래가 완료되었어요!",
  };

  bool bannerShowChevron() => switch (this) {
    ContractStatus.inProgress ||
    ContractStatus.draft ||
    ContractStatus.ready => true,

    ContractStatus.shared => false,
    ContractStatus.revisionRequested => true,
    ContractStatus.receiverSigned => false,
    ContractStatus.cancelRequested => true,
    ContractStatus.cancelled => true,

    ContractStatus.signed => false,
    ContractStatus.completed => false,
  };
}
