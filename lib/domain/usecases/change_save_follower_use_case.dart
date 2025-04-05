import 'package:flutter_clean_architecture/domain/repositories/authors_repository.dart';
import 'package:injectable/injectable.dart';

import 'use_case.dart';

@injectable
class ChangeSaveFollowerUseCase extends UseCase<void, ChangeSaveFollowerParam> {
  ChangeSaveFollowerUseCase(this._authorsRepository);
  AuthorsRepository _authorsRepository;

  @override
  Future<bool> call({required ChangeSaveFollowerParam params}) async {
    return _authorsRepository.changeFollowAuthor(params.authorName);
  }
}

class ChangeSaveFollowerParam {
  ChangeSaveFollowerParam(this.authorName);
  String authorName;
}
