part of 'notification_bloc.dart';

@freezed
class NotificationState extends BaseState with _$NotificationState {
  const NotificationState({
    super.pageStatus = PageStatus.Loaded,
    super.pageErrorMessage,
    this.listNotificatioFollowDay,
    this.followState = false,
    this.isRead = false,
  });

  @override
  final LinkedHashMap<String, List<Notification>>? listNotificatioFollowDay;

  @override
  final bool followState;

  @override
  final bool isRead;
}
