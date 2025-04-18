import 'package:json_annotation/json_annotation.dart';
part 'news.g.dart';

@JsonSerializable()
class NewsItem {
  final String id;
  final String title;
  final String source;
  final String timeAgo;
  final String imageUrl;
  final String category;
  final String topic;
  final String author;
  final String description;
  final int numberOfTym;
  final int numberOfComment;

  NewsItem({
    required this.id,
    required this.topic,
    required this.title,
    required this.source,
    required this.timeAgo,
    required this.imageUrl,
    required this.category,
    required this.author,
    required this.description,
    required this.numberOfComment,
    required this.numberOfTym,
  });

  @override
  String toString() {
    return 'NewsItem{title: $title, source: $source, time: $timeAgo, imageUrl: $imageUrl, categories: $category}';
  }

  copyWith({required int numberOfTym}) {}
}
