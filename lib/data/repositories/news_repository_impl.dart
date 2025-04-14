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
      imageUrl: 'assets/images/ukraine_1.jpg',
      category: 'Europe',
      topic: 'Sport',
      author: 'assets/images/bbc.png',
      description:
          '''In a bold statement, President Zelensky accused certain international entities of funding aggression through economic partnerships with Russia. He described these transactions as "blood money," underscoring the moral cost of ignoring war crimes. Zelensky urged world leaders to reconsider their alliances and stand on the side of justice. The president emphasized Ukraine's commitment to sovereignty and democracy. He acknowledged the sacrifices of soldiers and civilians alike. In the interview, he condemned the delay in military aid and humanitarian assistance. He also called for increased sanctions and diplomatic pressure. Zelensky believes this war is not only about territory but about values. He highlighted Ukraine’s recent military gains as proof of resilience. Finally, he appealed directly to the public, urging solidarity in the fight against tyranny.

Zelensky also spoke about Ukraine's role in reshaping European energy policy. He emphasized the dangers of energy dependency on autocratic regimes. According to him, this war has exposed vulnerabilities in global supply chains. He thanked countries that have begun cutting ties with Russian energy exports. The president discussed Ukraine's transition to renewable energy as part of a long-term strategy. He also encouraged investment in reconstruction efforts, especially in war-torn cities. Zelensky highlighted how citizens have banded together to keep critical infrastructure functioning. He touched on education, noting how schools are reopening even in conflict zones. His optimism lies in the unity and courage shown by Ukrainians. In his view, every battle fought is a step closer to securing peace and independence.''',
      numberOfTym: 23,
      numberOfComment: 19,
    ),
    NewsItem(
      id: '2',
      title: 'Ukraine\'s President Zelensky to BBC: Blood money being paid...',
      source: 'BBC News',
      timeAgo: '14m ago',
      imageUrl: 'assets/images/ukraine_2.jpg',
      category: 'Europe',
      topic: 'Sport',
      author: 'assets/images/bbc.png',
      description:
          '''During the interview, Zelensky expressed frustration with how some countries prioritize economic benefit over human rights. He referred to energy deals with Russia as deeply unethical and harmful. The president called for stronger international solidarity. He praised nations that have consistently supported Ukraine, both diplomatically and militarily. Zelensky discussed the personal toll the war has taken on families. He reiterated Ukraine’s desire to join the European Union. Despite the chaos, he emphasized the importance of education and cultural preservation. According to him, defending Ukraine is also defending democracy worldwide. He pointed out how athletes, artists, and ordinary citizens have stepped into leadership roles. In conclusion, he said history will judge those who stayed silent.

In a separate segment, Zelensky highlighted efforts to maintain sports and cultural identity during wartime. Ukraine has continued to host local competitions and preserve national sports programs. The president mentioned how sport helps unite the people and boost morale. He thanked international athletes who have spoken out in support of Ukraine. Zelensky also acknowledged the role of Ukrainian athletes who have become symbols of resistance. He noted that many sports facilities have been repurposed as shelters or aid centers. Yet even in adversity, the spirit of competition and teamwork endures. He called this “the soul of Ukraine.” The interview ended with a message of hope, courage, and commitment to victory.''',
      numberOfComment: 27,
      numberOfTym: 34,
    ),
    NewsItem(
      id: '3',
      title: 'Ukraine\'s President Zelensky to BBC: Blood money being paid...',
      source: 'BBC News',
      timeAgo: '14m ago',
      imageUrl: 'assets/images/ukraine_3.jpg',
      category: 'Europe',
      topic: 'Sport',
      author: 'assets/images/bbc.png',
      description:
          '''President Zelensky did not hold back in his criticism of countries profiting off Russia’s energy exports. He insisted that moral leadership is more important than cheap resources. The interview shed light on Ukraine's efforts to survive both militarily and economically. Zelensky condemned companies still doing business with Russian entities. He said these deals help fund missiles and tanks that target civilians. The president shared stories of frontline soldiers surviving against the odds. He believes the international community must act, not just observe. Zelensky argued that neutrality in this context is complicity. He expressed gratitude toward grassroots movements worldwide supporting Ukraine. The interview concluded with a plea for justice.

Zelensky also revealed the psychological strategies Ukraine is using to keep morale high. These include public recognition of heroes and community resilience programs. Sports have become a vital outlet for citizens, especially youth. He mentioned that national athletes are representing more than just skill — they symbolize resistance. The president shared plans to rebuild destroyed stadiums and reopen gyms across cities. He sees sports as a critical part of national healing. Many Ukrainian athletes have returned from abroad to contribute. Zelensky encouraged global sports organizations to keep sanctions on Russia. He concluded by saying, “Strength on the field reflects strength in spirit.”''',
      numberOfComment: 65,
      numberOfTym: 14,
    ),
    NewsItem(
      id: '4',
      title: 'Her train broke down. Her phone died. And then she met her..',
      source: 'CNN',
      timeAgo: '1h ago',
      imageUrl: 'assets/images/tech.jpg',
      category: 'Travel',
      topic: 'Business',
      author: 'assets/images/bbc.png',
      description:
          '''It was supposed to be an ordinary commute, but fate had other plans. When her train stalled outside a quiet station, Maria assumed it was a temporary glitch. But minutes turned into hours, and to make matters worse, her phone battery gave up. With no way to contact anyone, she sat alone in the cold carriage. Just as she began to worry, a fellow passenger approached and offered her a charger. That small gesture turned into a conversation that lasted the rest of the journey. As it turns out, they were both attending the same business summit in the city. The train delay had brought two like-minded professionals together. Over the next few days, they shared stories, ideas, and laughter. A chance meeting on a broken train transformed into a lasting business connection.

The experience left Maria reflecting on the unpredictability of travel — and life. She recalled how being unplugged gave her the chance to be truly present. In today’s fast-paced business world, moments of connection like this are rare. They later collaborated on a joint startup idea focused on sustainable transport. The two kept in touch even after the summit ended. What began as a delay turned into a defining moment in her career. Now, Maria speaks at events about human connection in the digital age. She reminds audiences that even travel mishaps can hold hidden opportunities. Their story is proof that business partnerships can come from the most unexpected places. And sometimes, missed trains lead to the right destinations.''',
      numberOfComment: 12,
      numberOfTym: 54,
    ),
    NewsItem(
      id: '5',
      title: 'Russian warship: Moskva sinks in Black Sea',
      source: 'BBC News',
      timeAgo: '4h ago',
      imageUrl: 'assets/images/rusia.jpg',
      category: 'Europe',
      topic: 'Business',
      author: 'assets/images/bbc.png',
      description:
          '''The Moskva, Russia’s flagship warship in the Black Sea, has sunk under controversial circumstances. Ukrainian officials claim responsibility through a targeted missile strike. Meanwhile, Russian authorities attribute the loss to an onboard fire. Regardless of the cause, the incident marks a major blow to Russian naval pride. Military analysts view this as a symbolic turning point in the conflict. The sinking has disrupted regional naval operations and raised morale in Ukraine. It also calls into question the preparedness and vulnerability of Russian forces. International reactions have been swift, with NATO closely monitoring developments. Many speculate this will escalate maritime confrontations in the coming weeks. Questions remain about the ship’s full crew and its classified equipment.

The financial implications of losing such a high-profile asset are significant. Defense contractors and military strategists are reevaluating naval deployment strategies. Stock markets saw fluctuations in defense sectors following the news. Insurance companies face complicated claims due to the unclear cause. Ukrainian defense officials celebrated the incident as a victory of innovation over force. Meanwhile, Russian state media has tried to downplay the loss. The event has sparked debate on military transparency and truth in wartime. Business analysts note increased interest in naval technologies. Some Western firms are eyeing Ukraine’s growing defense sector. The Moskva’s fate may shape future geopolitical and business strategies in the region.''',
      numberOfComment: 54,
      numberOfTym: 70,
    ),
    NewsItem(
      id: '6',
      title: 'Wind power produced more electricity than coal and nucle...',
      source: 'USA Today',
      timeAgo: '4h ago',
      imageUrl: 'assets/images/dulich.jpg',
      category: 'Money',
      topic: 'Travel',
      author: 'assets/images/bbc.png',
      description:
          '''For the first time in modern history, wind power has surpassed coal and nuclear as the leading source of electricity. This milestone marks a shift toward renewable energy worldwide. Experts credit favorable weather conditions and technological advances. Wind farms across Europe and the U.S. have seen record output this quarter. Environmentalists see this as a sign of hope amid climate concerns. Meanwhile, traditional energy companies are facing pressure to adapt or be left behind. The transition hasn’t been without challenges, including storage and transmission issues. But consumer demand is driving the change, with more households switching to clean energy. Policy makers are now reconsidering subsidies and long-term infrastructure plans. Wind energy is no longer an alternative — it’s becoming the norm.

The economic ripple effects of this transition are profound. Tourism in regions with wind farms has increased due to eco-friendly branding. Local economies benefit from jobs related to maintenance and construction. Some travel companies now offer green tours highlighting renewable projects. Investors are eyeing wind energy as a stable long-term bet. Airports and hotels have also begun integrating wind-powered systems. Critics warn about visual pollution and wildlife impact, but innovation continues. More startups are entering the clean-tech travel market. Governments are collaborating with private firms to fund hybrid transport solutions. Consumers are increasingly aligning travel decisions with sustainability values. In short, wind power is changing not just how we live — but also how we travel.''',
      numberOfComment: 45,
      numberOfTym: 120,
    ),
    NewsItem(
      id: '7',
      title: '\'We keep rising to new challenges:\' For churches hit by',
      source: 'USA Today',
      timeAgo: '4h ago',
      imageUrl: 'assets/images/chungkhoan.jpg',
      category: 'Life',
      topic: 'Travel',
      author: 'assets/images/bbc.png',
      description:
          '''Across the nation, churches have faced challenge after challenge in recent years. From pandemic closures to natural disasters, congregations have had to adapt quickly. Many have embraced technology, offering livestreams and virtual counseling. Others turned their spaces into shelters and food banks. Pastors say these trials have strengthened their communities. In some towns, church attendance has even risen since reopening. Donations have shifted toward mission work and outreach programs. Volunteers are taking on bigger roles in organizing travel-based service missions. These experiences are transforming how faith communities operate. Despite setbacks, they continue to rise — more connected, more resilient.

In a recent initiative, some churches have begun organizing spiritual retreats centered around healing and reflection. These retreats often involve travel to natural locations, blending rest with renewal. Participants report feeling recharged and reconnected to their faith. Travel agencies specializing in faith tourism are also seeing a resurgence. Pilgrimages to historic religious sites are becoming popular again. Churches are using these trips to build stronger bonds among members. Many congregations are also exploring international volunteer work. By combining travel with service, churches are fostering a deeper sense of purpose. As one pastor put it, “Faith is not just found inside four walls — it moves, it travels, it uplifts.”''',
      numberOfComment: 23,
      numberOfTym: 29,
    ),
  ];
  List<NewsItem> get newsItems => _listNews;

  static final List<NewsItem> _listNewsOfCurrentUser = [
    NewsItem(
      id: '8',
      title: '5 xu hướng công nghệ AI mới nhất năm 2025',
      source: 'Tech News VN',
      timeAgo: '2h ago',
      imageUrl: 'assets/images/tech.jpg',
      category: 'Công nghệ',
      topic: 'Trí tuệ nhân tạo',
      author: 'assets/images/author.png',
      description:
          'Trí tuệ nhân tạo đang ngày càng chiếm lĩnh thị trường công nghệ với những cải tiến vượt bậc. Trong năm 2025, nhiều xu hướng mới đã xuất hiện, từ AI tạo nội dung, AI tự huấn luyện đến AI đạo đức. Các công ty công nghệ lớn đang đua nhau tích hợp AI vào sản phẩm và dịch vụ. Người dùng giờ đây có thể trải nghiệm những tính năng thông minh hơn, mượt mà hơn nhờ AI. Một số nền tảng thậm chí còn sử dụng AI để dự đoán hành vi tiêu dùng. Những công nghệ như GPT-5, AI thị giác và robot tự động đang phát triển mạnh mẽ. Việc tích hợp AI vào giáo dục và y tế cũng mang lại hiệu quả rõ rệt. Tuy nhiên, đi kèm với sự phát triển là những thách thức về đạo đức và quyền riêng tư. Điều này đòi hỏi các nhà phát triển cần cẩn trọng và có chiến lược rõ ràng. Tương lai của AI phụ thuộc vào cách chúng ta kiểm soát và hướng dẫn sự phát triển này.\n\n'
          'Bài viết sẽ giúp bạn hiểu rõ hơn về năm xu hướng AI hàng đầu trong năm nay. Đầu tiên là AI sáng tạo nội dung, đang thay đổi cách doanh nghiệp tiếp cận khách hàng. Thứ hai là sự phát triển của AI hỗ trợ học tập cá nhân hóa. Tiếp đến là AI đạo đức, đặt ra tiêu chuẩn mới về minh bạch và trách nhiệm. Một xu hướng khác là việc ứng dụng AI trong giao thông thông minh và thành phố thông minh. Cuối cùng là sự bùng nổ của AI trong chăm sóc sức khỏe, với khả năng chẩn đoán chính xác và hỗ trợ điều trị. Những xu hướng này không chỉ mở ra cơ hội kinh doanh mới mà còn định hình lại toàn bộ ngành công nghệ. Người tiêu dùng và doanh nghiệp đều phải thích nghi nhanh chóng để không bị bỏ lại phía sau. Đây là thời điểm tuyệt vời để khám phá và đầu tư vào AI. Cùng theo dõi để không bỏ lỡ các cập nhật công nghệ mới nhất.',
      numberOfComment: 124,
      numberOfTym: 198,
    ),

    NewsItem(
      id: '9',
      title: 'Tình hình thị trường chứng khoán quý 2/2025',
      source: 'Tài chính Online',
      timeAgo: '5h ago',
      imageUrl: 'assets/images/chungkhoan.jpg',
      category: 'Tài chính',
      topic: 'Chứng khoán',
      author: 'assets/images/author.png',
      description:
          'Quý 2 năm 2025 đánh dấu nhiều biến động mạnh mẽ trên thị trường chứng khoán Việt Nam. Các cổ phiếu ngành công nghệ và tài chính ghi nhận mức tăng trưởng ấn tượng. Trong khi đó, nhóm ngành tiêu dùng và bất động sản gặp khó khăn do lạm phát và chính sách siết chặt tín dụng. Nhiều nhà đầu tư cá nhân rút vốn khỏi thị trường để chuyển sang các kênh đầu tư an toàn hơn. Các chuyên gia tài chính cảnh báo rằng thị trường vẫn còn nhiều rủi ro tiềm ẩn. Tuy nhiên, một số mã cổ phiếu blue-chip vẫn giữ được đà tăng trưởng ổn định. Thanh khoản thị trường cải thiện nhờ dòng vốn ngoại quay trở lại. Các quỹ đầu tư lớn đang bắt đầu giải ngân vào nhóm ngành công nghiệp và xuất khẩu. Tâm lý nhà đầu tư nhìn chung vẫn thận trọng nhưng tích cực hơn so với quý trước. Bài viết cung cấp phân tích chi tiết về từng nhóm ngành và xu hướng dòng tiền.\n\n'
          ' Bên cạnh đó, thị trường thế giới cũng ảnh hưởng không nhỏ đến diễn biến trong nước. Giá dầu, chính sách lãi suất của Mỹ, và chiến tranh thương mại giữa các nước lớn là những yếu tố cần theo dõi sát sao. Một số công ty chứng khoán dự báo thị trường có thể hồi phục nhẹ trong quý tiếp theo. Nhà đầu tư được khuyến nghị nên phân bổ danh mục hợp lý và theo dõi các chỉ báo kỹ thuật. Những cổ phiếu có nền tảng cơ bản tốt và hưởng lợi từ chính sách nhà nước nên được ưu tiên. Ngoài ra, đầu tư theo xu hướng ESG đang trở nên phổ biến trong năm nay. Chính phủ cũng đang xem xét các biện pháp kích cầu nhằm hỗ trợ doanh nghiệp niêm yết. Thị trường chứng khoán Việt Nam tuy còn nhiều thách thức, nhưng cũng chứa đựng cơ hội lớn nếu nhà đầu tư có chiến lược phù hợp. Bài viết đi sâu vào phân tích các yếu tố kỹ thuật và vĩ mô, giúp bạn có cái nhìn toàn diện hơn về thị trường.',
      numberOfComment: 23,
      numberOfTym: 70,
    ),

    NewsItem(
      id: '10',
      title: 'Top 10 điểm du lịch hấp dẫn nhất Việt Nam hè 2025',
      source: 'Du lịch & Khám phá',
      timeAgo: '1d ago',
      imageUrl: 'assets/images/dulich.jpg',
      category: 'Du lịch',
      topic: 'Địa điểm nổi bật',
      author: 'assets/images/author.png',
      description:
          'Mùa hè 2025, Việt Nam tiếp tục khẳng định vị thế là điểm đến du lịch hàng đầu Đông Nam Á. Từ những bãi biển hoang sơ ở Phú Quốc đến các ngọn núi hùng vĩ ở Hà Giang, du khách có vô vàn lựa chọn để khám phá. Nha Trang và Đà Nẵng vẫn là những điểm đến hấp dẫn nhờ dịch vụ du lịch ngày càng chuyên nghiệp. Hội An tiếp tục giữ vững danh hiệu thành phố du lịch thân thiện nhất với du khách quốc tế. Bên cạnh đó, khu du lịch sinh thái Tràng An - Ninh Bình ngày càng được nhiều gia đình lựa chọn. Một số tour trải nghiệm mới như du lịch bằng xe jeep, glamping hay du lịch chữa lành (healing tour) đang thu hút sự quan tâm lớn. Các tỉnh miền núi phía Bắc cũng ghi nhận lượng du khách tăng đột biến trong hè này. Nhiều khu nghỉ dưỡng cao cấp mở mới đã giúp nâng cao chất lượng du lịch nội địa. Ngoài ra, yếu tố ẩm thực độc đáo cũng đóng vai trò quan trọng trong việc thu hút du khách.\n\n'
          'Bài viết sẽ giới thiệu chi tiết 10 điểm đến nổi bật nhất bạn không nên bỏ lỡ. Đó là sự kết hợp giữa vẻ đẹp thiên nhiên, di sản văn hóa và dịch vụ du lịch chất lượng cao. Mỗi địa danh đều mang trong mình câu chuyện riêng, từ văn hóa bản địa đến ẩm thực đặc trưng. Với sự đầu tư mạnh mẽ từ chính phủ và doanh nghiệp, ngành du lịch đang hồi phục nhanh sau đại dịch. Các hoạt động trải nghiệm như lặn biển, dù lượn, trekking và đạp xe địa hình đang được yêu thích hơn bao giờ hết. Ngoài ra, du lịch xanh và du lịch cộng đồng cũng là những xu hướng được người trẻ lựa chọn. Với sự chuẩn bị kỹ lưỡng về cơ sở hạ tầng và truyền thông, Việt Nam đang sẵn sàng đón làn sóng khách quốc tế. Hãy chuẩn bị hành lý và sẵn sàng cho một mùa hè rực rỡ tại những điểm đến tuyệt vời này.',
      numberOfComment: 256,
      numberOfTym: 720,
    ),

    NewsItem(
      id: '11',
      title: 'Xu hướng thời trang bền vững năm 2025',
      source: 'Thời trang & Đời sống',
      timeAgo: '2d ago',
      imageUrl: 'assets/images/thoitrang.jpg',
      category: 'Thời trang',
      topic: 'Xu hướng mới',
      author: 'assets/images/author.png',
      description:
          'Thời trang bền vững không chỉ là xu hướng mà còn là cam kết của nhiều thương hiệu lớn trong năm 2025. Các nhà thiết kế tập trung vào chất liệu thân thiện với môi trường như cotton hữu cơ, vải tái chế và các vật liệu sinh học. Xu hướng này đang được đón nhận tích cực bởi người tiêu dùng trẻ yêu thích lối sống xanh. Bên cạnh đó, các chiến dịch truyền thông về ý thức bảo vệ môi trường cũng góp phần lan tỏa mạnh mẽ trào lưu thời trang bền vững. Nhiều nhãn hàng đã giảm thiểu sử dụng bao bì nhựa và chuyển sang hình thức đóng gói có thể phân hủy. Các sàn diễn thời trang quốc tế cũng chứng kiến sự xuất hiện của nhiều BST được thiết kế từ nguyên liệu tái chế. Những sản phẩm thời trang này không chỉ đẹp mắt mà còn mang giá trị nhân văn cao. Bên cạnh đó, việc thuê và tái sử dụng quần áo đang trở thành lựa chọn phổ biến. Người tiêu dùng hiện nay quan tâm hơn đến vòng đời của sản phẩm. Điều này đặt ra yêu cầu mới cho ngành thời trang: phải sáng tạo nhưng vẫn bền vững.\n\n'
          'Không chỉ giới hạn trong trang phục, thời trang bền vững còn lan rộng tới phụ kiện như túi xách, giày dép và cả trang sức. Các startup trong lĩnh vực này cũng đang phát triển mạnh với các giải pháp đổi mới sáng tạo. Nhiều thương hiệu Việt Nam đã bắt đầu tham gia vào cuộc đua này, tạo ra các sản phẩm phù hợp với khí hậu và gu thẩm mỹ nội địa. Các nền tảng thương mại điện tử cũng hỗ trợ mạnh mẽ cho các sản phẩm thân thiện với môi trường. Ngoài ra, giáo dục và tuyên truyền về thời trang có trách nhiệm đang được lồng ghép vào các chương trình đào tạo thiết kế. Giới trẻ ngày càng nhận thức rõ về tác động môi trường của ngành công nghiệp may mặc. Chính điều này giúp xu hướng thời trang bền vững trở nên lâu dài thay vì chỉ mang tính nhất thời. Nếu được tiếp tục đầu tư đúng hướng, đây sẽ là hướng đi chiến lược cho cả ngành công nghiệp thời trang trong thập kỷ tới.',
      numberOfComment: 2,
      numberOfTym: 70,
    ),

    NewsItem(
      id: '12',
      title: 'Chi tiết về chiếc điện thoại gập mới nhất của Samsung',
      source: 'Công nghệ & Đổi mới',
      timeAgo: '3d ago',
      imageUrl: 'assets/images/dienthoaigap.jpg',
      category: 'Công nghệ',
      topic: 'Thiết bị mới',
      author: 'assets/images/author.png',
      description:
          'Samsung tiếp tục khẳng định vị thế tiên phong trong lĩnh vực điện thoại gập bằng mẫu sản phẩm mới nhất ra mắt đầu năm 2025. Thiết kế lần này mỏng hơn, nhẹ hơn nhưng vẫn đảm bảo độ bền vượt trội. Màn hình chính có thể gập lại hoàn toàn mà không để lại nếp gấp, nhờ công nghệ bản lề mới. Máy được trang bị chip xử lý thế hệ mới nhất, mang lại hiệu năng mạnh mẽ kể cả khi chạy nhiều ứng dụng cùng lúc. Dung lượng pin được cải thiện đáng kể với thời gian sử dụng kéo dài hơn 15% so với phiên bản trước. Camera tích hợp AI cho phép chụp ảnh trong điều kiện thiếu sáng rõ nét và tự động cân chỉnh góc chụp. Samsung cũng bổ sung nhiều tính năng tùy biến màn hình kép để nâng cao trải nghiệm đa nhiệm. Hệ điều hành One UI được tối ưu hóa riêng cho dòng điện thoại gập. Thiết kế khung viền bằng hợp kim cao cấp tạo cảm giác sang trọng khi cầm trên tay. Máy còn hỗ trợ kết nối 5G ổn định cùng khả năng sạc siêu nhanh.\n\n'
          'Ngoài ra, Samsung đặc biệt chú trọng tới trải nghiệm người dùng với nhiều tính năng độc quyền. Ví dụ, chế độ Flex Mode giúp chia màn hình thành hai phần riêng biệt khi gập một nửa, rất hữu ích trong họp online hoặc xem video kèm ghi chú. Tính năng bảo mật cũng được tăng cường với cảm biến vân tay dưới màn hình và nhận diện khuôn mặt nhanh chóng. Các chuyên gia công nghệ đánh giá đây là một trong những mẫu điện thoại gập hoàn thiện nhất hiện nay. Samsung hướng đến nhóm khách hàng cao cấp và những người yêu thích công nghệ mới. Với chiến lược marketing thông minh, hãng đang từng bước mở rộng thị phần trong phân khúc thiết bị gập. Các phiên bản màu sắc thời thượng và giao diện tùy biến theo phong cách cá nhân là điểm cộng lớn. Giá bán tuy không rẻ nhưng xứng đáng với những gì mà thiết bị mang lại. Trong tương lai gần, điện thoại gập có thể trở thành chuẩn mực mới cho smartphone hiện đại.',
      numberOfComment: 79,
      numberOfTym: 82,
    ),

    NewsItem(
      id: '13',
      title: 'Các phương pháp học trực tuyến hiệu quả năm 2025',
      source: 'Giáo dục 4.0',
      timeAgo: '4d ago',
      imageUrl: 'assets/images/giaoduc.jpg',
      category: 'Giáo dục',
      topic: 'Học tập số',
      author: 'assets/images/author.png',
      description:
          'Trong bối cảnh chuyển đổi số mạnh mẽ, học trực tuyến đã trở thành lựa chọn phổ biến và hiệu quả trong năm 2025. Các nền tảng học tập hiện đại tích hợp AI để cá nhân hóa nội dung theo nhu cầu từng người học. Công nghệ thực tế ảo và tăng cường (VR/AR) giúp tạo ra các lớp học tương tác, sinh động và hấp dẫn. Ngoài ra, chatbot học tập đóng vai trò như gia sư ảo, hỗ trợ giải đáp thắc mắc 24/7. Học viên cũng có thể tham gia các khóa học ngắn hạn từ các trường đại học hàng đầu thế giới chỉ với vài cú nhấp chuột. Video bài giảng được xây dựng theo lộ trình rõ ràng, kèm theo bài tập thực hành và đánh giá tự động. Học online không còn khô khan mà ngày càng gần gũi nhờ các công cụ như gamification và phản hồi tức thì. Việc học nhóm qua Zoom, Google Meet hoặc các nền tảng học tập xã hội giúp tăng tính kết nối. Học trực tuyến giúp tiết kiệm thời gian, linh hoạt hơn cho người đi làm hoặc học sinh vùng sâu vùng xa. Tuy nhiên, việc duy trì kỷ luật học tập cá nhân vẫn là yếu tố then chốt để đạt hiệu quả.\n\n'
          'Một trong những xu hướng nổi bật là học tập kết hợp (blended learning) – nơi người học được tiếp cận cả bài giảng online và tương tác trực tiếp với giảng viên. Điều này giúp tăng cường khả năng hiểu bài và củng cố kiến thức. Các khóa học hiện đại còn tích hợp theo dõi tiến độ học, phân tích điểm mạnh – yếu để đưa ra gợi ý cải thiện. Một số nền tảng còn có tính năng cấp chứng chỉ kỹ thuật số xác nhận hoàn thành khóa học. Các doanh nghiệp cũng ngày càng đầu tư vào e-learning để đào tạo nhân viên, giúp tiết kiệm chi phí và thời gian. Ngoài ra, nhiều trường học tại Việt Nam đã đưa học online vào chương trình chính khóa như một phần không thể thiếu. Với sự phát triển không ngừng của công nghệ, học trực tuyến đang trở nên cá nhân hóa, linh hoạt và hiệu quả hơn bao giờ hết. Tương lai của giáo dục đang dần được định hình bởi những cú hích từ công nghệ số.',
      numberOfComment: 48,
      numberOfTym: 92,
    ),
  ];

  @override
  Future<List<NewsItem>> getNewsOfCurrentUser() async {
    return _listNewsOfCurrentUser;
  }

  @override
  Future<NewsItem> getNewsById(String newsId) async {
    _listNewsOfCurrentUser.addAll(_listNews);
    return _listNewsOfCurrentUser.firstWhere(
      (news) => news.id.trim() == newsId,
    );
  }

  @override
  Future<bool> changeTymNews(String newsId) {
    throw UnimplementedError();
  }
}
