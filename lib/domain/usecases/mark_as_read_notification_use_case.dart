import 'package:flutter_clean_architecture/domain/repositories/notification_repository.dart';
import 'package:injectable/injectable.dart';

import 'use_case.dart';

@injectable
class MarkAsReadNotificationUseCase
    extends UseCase<void, MarkAsReadNotificationParam> {
  final NotificationRepository _notificationRepository;
  MarkAsReadNotificationUseCase(this._notificationRepository);

  @override
  Future<bool> call({required MarkAsReadNotificationParam params}) async {
    _notificationRepository.markAsRead(params.notificationId);
    return false;
  }
}

class MarkAsReadNotificationParam {
  MarkAsReadNotificationParam(this.notificationId);
  String notificationId;
}
