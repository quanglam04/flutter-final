import 'package:flutter_clean_architecture/domain/entities/notification.dart';

abstract class NotificationRepository {
  Future<List<Notification>> getAllNotification();
  Future<bool> changeFollowNotificationUser(String actorId);
  Future<bool> markAsRead(String notificationId);
}
