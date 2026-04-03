import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart'; // 추가
import 'package:hooks_riverpod/hooks_riverpod.dart'; // 추가
import 'package:trana/core/theme/app_theme.dart';

class TradeTypeSelector extends HookConsumerWidget {
  const TradeTypeSelector({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selectedIndex = useState(1);

    return Center(
      child: Container(
        width: double.infinity,
        height: 60,
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: vrc(context).secondaryColor,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            Expanded(
              child: GestureDetector(
                onTap: () => selectedIndex.value = 0,
                child: Container(
                  decoration: BoxDecoration(
                    color: selectedIndex.value == 0
                        ? fxc(context).brandColor
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    "직거래",
                    style: TextStyle(
                      fontSize: 17,
                      fontFamily: "PretendardSemiBold",
                      color: selectedIndex.value == 0
                          ? fxc(context).textBrand
                          : vrc(context).textDisable,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: GestureDetector(
                onTap: () => selectedIndex.value = 1,
                child: Container(
                  decoration: BoxDecoration(
                    color: selectedIndex.value == 1
                        ? fxc(context).brandColor
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    "택배 거래",
                    style: TextStyle(
                      fontSize: 17,
                      fontFamily: "PretendardSemiBold",
                      color: selectedIndex.value == 1
                          ? fxc(context).textBrand
                          : vrc(context).textDisable,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
