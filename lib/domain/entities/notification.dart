import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_clean_architecture/domain/entities/author.dart';
import 'package:json_annotation/json_annotation.dart';
part 'notification.g.dart';

@JsonSerializable()
class Notification {
  String notificationId;
  String imgPath;
  Author author;
  String content;
  DateTime createAt;
  String type;
  bool isRead;

  Notification(
    this.notificationId,
    this.imgPath,
    this.author,
    this.content,
    this.createAt,
    this.type,
    this.isRead,
  );

  String _getMonthName() {
    return DateFormat.MMMM("en").format(createAt);
  }

  String displayCreateAt() {
    final duration = DateTime.now().difference(createAt);
    final durationForYear = DateTime.now();
    if (duration.inDays == 0) {
      return 'Today, ${_getMonthName()} ${createAt.day}';
    }
    if (duration.inDays == 1) {
      return 'Yesterday, ${_getMonthName()} ${createAt.day}';
    }
    if (durationForYear.year == createAt.year) {
      return '${_getMonthName()} ${createAt.day}';
    } else {
      return '${_getMonthName()} ${createAt.day} ${createAt.year}';
    }
  }
}
