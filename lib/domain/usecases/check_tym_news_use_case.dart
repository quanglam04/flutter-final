import 'package:injectable/injectable.dart';

import 'use_case.dart';

@injectable
class CheckTymNewsUseCase extends UseCase<void, CheckTymNewsParam> {
  CheckTymNewsUseCase();

  @override
  Future<bool> call({required CheckTymNewsParam params}) async {
    // TODO
    return false;
  }
}

class CheckTymNewsParam {
  CheckTymNewsParam();
}