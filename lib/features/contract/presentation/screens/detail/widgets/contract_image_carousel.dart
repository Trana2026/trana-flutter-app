import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trana/core/theme/app_theme.dart';
import 'package:trana/core/theme/coolicons_icon.dart';
import 'package:trana/core/widgets/custom_loading_bar.dart';
import 'package:trana/features/contract/presentation/viewmodels/detail_contract_view_model.dart';

class ContractImageCarousel extends HookConsumerWidget {
  const ContractImageCarousel({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final (
      isLoadingData,
      attachmentImageUrls,
      attachmentCount,
      publicCode,
    ) = ref.watch(
      detailContractViewModelProvider.select(
        (s) => (
          s.isLoadingData,
          s.attachmentImageUrls,
          s.attachmentCount,
          s.publicCode,
        ),
      ),
    );
    final controller = usePageController();
    final currentIndex = useState(0);

    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.zero,
      child: GestureDetector(
        onTap: () => Navigator.pop(context),
        behavior: HitTestBehavior.opaque,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 24),
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(28),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: SizedBox(
                      height: 560,
                      width: 315,
                      child: isLoadingData || attachmentImageUrls.isEmpty
                          ? const CustomLoadingBar()
                          : PageView.builder(
                              controller: controller,
                              itemCount: attachmentCount,
                              onPageChanged: (i) => currentIndex.value = i,
                              itemBuilder: (_, i) => CachedNetworkImage(
                                imageUrl: attachmentImageUrls[i],
                                cacheKey: '$publicCode-img-$i',
                                fit: BoxFit.contain,
                                placeholder: (_, _) => const CustomLoadingBar(),
                                errorWidget: (_, _, _) => const Icon(
                                  Icons.broken_image_outlined,
                                  color: Colors.white30,
                                  size: 48,
                                ),
                              ),
                            ),
                    ),
                  ),
                ),

                if (attachmentCount > 1 && currentIndex.value > 0)
                  Positioned(
                    left: 5,
                    child: _ArrowButton(
                      icon: CooliconsIcon.chevronLeft,
                      onTap: () => controller.previousPage(
                        duration: const Duration(milliseconds: 250),
                        curve: Curves.easeInOut,
                      ),
                    ),
                  ),

                if (attachmentCount > 1 &&
                    currentIndex.value < attachmentCount - 1)
                  Positioned(
                    right: 5,
                    child: _ArrowButton(
                      icon: CooliconsIcon.chevronRight,
                      onTap: () => controller.nextPage(
                        duration: const Duration(milliseconds: 250),
                        curve: Curves.easeInOut,
                      ),
                    ),
                  ),

                Positioned(
                  bottom: 10,
                  child: Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(
                      color: fxc(context).imageCountBg,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      '${currentIndex.value + 1}/$attachmentCount',
                      style: TextStyle(
                        color: fxc(context).unchangeableWhite,
                        fontSize: 10,
                        fontWeight: FontWeight.w500,
                        height: 1.5,
                        letterSpacing: 2,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  static void show(BuildContext context) {
    showDialog(
      context: context,
      barrierColor: Colors.black.withValues(alpha: 0.85),
      builder: (_) => const ContractImageCarousel(),
    );
  }
}

class _ArrowButton extends StatelessWidget {
  const _ArrowButton({required this.icon, required this.onTap});

  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: fxc(context).opacityBg,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(icon, color: fxc(context).unchangeableWhite, size: 20),
      ),
    );
  }
}
