import 'package:flutter_clean_architecture/domain/entities/topic.dart';
import 'package:injectable/injectable.dart';

import '../../domain/repositories/topic_repository_repository.dart';

@Injectable(as: TopicRepository)
class TopicRepositoryImpl implements TopicRepository {
  @override
  Future<List<Topic>> getListTopic(String key) async {
    List<Topic> filteredTopics =
        _topics
            .where(
              (topic) => topic.topicName.trim().toLowerCase().contains(
                key.trim().toLowerCase(),
              ),
            )
            .toList();
    if (key.trim() == '') {
      return _topics;
    }
    return filteredTopics;
  }

  @override
  Future<bool> changeSaveTopic(String topicName) async {
    Topic topic = _topics.firstWhere((topic) => topic.topicName == topicName);
    topic.isSaved = !topic.isSaved;
    return true;
  }

  @override
  Future<List<Topic>> getListTopicSaved() async {
    List<Topic> filteredTopics =
        _topics.where((topic) => topic.isSaved).toList();
    return filteredTopics;
  }

  static final List<Topic> _topics = [
    Topic(
      'https://bernardmarr.com/wp-content/uploads/2022/04/The-10-Biggest-Technology-Trends-That-Will-Transform-The-Next-Decade.jpg',
      'Sport',
      'Tin tức thể thao cập nhật kết quả thi đấu, chuyển nhượng cầu thủ và phân tích chiến thuật từ các giải đấu hàng đầu thế giới.',
      true,
    ),
    Topic(
      'https://plus.unsplash.com/premium_photo-1681487769650-a0c3fbaed85a?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8ZmluYW5jZXxlbnwwfHwwfHx8MA%3D%3D',
      'Politics',
      'Tin tức chính trị cập nhật các chính sách mới, cuộc bầu cử và các quyết định quan trọng của chính phủ ảnh hưởng đến đời sống xã hội.',
      true,
    ),
    Topic(
      'https://file3.qdnd.vn/data/images/0/2021/11/21/nguyenthao/fake_news.jpg?dpi=150&quality=100&w=870',
      'Entertainment',
      'Tin tức giải trí bao gồm phim ảnh, âm nhạc, người nổi tiếng và các sự kiện văn hóa.',
      false,
    ),
    Topic(
      'https://plus.unsplash.com/premium_photo-1682125773446-259ce64f9dd7?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8ZWR1Y2F0aW9ufGVufDB8fDB8fHww',
      'Bussiness',
      'Tin tức kinh doanh cập nhật thông tin về các công ty lớn, chiến lược phát triển và những thương vụ đầu tư đáng chú ý trên thị trường.',
      false,
    ),
    Topic(
      'https://aten.edu.vn/wp-content/uploads/2023/07/hinh-anh-news-la-danh-tu-dem-duoc-hay-khong-dem-duoc-so-1.jpg',
      'Food',
      'Khám phá ẩm thực, các công thức nấu ăn và xu hướng ẩm thực trên thế giới.',
      false,
    ),
    Topic(
      'https://plus.unsplash.com/premium_photo-1673953509975-576678fa6710?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8aGVhbHRoY2FyZXxlbnwwfHwwfHx8MA%3D%3D',
      'Health',
      'Tin tức y tế cập nhật các nghiên cứu khoa học mới, phát triển trong điều trị bệnh và chính sách chăm sóc sức khỏe toàn cầu.',
      true,
    ),
    Topic(
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR85DLe82Kt2SKZp5JH4KiGYjrOWzbkKV5ZQA&s',
      'Travel',
      'Tin tức du lịch giới thiệu điểm đến nổi tiếng, ẩm thực địa phương và những lời khuyên hữu ích cho các chuyến phiêu lưu mới.',
      false,
    ),
    Topic(
      'https://play-lh.googleusercontent.com/_ahCmEdTn8h5omlAg0jg9Y15KArlptm4qcbnyWSzGU-jM4mR1LeArqbMM7DzgZjNywO2',
      'Technology',
      'Tin tức công nghệ về AI, blockchain, smartphone và các phát minh kỹ thuật số hiện đại.',
      false,
    ),
    Topic(
      'https://file3.qdnd.vn/data/images/0/2021/11/21/nguyenthao/fake_news.jpg?dpi=150&quality=100&w=870',
      'Science',
      'Cập nhật những tiến bộ khoa học mới nhất, khám phá vũ trụ và các nghiên cứu tiên tiến.',
      true,
    ),
    Topic(
      'https://aten.edu.vn/wp-content/uploads/2023/07/hinh-anh-news-la-danh-tu-dem-duoc-hay-khong-dem-duoc-so-1.jpg',
      'Fashion',
      'Tin tức thời trang với các xu hướng mới nhất, phong cách thiết kế và sự kiện thời trang nổi bật.',
      true,
    ),
  ];
}
