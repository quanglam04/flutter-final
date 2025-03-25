import 'package:injectable/injectable.dart';

import 'use_case.dart';

@injectable
class AddTaskUseCase extends UseCase<void, AddTaskParam> {
  AddTaskUseCase();

  @override
  Future<bool> call({required AddTaskParam params}) async {
    // TODO
    return false;
  }
}

class AddTaskParam {
  AddTaskParam();
}