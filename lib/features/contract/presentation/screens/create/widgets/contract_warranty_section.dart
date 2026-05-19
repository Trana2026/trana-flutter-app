import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trana/core/theme/app_theme.dart';
import 'package:trana/features/contract/domain/enums/role.dart';
import 'package:trana/features/contract/presentation/viewmodels/create_contract_view_model.dart';

class ContractWarrantySection extends HookConsumerWidget {
  const ContractWarrantySection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vm = ref.read(createContractViewModelProvider.notifier);
    final isWarranted = useState<bool>(false);

    useEffect(() {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        vm.updateWarranted(isWarranted.value);
      });
      return null;
    }, [isWarranted.value]);

    // 판매자 선택 시에만 보증 기간 선택 영역 노출
    final role = ref.watch(createContractViewModelProvider).role;
    if (role != Role.seller) return SizedBox();

    return Column(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 1.5),
              child: Text(
                "보증 기간",
                style: TextStyle(
                  color: vrc(context).textTertiary,
                  fontSize: 15,
                  fontFamily: "PretendardMedium",
                ),
              ),
            ),
            const SizedBox(width: 6),
            Icon(
              Icons.info_outline_rounded,
              size: 16,
              color: vrc(context).iconSecondary,
            ),
          ],
        ),
        const SizedBox(height: 6),

        InkWell(
          borderRadius: BorderRadius.circular(18),
          onTap: () => isWarranted.value = !isWarranted.value,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              color: Color(0xFF00C950).withOpacity(0.12),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  isWarranted.value
                      ? Icons.check_circle
                      : Icons.check_circle_outline,
                  color: Color(0xFF40C572),
                  size: 22,
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "보증 기간 3일",
                        style: TextStyle(
                          color: Color(0xFF40C572),
                          fontSize: 14,
                          fontFamily: "PretendardBold",
                          fontWeight: FontWeight.bold,
                          height: 1.35,
                          letterSpacing: -0.2,
                        ),
                      ),
                      Text(
                        "보증 기간을 제공하면 구매자의 신뢰도가 40% 증가합니다. 명확한 조건은 분쟁을 예방합니다.",
                        style: TextStyle(
                          color: Color(0xFF40C572),
                          fontSize: 13,
                          fontFamily: "PretendardMedium",
                          height: 1.35,
                          letterSpacing: -0.2,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
