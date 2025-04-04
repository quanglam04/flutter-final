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
      'https://plus.unsplash.com/premium_photo-1682125773446-259ce64f9dd7?fm=jpg&q=60&w=3000&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MXx8ZWR1Y2F0aW9ufGVufDB8fDB8fHww',
      'Bussiness',
      'Tin tức kinh doanh cập nhật thông tin về các công ty lớn, chiến lược phát triển và những thương vụ đầu tư đáng chú ý trên thị trường.',
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
      'https://media.istockphoto.com/id/1081422898/photo/pan-fried-duck.jpg?s=612x612&w=0&k=20&c=kzlrX7KJivvufQx9mLd-gMiMHR6lC2cgX009k9XO6VA=',
      'Culinary',
      'Tin tức ẩm thực cập nhật các nhà hàng mới, xu hướng dinh dưỡng và những đổi mới trong nghệ thuật nấu nướng trên toàn thế giới.',
      true,
    ),
    Topic(
      'https://media.istockphoto.com/id/1081422898/photo/pan-fried-duck.jpg?s=612x612&w=0&k=20&c=kzlrX7KJivvufQx9mLd-gMiMHR6lC2cgX009k9XO6VA=',
      'Science',
      'Tin tức khoa học cập nhật các khám phá mới, nghiên cứu đột phá và ứng dụng công nghệ tiên tiến trong nhiều lĩnh vực khác nhau.',
      true,
    ),
    Topic(
      'https://media.istockphoto.com/id/1081422898/photo/pan-fried-duck.jpg?s=612x612&w=0&k=20&c=kzlrX7KJivvufQx9mLd-gMiMHR6lC2cgX009k9XO6VA=',
      'Fashion',
      'Tin tức thời trang cập nhật các bộ sưu tập mới, xu hướng mùa và những thiết kế nổi bật từ các thương hiệu hàng đầu thế giới.',
      true,
    ),
  ];
}
