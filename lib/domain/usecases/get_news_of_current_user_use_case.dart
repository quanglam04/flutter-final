import 'package:flutter_clean_architecture/domain/entities/news.dart';
import 'package:flutter_clean_architecture/domain/repositories/news_repository.dart';
import 'package:injectable/injectable.dart';

import 'use_case.dart';

@injectable
class GetNewsOfCurrentUserUseCase
    extends UseCase<void, GetNewsOfCurrentUserParam> {
  GetNewsOfCurrentUserUseCase(this._newsRepository);
  final NewsRepository _newsRepository;

  @override
  Future<List<NewsItem>> call({
    required GetNewsOfCurrentUserParam params,
  }) async {
    return _newsRepository.getNewsOfCurrentUser();
  }
}

class GetNewsOfCurrentUserParam {
  GetNewsOfCurrentUserParam();
}
