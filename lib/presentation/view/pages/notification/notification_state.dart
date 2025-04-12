part of 'notification_bloc.dart';

@freezed
class NotificationState extends BaseState with _$NotificationState {
  const NotificationState({
    this.readNotificationIds = const [],
    super.pageStatus = PageStatus.Loaded,
    super.pageErrorMessage,
    this.listNotificatioFollowDay,
    this.followState = false,
    this.isRead = false,
  });

  @override
  final List<String> readNotificationIds;

  @override
  final LinkedHashMap<String, List<Notification>>? listNotificatioFollowDay;

  @override
  final bool followState;

  @override
  final bool isRead;
  bool isNotificationRead(String notificationId) {
    return readNotificationIds.contains(notificationId);
  }
}
