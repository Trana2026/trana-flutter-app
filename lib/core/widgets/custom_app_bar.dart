import 'package:flutter/material.dart';
import 'package:trana/core/theme/app_text_style.dart';
import 'package:trana/core/theme/app_theme.dart';
import 'package:trana/core/theme/coolicons_icon.dart';

/// 기본 스타일 적용된 앱바 위젯
class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  /// leading 없음 : CustomAppBar(title: )
  const CustomAppBar({
    super.key,
    required this.title,
    this.actions,
    this.bottomProgress,
  }) : canPop = false,
       onTapLeading = null;

  /// leading (<) 있음 : CustomAppBar.leading(title: , onTapLeading: )
  const CustomAppBar.leading({
    super.key,
    required this.title,
    required this.onTapLeading,
    this.actions,
    this.bottomProgress,
  }) : canPop = true;

  final String title;
  final bool canPop;
  final void Function()? onTapLeading;
  final List<Widget>? actions;
  final double? bottomProgress;

  static const double toolbarHeight = 56;

  @override
  Widget build(BuildContext context) {
    final double progress = bottomProgress ?? 0;
    final double screenWidth = MediaQuery.of(context).size.width;
    final double barWidth = screenWidth * progress;

    return AppBar(
      toolbarHeight: toolbarHeight,
      backgroundColor: vrc(context).background,
      elevation: 0,
      scrolledUnderElevation: 0,
      leading: canPop
          ? InkWell(
              onTap: onTapLeading,
              child: Icon(
                CooliconsIcon.chevronLeft,
                color: vrc(context).iconPrimary,
                size: 24,
              ),
            )
          : null,
      centerTitle: true,
      title: Text(
        title,
        style: context.txt(
          color: vrc(context).textPrimary,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: actions,
      actionsPadding: const EdgeInsets.only(right: 20),
      bottom: progress > 0
          ? PreferredSize(
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
            )
          : null,
    );
  }

  // 커스텀앱바 사용을 위해 implements PreferredSizeWidget
  @override
  Size get preferredSize => Size.fromHeight(toolbarHeight);
}
