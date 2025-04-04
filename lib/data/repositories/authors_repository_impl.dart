import 'package:flutter_clean_architecture/domain/entities/author.dart';
import 'package:injectable/injectable.dart';
import '../../domain/repositories/authors_repository.dart';

@Injectable(as: AuthorsRepository)
class AuthorsRepositoryImpl extends AuthorsRepository {
  AuthorsRepositoryImpl();

  @override
  Future<bool> changeFollowAuthor(String authorName) {
    throw UnimplementedError();
  }

  @override
  Future<List<Author>> getListAuthors(String key) async {
    if (key.trim() == '') return authors;
    return authors
        .where(
          (author) => author.brandName.trim().toLowerCase().contains(
            key.trim().toLowerCase(),
          ),
        )
        .toList();
  }

  static List<Author> authors = [
    Author(
      '1',
      'https://play-lh.googleusercontent.com/375NW5yL8owK_hW9igW9sh-YJbda9ZcygpDXuVvK_R7l-yJp-fuhb4qvUw_FE4XW4ms=w240-h480-rw',
      'Tech Guru',
      10000,
      true,
    ),
    Author(
      '2',
      'https://play-lh.googleusercontent.com/375NW5yL8owK_hW9igW9sh-YJbda9ZcygpDXuVvK_R7l-yJp-fuhb4qvUw_FE4XW4ms=w240-h480-rw',
      'Health Insights',
      1200,
      false,
    ),
    Author(
      '4',
      'https://hoanghamobile.com/tin-tuc/wp-content/uploads/2023/07/logo-dep-12.jpg',
      'Daily News',
      100,
      true,
    ),
    Author(
      '5',
      'https://play-lh.googleusercontent.com/375NW5yL8owK_hW9igW9sh-YJbda9ZcygpDXuVvK_R7l-yJp-fuhb4qvUw_FE4XW4ms=w240-h480-rw',
      'Sporty Life',
      9200,
      false,
    ),
    Author(
      '6',
      'https://play-lh.googleusercontent.com/375NW5yL8owK_hW9igW9sh-YJbda9ZcygpDXuVvK_R7l-yJp-fuhb4qvUw_FE4XW4ms=w240-h480-rw',
      'Business Trends',
      3400,
      true,
    ),
    Author(
      '7',
      'https://hoanghamobile.com/tin-tuc/wp-content/uploads/2023/07/logo-dep-12.jpg',
      'Travel Vibes',
      5600,
      false,
    ),
    Author(
      '8',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSI9geBuUIxBMywN0xsF2fXoHfyRyB7laeuOQ&s',
      'Science Hub',
      800,
      true,
    ),
    Author(
      '9',
      'https://play-lh.googleusercontent.com/375NW5yL8owK_hW9igW9sh-YJbda9ZcygpDXuVvK_R7l-yJp-fuhb4qvUw_FE4XW4ms=w240-h480-rw',
      'Fashion Forward',
      2300,
      false,
    ),
    Author(
      '11',
      'https://hoanghamobile.com/tin-tuc/wp-content/uploads/2023/07/logo-dep-12.jpg',
      'Gamer Zone',
      7800,
      true,
    ),
    Author(
      '12',
      'https://play-lh.googleusercontent.com/375NW5yL8owK_hW9igW9sh-YJbda9ZcygpDXuVvK_R7l-yJp-fuhb4qvUw_FE4XW4ms=w240-h480-rw',
      'Movie Buffs',
      6500,
      false,
    ),
    Author(
      '14',
      'https://play-lh.googleusercontent.com/375NW5yL8owK_hW9igW9sh-YJbda9ZcygpDXuVvK_R7l-yJp-fuhb4qvUw_FE4XW4ms=w240-h480-rw',
      'Crypto Kings',
      8900,
      true,
    ),
    Author(
      '15',
      'https://hoanghamobile.com/tin-tuc/wp-content/uploads/2023/07/logo-dep-12.jpg',
      'AI & Tech',
      1500,
      false,
    ),
  ];
}
