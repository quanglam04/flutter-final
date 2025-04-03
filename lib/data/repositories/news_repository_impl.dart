import 'package:flutter_clean_architecture/domain/entities/news.dart';
import 'package:flutter_clean_architecture/shared/utils/logger.dart';
import 'package:injectable/injectable.dart';
import '../../domain/repositories/news_repository.dart';

@Injectable(as: NewsRepository)
class NewsRepositoryImpl implements NewsRepository {
  NewsRepositoryImpl();
  @override
  Future<List<NewsItem>> getListNewByTopic({topic}) async {
    if (topic == '')
      return _listNews;
    else {
      return _listNews.where((news) => news.topic == topic).toList();
    }
  }

  @override
  Future<List<NewsItem>> searchNewByTopic({required key}) async {
    List<NewsItem> searchResult =
        _listNews
            .where(
              (news) =>
                  news.topic.trim().toLowerCase().contains(
                    key.trim().toLowerCase(),
                  ) ||
                  news.title.trim().toLowerCase().contains(
                    key.trim().toLowerCase(),
                  ),
            )
            .toList();
    if (key.trim() == '') {
      logger.d("Không truyền key");
      return _listNews;
    }
    return searchResult;
  }

  static final List<NewsItem> _listNews = [
    NewsItem(
      title: 'Ukraine\'s President Zelensky to BBC: Blood money being paid...',
      source: 'BBC News',
      timeAgo: '14m ago',
      imageUrl: 'assets/images/news_image.png',
      category: 'Europe',
      topic: 'Sport',
      author: 'assets/images/bbc.png',
    ),
    NewsItem(
      title: 'Ukraine\'s President Zelensky to BBC: Blood money being paid...',
      source: 'BBC News',
      timeAgo: '14m ago',
      imageUrl: 'assets/images/news_image.png',
      category: 'Europe',
      topic: 'Sport',
      author: 'assets/images/bbc.png',
    ),
    NewsItem(
      title: 'Ukraine\'s President Zelensky to BBC: Blood money being paid...',
      source: 'BBC News',
      timeAgo: '14m ago',
      imageUrl: 'assets/images/news_image.png',
      category: 'Europe',
      topic: 'Sport',
      author: 'assets/images/bbc.png',
    ),
    NewsItem(
      title: 'Her train broke down. Her phone died. And then she met her..',
      source: 'CNN',
      timeAgo: '1h ago',
      imageUrl: 'assets/images/news_image.png',
      category: 'Travel',
      topic: 'Business',
      author: 'assets/images/bbc.png',
    ),
    NewsItem(
      title: 'Russian warship: Moskva sinks in Black Sea',
      source: 'BBC News',
      timeAgo: '4h ago',
      imageUrl: 'assets/images/news_image.png',
      category: 'Europe',
      topic: 'Business',
      author: 'assets/images/bbc.png',
    ),
    NewsItem(
      title: 'Wind power produced more electricity than coal and nucle...',
      source: 'USA Today',
      timeAgo: '4h ago',
      imageUrl: 'assets/images/news_image.png',
      category: 'Money',
      topic: 'Travel',
      author: 'assets/images/bbc.png',
    ),
    NewsItem(
      title: '\'We keep rising to new challenges:\' For churches hit by',
      source: 'USA Today',
      timeAgo: '4h ago',
      imageUrl: 'assets/images/news_image.png',
      category: 'Life',
      topic: 'Travel',
      author: 'assets/images/bbc.png',
    ),
  ];
  List<NewsItem> get newsItems => _listNews;
}
