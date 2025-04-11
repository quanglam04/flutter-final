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
      id: '1',
      title: 'Ukraine\'s President Zelensky to BBC: Blood money being paid...',
      source: 'BBC News',
      timeAgo: '14m ago',
      imageUrl: 'assets/images/news_image.png',
      category: 'Europe',
      topic: 'Sport',
      author: 'assets/images/bbc.png',
      description:
          '''In a bold statement, President Zelensky accused certain international entities of funding aggression through economic partnerships with Russia. He described these transactions as "blood money," underscoring the moral cost of ignoring war crimes. Zelensky urged world leaders to reconsider their alliances and stand on the side of justice. The president emphasized Ukraine's commitment to sovereignty and democracy. He acknowledged the sacrifices of soldiers and civilians alike. In the interview, he condemned the delay in military aid and humanitarian assistance. He also called for increased sanctions and diplomatic pressure. Zelensky believes this war is not only about territory but about values. He highlighted Ukraine’s recent military gains as proof of resilience. Finally, he appealed directly to the public, urging solidarity in the fight against tyranny.

Zelensky also spoke about Ukraine's role in reshaping European energy policy. He emphasized the dangers of energy dependency on autocratic regimes. According to him, this war has exposed vulnerabilities in global supply chains. He thanked countries that have begun cutting ties with Russian energy exports. The president discussed Ukraine's transition to renewable energy as part of a long-term strategy. He also encouraged investment in reconstruction efforts, especially in war-torn cities. Zelensky highlighted how citizens have banded together to keep critical infrastructure functioning. He touched on education, noting how schools are reopening even in conflict zones. His optimism lies in the unity and courage shown by Ukrainians. In his view, every battle fought is a step closer to securing peace and independence.''',
    ),
    NewsItem(
      id: '2',
      title: 'Ukraine\'s President Zelensky to BBC: Blood money being paid...',
      source: 'BBC News',
      timeAgo: '14m ago',
      imageUrl: 'assets/images/news_image.png',
      category: 'Europe',
      topic: 'Sport',
      author: 'assets/images/bbc.png',
      description:
          '''During the interview, Zelensky expressed frustration with how some countries prioritize economic benefit over human rights. He referred to energy deals with Russia as deeply unethical and harmful. The president called for stronger international solidarity. He praised nations that have consistently supported Ukraine, both diplomatically and militarily. Zelensky discussed the personal toll the war has taken on families. He reiterated Ukraine’s desire to join the European Union. Despite the chaos, he emphasized the importance of education and cultural preservation. According to him, defending Ukraine is also defending democracy worldwide. He pointed out how athletes, artists, and ordinary citizens have stepped into leadership roles. In conclusion, he said history will judge those who stayed silent.

In a separate segment, Zelensky highlighted efforts to maintain sports and cultural identity during wartime. Ukraine has continued to host local competitions and preserve national sports programs. The president mentioned how sport helps unite the people and boost morale. He thanked international athletes who have spoken out in support of Ukraine. Zelensky also acknowledged the role of Ukrainian athletes who have become symbols of resistance. He noted that many sports facilities have been repurposed as shelters or aid centers. Yet even in adversity, the spirit of competition and teamwork endures. He called this “the soul of Ukraine.” The interview ended with a message of hope, courage, and commitment to victory.''',
    ),
    NewsItem(
      id: '3',
      title: 'Ukraine\'s President Zelensky to BBC: Blood money being paid...',
      source: 'BBC News',
      timeAgo: '14m ago',
      imageUrl: 'assets/images/news_image.png',
      category: 'Europe',
      topic: 'Sport',
      author: 'assets/images/bbc.png',
      description:
          '''President Zelensky did not hold back in his criticism of countries profiting off Russia’s energy exports. He insisted that moral leadership is more important than cheap resources. The interview shed light on Ukraine's efforts to survive both militarily and economically. Zelensky condemned companies still doing business with Russian entities. He said these deals help fund missiles and tanks that target civilians. The president shared stories of frontline soldiers surviving against the odds. He believes the international community must act, not just observe. Zelensky argued that neutrality in this context is complicity. He expressed gratitude toward grassroots movements worldwide supporting Ukraine. The interview concluded with a plea for justice.

Zelensky also revealed the psychological strategies Ukraine is using to keep morale high. These include public recognition of heroes and community resilience programs. Sports have become a vital outlet for citizens, especially youth. He mentioned that national athletes are representing more than just skill — they symbolize resistance. The president shared plans to rebuild destroyed stadiums and reopen gyms across cities. He sees sports as a critical part of national healing. Many Ukrainian athletes have returned from abroad to contribute. Zelensky encouraged global sports organizations to keep sanctions on Russia. He concluded by saying, “Strength on the field reflects strength in spirit.”''',
    ),
    NewsItem(
      id: '4',
      title: 'Her train broke down. Her phone died. And then she met her..',
      source: 'CNN',
      timeAgo: '1h ago',
      imageUrl: 'assets/images/news_image.png',
      category: 'Travel',
      topic: 'Business',
      author: 'assets/images/bbc.png',
      description:
          '''It was supposed to be an ordinary commute, but fate had other plans. When her train stalled outside a quiet station, Maria assumed it was a temporary glitch. But minutes turned into hours, and to make matters worse, her phone battery gave up. With no way to contact anyone, she sat alone in the cold carriage. Just as she began to worry, a fellow passenger approached and offered her a charger. That small gesture turned into a conversation that lasted the rest of the journey. As it turns out, they were both attending the same business summit in the city. The train delay had brought two like-minded professionals together. Over the next few days, they shared stories, ideas, and laughter. A chance meeting on a broken train transformed into a lasting business connection.

The experience left Maria reflecting on the unpredictability of travel — and life. She recalled how being unplugged gave her the chance to be truly present. In today’s fast-paced business world, moments of connection like this are rare. They later collaborated on a joint startup idea focused on sustainable transport. The two kept in touch even after the summit ended. What began as a delay turned into a defining moment in her career. Now, Maria speaks at events about human connection in the digital age. She reminds audiences that even travel mishaps can hold hidden opportunities. Their story is proof that business partnerships can come from the most unexpected places. And sometimes, missed trains lead to the right destinations.''',
    ),
    NewsItem(
      id: '5',
      title: 'Russian warship: Moskva sinks in Black Sea',
      source: 'BBC News',
      timeAgo: '4h ago',
      imageUrl: 'assets/images/news_image.png',
      category: 'Europe',
      topic: 'Business',
      author: 'assets/images/bbc.png',
      description:
          '''The Moskva, Russia’s flagship warship in the Black Sea, has sunk under controversial circumstances. Ukrainian officials claim responsibility through a targeted missile strike. Meanwhile, Russian authorities attribute the loss to an onboard fire. Regardless of the cause, the incident marks a major blow to Russian naval pride. Military analysts view this as a symbolic turning point in the conflict. The sinking has disrupted regional naval operations and raised morale in Ukraine. It also calls into question the preparedness and vulnerability of Russian forces. International reactions have been swift, with NATO closely monitoring developments. Many speculate this will escalate maritime confrontations in the coming weeks. Questions remain about the ship’s full crew and its classified equipment.

The financial implications of losing such a high-profile asset are significant. Defense contractors and military strategists are reevaluating naval deployment strategies. Stock markets saw fluctuations in defense sectors following the news. Insurance companies face complicated claims due to the unclear cause. Ukrainian defense officials celebrated the incident as a victory of innovation over force. Meanwhile, Russian state media has tried to downplay the loss. The event has sparked debate on military transparency and truth in wartime. Business analysts note increased interest in naval technologies. Some Western firms are eyeing Ukraine’s growing defense sector. The Moskva’s fate may shape future geopolitical and business strategies in the region.''',
    ),
    NewsItem(
      id: '6',
      title: 'Wind power produced more electricity than coal and nucle...',
      source: 'USA Today',
      timeAgo: '4h ago',
      imageUrl: 'assets/images/news_image.png',
      category: 'Money',
      topic: 'Travel',
      author: 'assets/images/bbc.png',
      description:
          '''For the first time in modern history, wind power has surpassed coal and nuclear as the leading source of electricity. This milestone marks a shift toward renewable energy worldwide. Experts credit favorable weather conditions and technological advances. Wind farms across Europe and the U.S. have seen record output this quarter. Environmentalists see this as a sign of hope amid climate concerns. Meanwhile, traditional energy companies are facing pressure to adapt or be left behind. The transition hasn’t been without challenges, including storage and transmission issues. But consumer demand is driving the change, with more households switching to clean energy. Policy makers are now reconsidering subsidies and long-term infrastructure plans. Wind energy is no longer an alternative — it’s becoming the norm.

The economic ripple effects of this transition are profound. Tourism in regions with wind farms has increased due to eco-friendly branding. Local economies benefit from jobs related to maintenance and construction. Some travel companies now offer green tours highlighting renewable projects. Investors are eyeing wind energy as a stable long-term bet. Airports and hotels have also begun integrating wind-powered systems. Critics warn about visual pollution and wildlife impact, but innovation continues. More startups are entering the clean-tech travel market. Governments are collaborating with private firms to fund hybrid transport solutions. Consumers are increasingly aligning travel decisions with sustainability values. In short, wind power is changing not just how we live — but also how we travel.''',
    ),
    NewsItem(
      id: '7',
      title: '\'We keep rising to new challenges:\' For churches hit by',
      source: 'USA Today',
      timeAgo: '4h ago',
      imageUrl: 'assets/images/news_image.png',
      category: 'Life',
      topic: 'Travel',
      author: 'assets/images/bbc.png',
      description:
          '''Across the nation, churches have faced challenge after challenge in recent years. From pandemic closures to natural disasters, congregations have had to adapt quickly. Many have embraced technology, offering livestreams and virtual counseling. Others turned their spaces into shelters and food banks. Pastors say these trials have strengthened their communities. In some towns, church attendance has even risen since reopening. Donations have shifted toward mission work and outreach programs. Volunteers are taking on bigger roles in organizing travel-based service missions. These experiences are transforming how faith communities operate. Despite setbacks, they continue to rise — more connected, more resilient.

In a recent initiative, some churches have begun organizing spiritual retreats centered around healing and reflection. These retreats often involve travel to natural locations, blending rest with renewal. Participants report feeling recharged and reconnected to their faith. Travel agencies specializing in faith tourism are also seeing a resurgence. Pilgrimages to historic religious sites are becoming popular again. Churches are using these trips to build stronger bonds among members. Many congregations are also exploring international volunteer work. By combining travel with service, churches are fostering a deeper sense of purpose. As one pastor put it, “Faith is not just found inside four walls — it moves, it travels, it uplifts.”''',
    ),
  ];
  List<NewsItem> get newsItems => _listNews;

  final List<NewsItem> _listNewsOfCurrentUser = [
    NewsItem(
      id: '8',
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
      id: '9',
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
      id: '10',
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
      id: '11',
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
      id: '12',
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
      id: '13',
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

  @override
  Future<NewsItem> getNewsById(String newsId) async {
    return _listNews.firstWhere((news) => news.id.trim() == newsId);
  }

  @override
  Future<bool> changeTymNews(String newsId) {
    throw UnimplementedError();
  }
}
