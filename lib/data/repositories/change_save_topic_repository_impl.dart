import 'package:injectable/injectable.dart';
import '../../domain/repositories/change_save_topic_repository.dart';

@Injectable(as: ChangeSaveTopicRepository)
class ChangeSaveTopicRepositoryImpl extends ChangeSaveTopicRepository {
  ChangeSaveTopicRepositoryImpl();
}