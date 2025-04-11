import 'package:injectable/injectable.dart';

import 'use_case.dart';

@injectable
class ChangeFollowUserUseCase extends UseCase<void, ChangeFollowUserParam> {
  ChangeFollowUserUseCase();

  @override
  Future<bool> call({required ChangeFollowUserParam params}) async {
    // TODO
    return false;
  }
}

class ChangeFollowUserParam {
  ChangeFollowUserParam();
}