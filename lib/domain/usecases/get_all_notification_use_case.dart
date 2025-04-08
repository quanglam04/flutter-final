import 'dart:collection';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_clean_architecture/domain/entities/notification.dart';
import 'package:flutter_clean_architecture/domain/repositories/notification_repository.dart';
import 'package:injectable/injectable.dart';

import 'use_case.dart';

@injectable
class GetAllNotificationUseCase extends UseCase<void, GetAllNotificationParam> {
  final NotificationRepository _notificationRepository;
  GetAllNotificationUseCase(this._notificationRepository);

  @override
  Future<LinkedHashMap<String, List<Notification>>> call({
    required GetAllNotificationParam params,
  }) async {
    final List<Notification> listNotifications =
        await _notificationRepository.getAllNotification();
    listNotifications.sort((a, b) => b.createAt.compareTo(a.createAt));
    final LinkedHashMap<String, List<Notification>> groupedNotifications =
        LinkedHashMap();
    for (final notification in listNotifications) {
      final String formattedDate = DateFormat(
        'yyyy-MM-dd',
      ).format(notification.createAt);
      if (!groupedNotifications.containsKey(formattedDate)) {
        groupedNotifications[formattedDate] = [];
      }
      groupedNotifications[formattedDate]!.add(notification);
    }

    return groupedNotifications;
  }
}

class GetAllNotificationParam {
  GetAllNotificationParam();
}
