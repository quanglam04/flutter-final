import 'dart:collection';

import 'package:flutter_clean_architecture/domain/entities/notification.dart';
import 'package:flutter_clean_architecture/domain/usecases/change_follow_notification_user_use_case.dart';
import 'package:flutter_clean_architecture/domain/usecases/get_all_notification_use_case.dart';
import 'package:flutter_clean_architecture/domain/usecases/mark_as_read_notification_use_case.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../../shared/common/error_converter.dart';
import '../../../base/base_bloc.dart';
import '../../../base/base_state.dart';
import '../../../base/page_status.dart';

part 'notification_bloc.freezed.dart';
part 'notification_event.dart';
part 'notification_state.dart';

@injectable
class NotificationBloc extends BaseBloc<NotificationEvent, NotificationState> {
  final GetAllNotificationUseCase _getAllNotificationUseCase;
  final ChangeFollowNotificationUserUseCase
  _changeFollowNotificationUserUseCase;
  final MarkAsReadNotificationUseCase _markAsReadNotificationUseCase;
  NotificationBloc(
    this._getAllNotificationUseCase,
    this._changeFollowNotificationUserUseCase,
    this._markAsReadNotificationUseCase,
  ) : super(const NotificationState()) {
    on<NotificationEvent>((event, emit) async {
      try {
        switch (event) {
          case _LoadData():
            emit(state.copyWith(pageStatus: PageStatus.Loaded));
            final LinkedHashMap<String, List<Notification>>
            groupedNotifications = await _getAllNotificationUseCase.call(
              params: GetAllNotificationParam(),
            );
            emit(
              state.copyWith(listNotificatioFollowDay: groupedNotifications),
            );
            break;
          case _ChangeFollowed(actorId: final actorId):
            await _changeFollowNotificationUserUseCase.call(
              params: ChangeFollowNotificationUserParam(actorId),
            );
            emit(state.copyWith(followState: !state.followState));
            break;

          case _MarkAsRead(id: final notificationId):
            await _markAsReadNotificationUseCase.call(
              params: MarkAsReadNotificationParam(notificationId),
            );

            final updatedReadIds = List<String>.from(state.readNotificationIds);
            if (!updatedReadIds.contains(notificationId)) {
              updatedReadIds.add(notificationId);
            }

            emit(state.copyWith(readNotificationIds: updatedReadIds));

            break;
        }
      } catch (e, s) {
        handleError(emit, ErrorConverter.convert(e, s));
      }
    });
  }
}
