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
}
