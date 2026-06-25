import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:trana/core/theme/app_text_style.dart';
import 'package:trana/core/theme/app_theme.dart';
import 'package:trana/core/theme/coolicons_icon.dart';
import 'package:trana/features/contract/domain/utils/string_extensions.dart';
import 'package:trana/features/contract/presentation/screens/detail/widgets/contract_image_carousel.dart';
import 'package:trana/features/contract/presentation/viewmodels/detail_contract_view_model.dart';

class ContractSummaryCard extends HookConsumerWidget {
  const ContractSummaryCard({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final detailState = ref.watch(detailContractViewModelProvider);

    final roleLabel = detailState.myRole?.label ?? '-';
    final deliveryType = detailState.deliveryType;
    final title = detailState.title ?? '-';
    final price = detailState.price != null
        ? '${detailState.price.toString().toPriceFormat}원'
        : '-';

    return Row(
      children: [
        detailState.firstAttachmentUrl != null
            ? Stack(
                children: [
                  GestureDetector(
                    onTap: () => ContractImageCarousel.show(context),
                    child: ClipRRect(
                      borderRadius: BorderRadiusGeometry.circular(16),
                      child: Image.network(
                        detailState.firstAttachmentUrl!,
                        height: 100,
                        width: 100,
                        fit: BoxFit.cover,
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
                          detailState.attachmentCount.toString(),
                          style: context.txt(
                            color: fxc(context).textBrand,
                            fontSize: 10,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            : placeholder(context),
        const SizedBox(width: 16),
        Expanded(
          child: SizedBox(
            height: 100,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: context.txt(
                    color: vrc(context).textPrimary,
                    fontWeight: FontWeight.w700,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 2),
                Text(price, style: context.txt()),
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
                          SvgPicture.asset(
                            'assets/icons/box.svg',
                            height: 16,
                            width: 16,
                            fit: BoxFit.contain,
                            colorFilter: ColorFilter.mode(
                              vrc(context).iconSecondary!,
                              BlendMode.srcIn,
                            ),
                          ),
                          const SizedBox(width: 6),
                          Text(
                            deliveryType?.label ?? '-',
                            style: context.txt(fontSize: 12),
                          ),
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
                          Text('$roleLabel자', style: context.txt(fontSize: 12)),
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

  Widget placeholder(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: vrc(context).tertiaryColor,
      ),
      child: Icon(
        CooliconsIcon.image02,
        color: vrc(context).textDisable,
        size: 32,
      ),
    );
  }
}
