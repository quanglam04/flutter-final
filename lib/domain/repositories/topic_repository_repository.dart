import '../entities/topic.dart';

abstract class TopicRepository {
  Future<List<Topic>> getListTopic(String key);
  Future<List<Topic>> getListTopicSaved();
  Future<bool> changeSaveTopic(String topicName);
}
