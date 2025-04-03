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
      "https://bernardmarr.com/wp-content/uploads/2022/04/The-10-Biggest-Technology-Trends-That-Will-Transform-The-Next-Decade.jpg",
      "Tech",
      "Tin tức công nghệ cập nhật các xu hướng mới nhất, sản phẩm đột phá và những biến động trong thị trường công nghệ toàn cầu.",
      true,
    ),
    Topic(
      "https://plus.unsplash.com/premium_photo-1681487769650-a0c3fbaed85a?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8ZmluYW5jZXxlbnwwfHwwfHx8MA%3D%3D",
      "Finance",
      "Tin tức tài chính cập nhật tình hình thị trường chứng khoán, biến động tiền tệ và các chính sách kinh tế ảnh hưởng đến đầu tư.",
      true,
    ),
    Topic(
      "https://plus.unsplash.com/premium_photo-1682125773446-259ce64f9dd7?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8ZWR1Y2F0aW9ufGVufDB8fDB8fHww",
      "Education",
      "Tin tức giáo dục cập nhật các cải cách trong hệ thống học đường, phương pháp giảng dạy mới và thành tựu học thuật đáng chú ý.",
      false,
    ),
    Topic(
      "https://plus.unsplash.com/premium_photo-1673953509975-576678fa6710?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8aGVhbHRoY2FyZXxlbnwwfHwwfHx8MA%3D%3D",
      "Healthcare",
      "Tin tức y tế cập nhật các nghiên cứu khoa học mới, phát triển trong điều trị bệnh và chính sách chăm sóc sức khỏe toàn cầu.",
      true,
    ),
    Topic(
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR85DLe82Kt2SKZp5JH4KiGYjrOWzbkKV5ZQA&s",
      "Arts",
      "Tin tức nghệ thuật cập nhật các triển lãm, tác phẩm nổi bật và hoạt động của những nghệ sĩ đang tạo xu hướng trong ngành.",
      false,
    ),
    Topic(
      "https://media.istockphoto.com/id/1081422898/photo/pan-fried-duck.jpg?s=612x612&w=0&k=20&c=kzlrX7KJivvufQx9mLd-gMiMHR6lC2cgX009k9XO6VA=",
      "Culinary",
      "Tin tức ẩm thực cập nhật các nhà hàng mới, xu hướng dinh dưỡng và những đổi mới trong nghệ thuật nấu nướng trên toàn thế giới.",
      true,
    ),
  ];
}
