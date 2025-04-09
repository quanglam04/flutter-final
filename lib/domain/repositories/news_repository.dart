import '../entities/news.dart';

abstract interface class NewsRepository {
  Future<List<NewsItem>> getListNewByTopic({topic});
  Future<List<NewsItem>> searchNewByTopic({required key});
  Future<List<NewsItem>> getNewsOfCurrentUser();
}
