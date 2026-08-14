import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  /// DateTime > String 'yyyy.MM.dd' 변환
  String get toDotFormat => DateFormat('yyyy.MM.dd').format(this);

  /// DateTime > String 'HH:mm' 변환
  String get toTimeFormat => DateFormat('HH:mm').format(this);

  /// DateTime > String 'n분 전' 변환
  String get timeAgo {
    final diff = DateTime.now().difference(this);
    if (diff.inSeconds < 60) {
      return '방금 전';
    } else if (diff.inMinutes < 60) {
      return '${diff.inMinutes}분 전';
    } else if (diff.inHours < 24) {
      return '${diff.inHours}시간 전';
    } else if (diff.inDays < 7) {
      return '${diff.inDays}일 전';
    }
    return toDotFormat;
  }
}

extension NullableDateTimeExtension on DateTime? {
  /// null이면 '시간 없음' 반환, 아니면 [DateTimeExtension.timeAgo]
  String get timeAgo => this?.timeAgo ?? '시간 없음';
}
