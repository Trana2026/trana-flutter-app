import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart'; 
import 'package:hooks_riverpod/hooks_riverpod.dart'; 
import 'package:trana/core/theme/app_theme.dart';
import 'package:trana/view/authenticated/notification_page/widgets/notification_item.dart';

class NotificationPage extends HookConsumerWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifications = useState<List<Map<String, dynamic>>>([
      {
        'title': '트라나',
        'body': 'Bluemon님 과의 계약서가 생성되었어요. 자세한 계약서를 확인하려면 클릭해주세요.',
        'time': '1분 전',
        'icon': Icons.description_outlined,
        'iconColor': const Color(0xFF51A2FF),
      },
      {
        'title': '트라나',
        'body': 'Bluemon님 과의 계약서가 생성되었어요. 자세한 계약서를 확인하려면 클릭해주세요.',
        'time': '1분 전',
        'icon': Icons.edit_outlined,
        'iconColor': const Color(0xFF00C950),
      },
      {
        'title': '하이파이브',
        'body': '조안님과의 미팅이 예정되어 있습니다. 자세한 내용을 확인하려면 클릭해주세요.',
        'time': '5분 전',
        'icon': Icons.edit_outlined,
        'iconColor': const Color(0xFF00C950),
      },
      {
        'title': '코드리뷰',
        'body': '마이크님이 제출한 코드 리뷰 요청이 도착했습니다. 확인 후 피드백을 남겨주세요.',
        'time': '10분 전',
        'icon': Icons.edit_outlined,
        'iconColor': const Color(0xFF00C950),
      },
    ]);

    return Scaffold(
      backgroundColor: vrc(context).background,
      appBar: AppBar(
        backgroundColor: vrc(context).background,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "알림",
          style: TextStyle(
            color: vrc(context).textPrimary,
            fontSize: 17,
            fontWeight: FontWeight.w800,
          ),
        ),
      ),
      body: notifications.value.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(flex: 2),
                  Icon(
                    Icons.chat_bubble_rounded,
                    size: 28,
                    color: fxc(context).brandColor,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    "새로운 알림이 없어요",
                    style: TextStyle(
                      color: vrc(context).textPrimary,
                      fontSize: 14,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  const Spacer(flex: 3),
                ],
              ),
            )
          : ListView.separated(
              padding: const EdgeInsets.symmetric(vertical: 10),
              itemCount: notifications.value.length,
              separatorBuilder: (context, index) => Divider(
                color: vrc(context).tertiaryColor,
                height: 1,
                indent: 20,
                endIndent: 20,
              ),
              itemBuilder: (context, index) {
                final item = notifications.value[index];
                return Dismissible(
                  key: UniqueKey(),
                  direction: DismissDirection.endToStart,
                  background: Container(
                    alignment: Alignment.centerRight,
                    color: const Color(0xFFEF4444),
                    padding: const EdgeInsets.only(right: 20),
                    child: const Icon(
                      Icons.delete_outline,
                      color: Colors.white,
                      size: 26,
                    ),
                  ),
                  onDismissed: (direction) {
                    final newList = List<Map<String, dynamic>>.from(
                      notifications.value,
                    );
                    newList.removeAt(index);
                    notifications.value = newList;
                  },
                  child: NotificationItem(
                    title: item['title'] as String,
                    body: item['body'] as String,
                    time: item['time'] as String,
                    icon: item['icon'] as IconData,
                    iconColor: item['iconColor'] as Color,
                  ),
                );
              },
            ),
    );
  }
}
