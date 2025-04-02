import 'package:json_annotation/json_annotation.dart';

part 'topic.g.dart';

@JsonSerializable()
class Topic {
  final String imagePath;
  final String topicName;
  final String description;
  bool isSaved;

  Topic(this.imagePath, this.topicName, this.description, this.isSaved);
}
