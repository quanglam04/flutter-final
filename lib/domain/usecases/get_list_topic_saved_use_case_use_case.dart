import 'package:flutter_clean_architecture/domain/repositories/topic_repository_repository.dart';
import 'package:injectable/injectable.dart';
import '../entities/topic.dart';
import 'use_case.dart';

@injectable
class GetListTopicSavedUseCase extends UseCase<void, GetListTopicSavedParam> {
  GetListTopicSavedUseCase(this._topicRepository);
  final TopicRepository _topicRepository;

  @override
  Future<List<Topic>> call({required GetListTopicSavedParam params}) async {
    return _topicRepository.getListTopicSaved();
  }
}

class GetListTopicSavedParam {
  GetListTopicSavedParam();
}
