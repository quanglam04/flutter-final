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
      "https://aten.edu.vn/wp-content/uploads/2023/07/hinh-anh-news-la-danh-tu-dem-duoc-hay-khong-dem-duoc-so-1.jpg",
      "Sport",
      "Tin tức thể thao cập nhật các giải đấu lớn, thành tích của các vận động viên và những sự kiện quan trọng.",
      true,
    ),
    Topic(
      "https://play-lh.googleusercontent.com/_ahCmEdTn8h5omlAg0jg9Y15KArlptm4qcbnyWSzGU-jM4mR1LeArqbMM7DzgZjNywO2",
      "Politics",
      "Chủ đề chính trị cung cấp thông tin về các chính sách, quan hệ quốc tế và tình hình chính trị toàn cầu.",
      true,
    ),
    Topic(
      "https://file3.qdnd.vn/data/images/0/2021/11/21/nguyenthao/fake_news.jpg?dpi=150&quality=100&w=870",
      "Entertainment",
      "Tin tức giải trí bao gồm phim ảnh, âm nhạc, người nổi tiếng và các sự kiện văn hóa.",
      false,
    ),
    Topic(
      "https://file3.qdnd.vn/data/images/0/2021/11/21/nguyenthao/fake_news.jpg?dpi=150&quality=100&w=870",
      "Business",
      "Cập nhật tin tức kinh tế, xu hướng thị trường và các cơ hội đầu tư hấp dẫn trên thế giới.",
      true,
    ),
    Topic(
      "https://aten.edu.vn/wp-content/uploads/2023/07/hinh-anh-news-la-danh-tu-dem-duoc-hay-khong-dem-duoc-so-1.jpg",
      "Food",
      "Khám phá ẩm thực, các công thức nấu ăn và xu hướng ẩm thực trên thế giới.",
      false,
    ),
    Topic(
      "https://aten.edu.vn/wp-content/uploads/2023/07/hinh-anh-news-la-danh-tu-dem-duoc-hay-khong-dem-duoc-so-1.jpg",
      "Health",
      "Tin tức y tế và sức khỏe, bao gồm các nghiên cứu mới, mẹo chăm sóc bản thân và dịch bệnh toàn cầu.",
      true,
    ),
    Topic(
      "https://play-lh.googleusercontent.com/_ahCmEdTn8h5omlAg0jg9Y15KArlptm4qcbnyWSzGU-jM4mR1LeArqbMM7DzgZjNywO2",
      "Travel",
      "Khám phá các địa điểm du lịch mới, kinh nghiệm du lịch và xu hướng di chuyển mới nhất.",
      true,
    ),
    Topic(
      "https://play-lh.googleusercontent.com/_ahCmEdTn8h5omlAg0jg9Y15KArlptm4qcbnyWSzGU-jM4mR1LeArqbMM7DzgZjNywO2",
      "Technology",
      "Tin tức công nghệ về AI, blockchain, smartphone và các phát minh kỹ thuật số hiện đại.",
      false,
    ),
    Topic(
      "https://file3.qdnd.vn/data/images/0/2021/11/21/nguyenthao/fake_news.jpg?dpi=150&quality=100&w=870",
      "Science",
      "Cập nhật những tiến bộ khoa học mới nhất, khám phá vũ trụ và các nghiên cứu tiên tiến.",
      true,
    ),
    Topic(
      "https://aten.edu.vn/wp-content/uploads/2023/07/hinh-anh-news-la-danh-tu-dem-duoc-hay-khong-dem-duoc-so-1.jpg",
      "Fashion",
      "Tin tức thời trang với các xu hướng mới nhất, phong cách thiết kế và sự kiện thời trang nổi bật.",
      true,
    ),
  ];
}
