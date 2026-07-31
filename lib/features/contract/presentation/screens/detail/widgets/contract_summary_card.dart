import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trana/core/theme/app_text_style.dart';
import 'package:trana/core/theme/app_theme.dart';
import 'package:trana/core/theme/coolicons_icon.dart';
import 'package:trana/core/widgets/app_icon.dart';
import 'package:trana/core/widgets/thumbnail_placeholder.dart';
import 'package:trana/features/contract/domain/utils/string_extensions.dart';
import 'package:trana/features/contract/presentation/screens/detail/widgets/contract_image_carousel.dart';
import 'package:trana/features/contract/presentation/viewmodels/detail_contract_view_model.dart';

class ContractSummaryCard extends HookConsumerWidget {
  const ContractSummaryCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final (
      myRole,
      deliveryType,
      title,
      price,
      firstUrl,
      count,
      publicCode,
    ) = ref.watch(
      detailContractViewModelProvider.select(
        (s) => (
          s.myRole,
          s.deliveryType,
          s.title,
          s.price,
          s.firstAttachmentUrl,
          s.attachmentCount,
          s.publicCode,
        ),
      ),
    );
    final roleLabel = myRole != null ? '${myRole.label}자' : '-';
    final titleLabel = title ?? '-';
    final priceLabel = price != null
        ? '${price.toString().toPriceFormat}원'
        : '-';
    final deliveryLabel = deliveryType?.label ?? '-';

    return Row(
      children: [
        firstUrl == null
            ? const ThumbnailPlaceholder()
            : Stack(
                children: [
                  GestureDetector(
                    onTap: () => ContractImageCarousel.show(context),
                    child: ClipRRect(
                      borderRadius: BorderRadiusGeometry.circular(16),
                      child: CachedNetworkImage(
                        imageUrl: firstUrl,
                        cacheKey: '$publicCode-first',
                        height: 100,
                        width: 100,
                        fit: BoxFit.cover,
                        errorWidget: (_, _, _) => const ThumbnailPlaceholder(),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 5,
                    bottom: 5,
                    child: Container(
                      height: 20,
                      width: 20,
                      decoration: BoxDecoration(
                        color: fxc(context).imageCountBg,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Text(
                          count.toString(),
                          style: context.txt(
                            color: fxc(context).textBrand,
                            fontSize: 10,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
        const SizedBox(width: 16),

        Expanded(
          child: SizedBox(
            height: 100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  titleLabel,
                  style: context.txt(
                    color: vrc(context).textPrimary,
                    fontWeight: FontWeight.w700,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 2),
                Text(priceLabel, style: context.txt()),
                const Spacer(),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: vrc(context).secondaryColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          AppIcon.svg(
                            asset: 'assets/icons/box.svg',
                            size: 16,
                            color: vrc(context).iconSecondary,
                          ),
                          const SizedBox(width: 6),
                          Text(deliveryLabel, style: context.txt(fontSize: 12)),
                        ],
                      ),
                    ),
                    const SizedBox(width: 4),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: vrc(context).secondaryColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            CooliconsIcon.user01,
                            size: 16,
                            color: vrc(context).iconSecondary,
                          ),
                          const SizedBox(width: 6),
                          Text(roleLabel, style: context.txt(fontSize: 12)),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
