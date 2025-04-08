import 'package:flutter_clean_architecture/domain/repositories/notification_repository.dart';
import 'package:injectable/injectable.dart';

import 'use_case.dart';

@injectable
class ChangeFollowNotificationUserUseCase
    extends UseCase<void, ChangeFollowNotificationUserParam> {
  final NotificationRepository _notificationRepository;
  ChangeFollowNotificationUserUseCase(this._notificationRepository);

  @override
  Future<bool> call({required ChangeFollowNotificationUserParam params}) async {
    _notificationRepository.changeFollowNotificationUser(params.actorId);
    return false;
  }
}

class ChangeFollowNotificationUserParam {
  ChangeFollowNotificationUserParam(this.actorId);
  String actorId;
}
