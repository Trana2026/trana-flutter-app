import 'package:flutter/material.dart';
import 'package:trana/core/theme/app_theme.dart';
import 'package:trana/view/authenticated/contract_template_page/widgets/contract_template_item_list.dart';

class ContractTemplatePage extends StatelessWidget {
  const ContractTemplatePage({super.key});

  @override
  Widget build(BuildContext context) {
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
            fontFamily: "PretendardBold"
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.fromLTRB(20, 15, 20, 100),
        children: [
          ContractTemplateItemList()
        ],
      ),
    );
  }
}