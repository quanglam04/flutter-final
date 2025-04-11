import 'package:flutter_clean_architecture/domain/entities/news.dart';
import 'package:flutter_clean_architecture/domain/repositories/news_repository.dart';
import 'package:injectable/injectable.dart';

import 'use_case.dart';

@injectable
class GetNewsByIdUseCase extends UseCase<void, GetNewsByIdParam> {
  final NewsRepository _newsRepository;
  GetNewsByIdUseCase(this._newsRepository);

  @override
  Future<NewsItem> call({required GetNewsByIdParam params}) async {
    return _newsRepository.getNewsById(params.id);
  }
}

class GetNewsByIdParam {
  GetNewsByIdParam(this.id);
  final String id;
}
