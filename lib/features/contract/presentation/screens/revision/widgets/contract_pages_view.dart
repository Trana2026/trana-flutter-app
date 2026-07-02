import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trana/core/theme/app_text_style.dart';
import 'package:trana/core/theme/app_theme.dart';
import 'package:trana/core/theme/coolicons_icon.dart';
import 'package:trana/features/contract/presentation/viewmodels/detail_contract_view_model.dart';
import 'package:trana/features/contract/presentation/viewmodels/revision_request_view_model.dart';

class ContractPagesView extends HookConsumerWidget {
  const ContractPagesView({super.key, required this.onSelectedCountChanged});

  final void Function(int count) onSelectedCountChanged;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detailState = ref.watch(detailContractViewModelProvider);
    final revisionVM = ref.read(revisionRequestViewModelProvider.notifier);

    final contents = detailState.contents;
    final selectedFields = useState<Set<String>>({});

    void onToggle(String field, bool selected) {
      final updated = {...selectedFields.value};
      if (selected) {
        updated.add(field);
      } else {
        updated.remove(field);
      }
      selectedFields.value = updated;
      revisionVM.updateSelectedFields(updated);
      onSelectedCountChanged(updated.length);
    }

    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(20, 28, 20, 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            '물품 거래 계약서',
            textAlign: TextAlign.center,
            style: context.txt(
              color: vrc(context).textPrimary,
              fontSize: 15,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 24),
          Text(
            '본 계약서는 안전 거래 플랫폼 Trana를 통하여, 사전에 신분증 OCR 및 안면인식(Face Liveness)을 통한 신원인증을 완료한 당사자 간에 체결되는 법적 구속력을 가진 전자계약서입니다.',
            style: context.txt(fontSize: 10, color: vrc(context).textPrimary),
          ),
          const SizedBox(height: 20),
          ...contents.map(
            (s) => _SectionItem(
              section: s,
              onToggle: (field, selected) => onToggle(field, selected),
            ),
          ),
          Text(
            '본 계약의 체결을 증명하기 위하여, 당사자는 플랫폼 Trana의 본인인증 절차를 거쳐 각자 전자서명함으로써 본 계약을 발효한다.',
            style: context.txt(fontSize: 10),
          ),
          const SizedBox(height: 24),
          Text(
            '[ 판매자 (양도인) ]',
            style: context.txt(
              fontSize: 11,
              fontWeight: FontWeight.w700,
              color: vrc(context).textPrimary,
            ),
          ),
          const SizedBox(height: 10),
          const _SignatureField(label: '성명'),
          const _SignatureField(label: '생년월일'),
          const _SignatureField(label: '연락처'),
          const _SignatureStampField(),
          const SizedBox(height: 24),
          Text(
            '[ 구매자 (양수인) ]',
            style: context.txt(
              fontSize: 11,
              fontWeight: FontWeight.w700,
              color: vrc(context).textPrimary,
            ),
          ),
          const SizedBox(height: 10),
          const _SignatureField(label: '성명'),
          const _SignatureField(label: '생년월일'),
          const _SignatureField(label: '연락처'),
          const _SignatureStampField(),
        ],
      ),
    );
  }
}

// ==================== Section & Signature Widgets ====================

class _SectionItem extends StatelessWidget {
  const _SectionItem({required this.section, required this.onToggle});

  final ({String title, String body}) section;
  final void Function(String field, bool selected) onToggle;

  static const _tappableFields = [
    '거래 플랫폼',
    '거래 방식',
    '거래 물품명',
    '거래 금액',
    '상품 상태',
    '상품 상세 설명',
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            section.title,
            style: context.txt(
              fontSize: 11,
              fontWeight: FontWeight.w700,
              color: vrc(context).textPrimary,
            ),
          ),
          const SizedBox(height: 3),
          _buildBody(context, section.body),
        ],
      ),
    );
  }

  Widget _buildBody(BuildContext context, String body) {
    final lines = body.split('\n');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: lines.map((line) {
        for (final field in _tappableFields) {
          final key = '$field:';
          if (line.contains(key)) {
            final colonEnd = line.indexOf(key) + key.length;
            final prefix = line.substring(0, colonEnd);
            final value = line.substring(colonEnd).trim();

            return _TappableFieldRow(
              prefix: prefix,
              value: value,
              onToggle: (bool selected) => onToggle(field, selected),
            );
          }
        }
        return Text(line, style: context.txt(fontSize: 10));
      }).toList(),
    );
  }
}

class _TappableFieldRow extends HookConsumerWidget {
  const _TappableFieldRow({
    required this.prefix,
    required this.value,
    required this.onToggle,
  });

  final String prefix;
  final String value;
  final void Function(bool selected) onToggle;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selected = useState(false);

    return GestureDetector(
      onTap: () {
        selected.value = !selected.value;
        onToggle(selected.value);
      },
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(vertical: 5),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              border: Border.all(
                width: 2,
                color: selected.value
                    ? fxc(context).brandColor!
                    : Colors.transparent,
              ),
              color: vrc(context).secondaryColor,
            ),
            child: Text('$prefix $value', style: context.txt(fontSize: 12)),
          ),
          if (selected.value)
            Positioned(
              left: 7,
              top: -5,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      vrc(context).background!,
                      vrc(context).background!,
                      vrc(context).secondaryColor!,
                      vrc(context).secondaryColor!,
                    ],
                    stops: [0.0, 0.5, 0.5, 1.0],
                  ),
                ),
                child: Icon(
                  CooliconsIcon.check,
                  size: 20,
                  color: fxc(context).brandColor,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _SignatureField extends StatelessWidget {
  const _SignatureField({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          SizedBox(
            width: 56,
            child: Text('$label:', style: context.txt(fontSize: 11)),
          ),
          Expanded(
            child: Container(
              height: 10,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: vrc(context).borderPrimary!),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SignatureStampField extends StatelessWidget {
  const _SignatureStampField();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          SizedBox(
            width: 56,
            child: Text('서명:', style: context.txt(fontSize: 11)),
          ),
          Container(
            width: 80,
            height: 22,
            decoration: BoxDecoration(
              border: Border.all(
                color: vrc(context).textSecondary!,
                width: 0.5,
              ),
            ),
            alignment: Alignment.center,
            child: Text('(인)', style: context.txt(fontSize: 11)),
          ),
        ],
      ),
    );
  }
}
