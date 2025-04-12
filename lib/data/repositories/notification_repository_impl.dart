import 'package:flutter_clean_architecture/domain/entities/author.dart';
import 'package:flutter_clean_architecture/domain/entities/notification.dart';
import 'package:flutter_clean_architecture/shared/common/error_entity/business_error_entity.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../domain/repositories/notification_repository.dart';

@Injectable(as: NotificationRepository)
class NotificationRepositoryImpl extends NotificationRepository {
  NotificationRepositoryImpl();

  @override
  Future<bool> changeFollowNotificationUser(String actorId) async {
    try {
      final Notification notification = _Notifications.firstWhere(
        (notification) => notification.author.authorId.trim() == actorId,
      );
      notification.author.isFollow = !notification.author.isFollow;
      return true;
    } catch (e) {
      throw BusinessErrorEntityData(
        name: 'lỗi khi thay đổi follow user với id = $actorId',
        message: 'lỗi khi thay đổi follow user với id = $actorId',
      );
    }
  }

  @override
  Future<List<Notification>> getAllNotification() async {
    final notifications = _Notifications;
    final prefs = await SharedPreferences.getInstance();
    final readNotificationIds = prefs.getStringList('read_notifications') ?? [];
    for (var notification in notifications) {
      if (readNotificationIds.contains(notification.notificationId)) {
        notification.isRead = true;
      }
    }

    return notifications;
  }

  @override
  Future<bool> markAsRead(String notificationId) async {
    try {
      final Notification notification = _Notifications.firstWhere(
        (notification) => notification.notificationId == notificationId,
      );
      notification.isRead = true;

      final prefs = await SharedPreferences.getInstance();
      final readNotificationIds =
          prefs.getStringList('read_notifications') ?? [];
      if (!readNotificationIds.contains(notificationId)) {
        readNotificationIds.add(notificationId);
        await prefs.setStringList('read_notifications', readNotificationIds);
      }

      return true;
    } catch (e) {
      throw BusinessErrorEntityData(
        name: 'lỗi khi thấy thông tin thông báo với id = $notificationId',
        message: 'lỗi khi thấy thông tin thông báo với id = $notificationId',
      );
    }
  }

  static final List<Notification> _Notifications = [
    Notification(
      '2',
      'https://avatars.githubusercontent.com/u/119520066?v=4',
      Author('15', '', 'Lâm', 0, true),
      'đã thích bài viết của bạn',
      DateTime(2025, 3, 27, 12, 35),
      'like',
      false,
    ),
    Notification(
      '3',
      'https://avatars.githubusercontent.com/u/119520066?v=4',
      Author('16', '', 'Lâm', 0, false),
      'đã follow bạn',
      DateTime(2025, 3, 20, 23, 50),
      'follow',
      false,
    ),
    Notification(
      '4',
      'https://i.pinimg.com/736x/8f/1c/a2/8f1ca2029e2efceebd22fa05cca423d7.jpg',
      Author('14', '', 'Quang Lâm', 0, false),
      'đã chia sẻ bài viết của bạn',
      DateTime(2025, 3, 26, 9, 20),
      'share',
      false,
    ),
    Notification(
      '5',
      'https://diendandatdai.com/wp-content/uploads/2024/10/avatar-fb-mac-dinh-60sNprK5.jpg',
      Author('15', '', 'Hải', 0, true),
      'đã thích bài viết của bạn',
      DateTime(2025, 3, 26, 12, 35),
      'like',
      false,
    ),
    Notification(
      '7',
      'https://img.freepik.com/free-psd/3d-render-avatar-character_23-2150611765.jpg',
      Author('Alice', '', 'Pi tơ', 0, true),
      'đã follow bạn',
      DateTime(2025, 3, 25, 7, 55),
      'follow',
      false,
    ),
    Notification(
      '8',
      'https://img.lovepik.com/photo/50051/4826.jpg_wh860.jpg',
      Author('Bob', '', 'Bob', 0, false),
      'đã thích bài viết của bạn',
      DateTime(2025, 3, 25, 10, 15),
      'like',
      false,
    ),
    Notification(
      '9',
      'https://photo.znews.vn/w660/Uploaded/mdf_eioxrd/2021_07_06/2.jpg',
      Author('Charlie', '', 'Charlie', 0, true),
      'đã follow bạn',
      DateTime(2025, 3, 24, 12, 30),
      'follow',
      false,
    ),
    Notification(
      '10',
      'https://avatars.githubusercontent.com/u/119520066?v=4',
      Author('David', '', 'Nam', 0, false),
      'đã chia sẻ bài viết của bạn',
      DateTime(2025, 3, 24, 15, 20),
      'share',
      false,
    ),
    Notification(
      '11',
      'https://img.lovepik.com/photo/50051/4826.jpg_wh860.jpg',
      Author('Eve', '', 'Eve', 0, true),
      'đã gửi tin nhắn cho bạn',
      DateTime(2025, 3, 24, 18, 10),
      'message',
      false,
    ),
  ];
}
