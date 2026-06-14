import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trana/core/router/app_router.dart';
import 'package:trana/core/theme/app_text_style.dart';
import 'package:trana/core/theme/app_theme.dart';
import 'package:trana/core/theme/coolicons_icon.dart';
import 'package:trana/core/widgets/custom_toast.dart';
import 'package:trana/core/widgets/primary_button.dart';
import 'package:trana/core/widgets/select_role_card.dart';
import 'package:trana/features/contract/domain/enums/role.dart';
import 'package:trana/features/contract/presentation/viewmodels/create_contract_view_model.dart';
import 'package:trana/features/contract/presentation/viewmodels/modify_contract_view_model.dart';

class SelectUserRolePage extends HookConsumerWidget {
  final bool isModify;

  const SelectUserRolePage({super.key, this.isModify = false});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final createVM = ref.read(createContractViewModelProvider.notifier);
    final modifyVM = ref.read(modifyContractViewModelProvider.notifier);

    final Role? initialRole = isModify
        ? ref.read(modifyContractViewModelProvider).role
        : ref.read(createContractViewModelProvider).role;

    final selectedIndex = useState<int?>(switch (initialRole) {
      Role.seller => 0,
      Role.buyer => 1,
      null => null,
    });

    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        isModify
            ? modifyVM.updateRole(selectedIndex.value)
            : createVM.updateRole(selectedIndex.value);
      });
      return null;
    }, [selectedIndex.value]);

    const int currentStep = 1;
    const int totalStep = 3;

    final double progress = currentStep / totalStep;
    final double screenWidth = MediaQuery.of(context).size.width;
    final double barWidth = screenWidth * progress;
    final bool isEnabled = selectedIndex.value != null;

    return Scaffold(
      backgroundColor: vrc(context).background,
      appBar: AppBar(
        leading: InkWell(
          onTap: () => context.go(AppRoutes.home),
          child: Icon(
            CooliconsIcon.chevronLeft,
            color: vrc(context).iconPrimary,
            size: 24,
          ),
        ),
        title: Text(
          "계약 작성",
          style: context.txt(
            color: vrc(context).textPrimary,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(4),
          child: Align(
            alignment: Alignment.centerLeft,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              height: 4,
              width: barWidth,
              color: fxc(context).brandColor,
            ),
          ),
        ),
        backgroundColor: vrc(context).background,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "역할 선택",
              style: context.txt(
                color: vrc(context).textPrimary,
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              "역할을 선택해주세요.\n선택한 역할에 따라 계약 조건이 자동으로 설정됩니다.",
              style: context.txt(),
            ),
            const SizedBox(height: 20),
            SelectRoleCard(
              iconAsset: 'assets/icons/box.svg',
              title: "저는 판매자입니다",
              description: "물품을 전달하고 대금을 지급받아요",
              isSelected: selectedIndex.value == 0,
              onTap: () => selectedIndex.value = 0,
            ),
            const SizedBox(height: 10),
            SelectRoleCard(
              icon: CooliconsIcon.user01,
              title: "저는 구매자입니다",
              description: "물품을 전달받고 대금을 지급해요",
              isSelected: selectedIndex.value == 1,
              onTap: () => selectedIndex.value = 1,
            ),
          ],
        ),
      ),
      bottomNavigationBar: SafeArea(
        top: false,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
          child: PrimaryButton(
            text: "다음",
            onTap: () async {
              if (!isEnabled) return;

              final bool success;
              if (isModify) {
                success = await modifyVM.updateDraftRole();
                if (!context.mounted) return;
                if (!success) {
                  showErrorToast(
                    context,
                    ref.read(modifyContractViewModelProvider).error!,
                  );
                  modifyVM.clearError();
                  return;
                }

                context.push(AppRoutes.modifyContractCreate);
              } else {
                success = await createVM.updateDraftRole();
                if (!context.mounted) return;
                if (!success) {
                  showErrorToast(
                    context,
                    ref.read(createContractViewModelProvider).error!,
                  );
                  createVM.clearError();
                  return;
                }

                context.push(AppRoutes.contractCreate);
              }
            },
            backgroundColor: isEnabled
                ? fxc(context).brandColor!
                : vrc(context).disableColor!,
            foregroundColor: isEnabled
                ? fxc(context).textBrand!
                : vrc(context).textDisable!,
          ),
        ),
      ),
    );
  }
}
