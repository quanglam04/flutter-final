import 'package:flutter_clean_architecture/domain/repositories/news_repository.dart';
import 'package:injectable/injectable.dart';
import '../entities/news.dart';
import 'use_case.dart';

@injectable
class GetListNewsByTopicUseCase extends UseCase<void, GetListNewsByTopicParam> {
  GetListNewsByTopicUseCase(this._newsRepository);

  final NewsRepository _newsRepository;

  @override
  Future<List<NewsItem>> call({required GetListNewsByTopicParam params}) async {
    return _newsRepository.getListNewByTopic(topic: params.topic);
  }
}

class GetListNewsByTopicParam {
  GetListNewsByTopicParam(this.topic);
  final String? topic;
}
