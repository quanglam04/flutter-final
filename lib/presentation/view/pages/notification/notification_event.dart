part of 'notification_bloc.dart';

@freezed
sealed class NotificationEvent with _$NotificationEvent {
  const factory NotificationEvent.loadData() = _LoadData;
  const factory NotificationEvent.changeFollowed(String actorId) =
      _ChangeFollowed;
  const factory NotificationEvent.markAsRead(String id) = _MarkAsRead;
}
