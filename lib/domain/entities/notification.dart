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
}
