import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trana/core/theme/app_theme.dart';
import 'package:trana/features/contract/presentation/screens/template/widgets/contract_template_item_list.dart';

class ContractTemplatePage extends HookConsumerWidget {
  const ContractTemplatePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: vrc(context).secondaryColor,
      appBar: AppBar(
        backgroundColor: vrc(context).background,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "템플릿",
          style: TextStyle(
            color: vrc(context).textPrimary,
            fontSize: 17,
            fontWeight: FontWeight.w700,
            height: 1.5,
            letterSpacing: -0.17,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(17, 15, 17, 100),
        children: [
          const ContractTemplateItemList(),
        ],
      ),
    );
  }
}