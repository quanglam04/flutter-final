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
    final List<NewsItem> searchResult =
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
      description: '',
    ),
    NewsItem(
      title: 'Ukraine\'s President Zelensky to BBC: Blood money being paid...',
      source: 'BBC News',
      timeAgo: '14m ago',
      imageUrl: 'assets/images/news_image.png',
      category: 'Europe',
      topic: 'Sport',
      author: 'assets/images/bbc.png',
      description: '',
    ),
    NewsItem(
      title: 'Ukraine\'s President Zelensky to BBC: Blood money being paid...',
      source: 'BBC News',
      timeAgo: '14m ago',
      imageUrl: 'assets/images/news_image.png',
      category: 'Europe',
      topic: 'Sport',
      author: 'assets/images/bbc.png',
      description: '',
    ),
    NewsItem(
      title: 'Her train broke down. Her phone died. And then she met her..',
      source: 'CNN',
      timeAgo: '1h ago',
      imageUrl: 'assets/images/news_image.png',
      category: 'Travel',
      topic: 'Business',
      author: 'assets/images/bbc.png',
      description: '',
    ),
    NewsItem(
      title: 'Russian warship: Moskva sinks in Black Sea',
      source: 'BBC News',
      timeAgo: '4h ago',
      imageUrl: 'assets/images/news_image.png',
      category: 'Europe',
      topic: 'Business',
      author: 'assets/images/bbc.png',
      description: '',
    ),
    NewsItem(
      title: 'Wind power produced more electricity than coal and nucle...',
      source: 'USA Today',
      timeAgo: '4h ago',
      imageUrl: 'assets/images/news_image.png',
      category: 'Money',
      topic: 'Travel',
      author: 'assets/images/bbc.png',
      description: '',
    ),
    NewsItem(
      title: '\'We keep rising to new challenges:\' For churches hit by',
      source: 'USA Today',
      timeAgo: '4h ago',
      imageUrl: 'assets/images/news_image.png',
      category: 'Life',
      topic: 'Travel',
      author: 'assets/images/bbc.png',
      description: '',
    ),
  ];
  List<NewsItem> get newsItems => _listNews;

  final List<NewsItem> _listNewsOfCurrentUser = [
    NewsItem(
      title: '5 xu hướng công nghệ AI mới nhất năm 2025',
      source: 'Tech News VN',
      timeAgo: '2h ago',
      imageUrl: 'assets/images/avt.jpg',
      category: 'Công nghệ',
      topic: 'Trí tuệ nhân tạo',
      author: 'assets/images/author.png',
      description:
          'Các xu hướng AI mới đang thay đổi cách chúng ta tương tác với công nghệ. Bài viết phân tích 5 xu hướng AI quan trọng nhất năm 2025 đang định hình tương lai.',
    ),

    NewsItem(
      title: 'Tình hình thị trường chứng khoán quý 2/2025',
      source: 'Tài chính Online',
      timeAgo: '5h ago',
      imageUrl: 'assets/images/avt.jpg',
      category: 'Tài chính',
      topic: 'Chứng khoán',
      author: 'assets/images/author.png',
      description:
          'Phân tích chi tiết về biến động thị trường chứng khoán trong quý 2 năm 2025, với các dự báo và khuyến nghị đầu tư cho các nhà đầu tư.',
    ),

    NewsItem(
      title: 'Top 10 điểm du lịch hấp dẫn nhất Việt Nam hè 2025',
      source: 'Du lịch & Khám phá',
      timeAgo: '1d ago',
      imageUrl: 'assets/images/avt.jpg',
      category: 'Du lịch',
      topic: 'Địa điểm nổi bật',
      author: 'assets/images/author.png',
      description:
          'Khám phá những điểm đến tuyệt vời nhất Việt Nam trong mùa hè này. Từ bãi biển đẹp nhất đến những điểm tham quan văn hóa không thể bỏ qua.',
    ),

    NewsItem(
      title: 'Xu hướng thời trang bền vững năm 2025',
      source: 'Fashion Daily',
      timeAgo: '3h ago',
      imageUrl: 'assets/images/avt.jpg',
      category: 'Thời trang',
      topic: 'Thời trang bền vững',
      author: 'assets/images/author.png',
      description:
          'Các thương hiệu thời trang đang chuyển hướng mạnh mẽ sang xu hướng bền vững. Bài viết giới thiệu các xu hướng thời trang thân thiện với môi trường đang được ưa chuộng.',
    ),

    NewsItem(
      title: 'Chi tiết về chiếc điện thoại gập mới nhất của Samsung',
      source: 'Gadget Review',
      timeAgo: '12h ago',
      imageUrl: 'assets/images/avt.jpg',
      category: 'Công nghệ',
      topic: 'Điện thoại',
      author: 'assets/images/author.png',
      description:
          'Samsung vừa ra mắt chiếc điện thoại gập thế hệ mới với nhiều cải tiến đột phá. Bài viết đánh giá chi tiết các tính năng, thiết kế và hiệu năng của sản phẩm này.',
    ),

    NewsItem(
      title: 'Các phương pháp học trực tuyến hiệu quả năm 2025',
      source: 'Education Today',
      timeAgo: '2d ago',
      imageUrl: 'assets/images/avt.jpg',
      category: 'Giáo dục',
      topic: 'Học trực tuyến',
      author: 'assets/images/author.png',
      description:
          'Với sự phát triển của công nghệ, các phương pháp học trực tuyến ngày càng đa dạng và hiệu quả. Bài viết giới thiệu các công cụ và phương pháp học trực tuyến tốt nhất hiện nay.',
    ),
  ];

  @override
  Future<List<NewsItem>> getNewsOfCurrentUser() async {
    return _listNewsOfCurrentUser;
  }
}
