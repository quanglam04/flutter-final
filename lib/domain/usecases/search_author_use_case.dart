import 'package:flutter_clean_architecture/domain/entities/author.dart';
import 'package:flutter_clean_architecture/domain/repositories/authors_repository.dart';
import 'package:injectable/injectable.dart';

import 'use_case.dart';

@injectable
class SearchAuthorUseCase extends UseCase<void, SearchAuthorParam> {
  final AuthorsRepository _authorsRepository;

  SearchAuthorUseCase(this._authorsRepository);

  @override
  Future<List<Author>> call({required SearchAuthorParam params}) async {
    return _authorsRepository.getListAuthors(params.key);
  }
}

class SearchAuthorParam {
  SearchAuthorParam(this.key);
  final String key;
}
