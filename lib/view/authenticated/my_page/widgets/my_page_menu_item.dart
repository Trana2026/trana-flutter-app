import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart'; // 🍎 iOS 스타일 위젯을 위해 추가
import 'package:trana/core/theme/app_theme.dart';

class MyPageMenuItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? trailing;
  final String? statusText;
  final bool isSwitch;
  final bool showChevron;

  const MyPageMenuItem({
    super.key,
    required this.icon,
    required this.title,
    this.trailing,
    this.statusText,
    this.isSwitch = false,
    this.showChevron = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Row(
            children: [
              Icon(
                icon,
                color: vrc(context).iconPrimary,
                size: 22,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  title,
                  style: TextStyle(
                    color: vrc(context).textPrimary,
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              if (trailing != null)
                Text(
                  trailing!,
                  style: TextStyle(
                    color: vrc(context).textPrimary, 
                    fontSize: 14, 
                    fontWeight: FontWeight.w600
                  ),
                ),
              if (statusText != null)
                Text(
                  statusText!,
                  style: TextStyle(
                    color: statusText == "완료" ? fxc(context).brandColor : vrc(context).textSecondary,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              
              // 🔥 기존 Switch를 CupertinoSwitch로 변경
              if (isSwitch)
                SizedBox(
                  height: 30, // 메뉴 행 높이에 맞게 조절
                  child: Transform.scale(
                    scale: 0.9,
                    alignment: Alignment.centerRight,
                    child: CupertinoSwitch(
                      value: true, // 나중에 상태 관리(State) 연결 필요
                      onChanged: (v) {},
                      activeTrackColor: fxc(context).brandColor, // 켜졌을 때 트라나 브랜드 컬러
                      inactiveTrackColor: Colors.white10, // 꺼졌을 때 배경색
                    ),
                  ),
                ),

              if (showChevron && !isSwitch)
                Icon(
                  Icons.chevron_right, 
                  color: vrc(context).textSecondary, 
                  size: 18
                ),
            ],
          ),
        ),
      ],
    );
  }
}