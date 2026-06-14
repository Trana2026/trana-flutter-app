import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trana/core/widgets/custom_loading_bar.dart';
import 'package:trana/features/contract/presentation/viewmodels/detail_contract_view_model.dart';

class ContractImageCarousel extends HookConsumerWidget {
  const ContractImageCarousel({super.key});

  static void show(BuildContext context) {
    showDialog(
      context: context,
      barrierColor: Colors.black.withValues(alpha: 0.85),
      builder: (_) => const ContractImageCarousel(),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detailState = ref.watch(detailContractViewModelProvider);

    final imageUrls = detailState.attachmentImageUrls;

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
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: SizedBox(
                      height: 560,
                      width: 315,
                      child: detailState.isLoading || imageUrls.isEmpty
                          ? const CustomLoadingBar()
                          : PageView.builder(
                              controller: controller,
                              itemCount: imageUrls.length,
                              onPageChanged: (i) => currentIndex.value = i,
                              itemBuilder: (_, i) => Image.network(
                                imageUrls[i],
                                fit: BoxFit.contain,
                                loadingBuilder: (_, child, loadingProgress) {
                                  if (loadingProgress == null) return child;
                                  return const CustomLoadingBar();
                                },
                                errorBuilder: (_, _, _) => const Icon(
                                  Icons.broken_image_outlined,
                                  color: Colors.white30,
                                  size: 48,
                                ),
                              ),
                            ),
                    ),
                  ),
                ),

                if (imageUrls.length > 1 && currentIndex.value > 0)
                  Positioned(
                    left: 5,
                    child: _ArrowButton(
                      icon: Icons.chevron_left,
                      onTap: () => controller.previousPage(
                        duration: const Duration(milliseconds: 250),
                        curve: Curves.easeInOut,
                      ),
                    ),
                  ),

                if (imageUrls.length > 1 &&
                    currentIndex.value < imageUrls.length - 1)
                  Positioned(
                    right: 5,
                    child: _ArrowButton(
                      icon: Icons.chevron_right,
                      onTap: () => controller.nextPage(
                        duration: const Duration(milliseconds: 250),
                        curve: Curves.easeInOut,
                      ),
                    ),
                  ),

                Positioned(
                  bottom: 10,
                  child: Text(
                    '${currentIndex.value + 1} / ${imageUrls.length}',
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      height: 1.5,
                      letterSpacing: -0.14,
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
        width: 36,
        height: 36,
        decoration: BoxDecoration(
          color: Colors.black.withValues(alpha: 0.5),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: Colors.white, size: 24),
      ),
    );
  }
}
