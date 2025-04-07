import 'package:json_annotation/json_annotation.dart';
part 'news.g.dart';

@JsonSerializable()
class NewsItem {
  final String title;
  final String source;
  final String timeAgo;
  final String imageUrl;
  final String category;
  final String topic;
  final String author;

  NewsItem({
    required this.topic,
    required this.title,
    required this.source,
    required this.timeAgo,
    required this.imageUrl,
    required this.category,
    required this.author,
  });

  @override
  String toString() {
    return 'NewsItem{title: $title, source: $source, time: $timeAgo, imageUrl: $imageUrl, categories: $category}';
  }
}
