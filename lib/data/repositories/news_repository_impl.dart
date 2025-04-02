import 'package:flutter_clean_architecture/domain/entities/news.dart';
import 'package:injectable/injectable.dart';
import '../../domain/repositories/news_repository.dart';

@Injectable(as: NewsRepository)
class NewsRepositoryImpl extends NewsRepository {
  NewsRepositoryImpl();

  static final List<NewsItem> _newsItems = [
    NewsItem(
      title: 'Ukraine\'s President Zelensky to BBC: Blood money being paid...',
      source: 'BBC News',
      timeAgo: '14m ago',
      imageUrl: 'assets/images/news_image.png',
      category: 'Europe',
      author: 'assets/images/bbc.png',
    ),
    NewsItem(
      title: 'Ukraine\'s President Zelensky to BBC: Blood money being paid...',
      source: 'BBC News',
      timeAgo: '14m ago',
      imageUrl: 'assets/images/news_image.png',
      category: 'Europe',
      author: 'assets/images/bbc.png',
    ),
    NewsItem(
      title: 'Ukraine\'s President Zelensky to BBC: Blood money being paid...',
      source: 'BBC News',
      timeAgo: '14m ago',
      imageUrl: 'assets/images/news_image.png',
      category: 'Europe',
      author: 'assets/images/bbc.png',
    ),
    NewsItem(
      title: 'Her train broke down. Her phone died. And then she met her..',
      source: 'CNN',
      timeAgo: '1h ago',
      imageUrl: 'assets/images/news_image.png',
      category: 'Travel',
      author: 'assets/images/bbc.png',
    ),
    NewsItem(
      title: 'Russian warship: Moskva sinks in Black Sea',
      source: 'BBC News',
      timeAgo: '4h ago',
      imageUrl: 'assets/images/news_image.png',
      category: 'Europe',
      author: 'assets/images/bbc.png',
    ),
    NewsItem(
      title: 'Wind power produced more electricity than coal and nucle...',
      source: 'USA Today',
      timeAgo: '4h ago',
      imageUrl: 'assets/images/news_image.png',
      category: 'Money',
      author: 'assets/images/bbc.png',
    ),
    NewsItem(
      title: '\'We keep rising to new challenges:\' For churches hit by',
      source: 'USA Today',
      timeAgo: '4h ago',
      imageUrl: 'assets/images/news_image.png',
      category: 'Life',
      author: 'assets/images/bbc.png',
    ),
  ];
  List<NewsItem> get newsItems => _newsItems;
}
