import 'package:flutter_clean_architecture/domain/entities/topic.dart';
import 'package:flutter_clean_architecture/domain/repositories/topic_repository_repository.dart';
import 'package:injectable/injectable.dart';

import 'use_case.dart';

@injectable
class SearchTopicsUseCase extends UseCase<void, SearchTopicsParam> {
  final TopicRepository _topicRepository;
  SearchTopicsUseCase(this._topicRepository);

  @override
  Future<List<Topic>> call({required SearchTopicsParam params}) async {
    return _topicRepository.getListTopic(params.key);
  }
}

class SearchTopicsParam {
  final String key;
  SearchTopicsParam(this.key);
}
