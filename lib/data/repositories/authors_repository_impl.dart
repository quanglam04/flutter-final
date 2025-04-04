import 'package:flutter_clean_architecture/domain/entities/author.dart';
import 'package:injectable/injectable.dart';
import '../../domain/repositories/authors_repository.dart';

@Injectable(as: AuthorsRepository)
class AuthorsRepositoryImpl extends AuthorsRepository {
  AuthorsRepositoryImpl();

  @override
  Future<bool> changeFollowAuthor(String authorName) async {
    Author author = authors.firstWhere(
      (author) => author.brandName.trim() == authorName,
    );
    author.isFollow = !author.isFollow;
    return author.isFollow;
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
      213000,
      true,
    ),
    Author(
      '2',
      'https://play-lh.googleusercontent.com/375NW5yL8owK_hW9igW9sh-YJbda9ZcygpDXuVvK_R7l-yJp-fuhb4qvUw_FE4XW4ms=w240-h480-rw',
      'Health Insights',
      124000,
      false,
    ),
    Author(
      '4',
      'https://hoanghamobile.com/tin-tuc/wp-content/uploads/2023/07/logo-dep-12.jpg',
      'Daily News',
      210000,
      true,
    ),
    Author(
      '5',
      'https://play-lh.googleusercontent.com/375NW5yL8owK_hW9igW9sh-YJbda9ZcygpDXuVvK_R7l-yJp-fuhb4qvUw_FE4XW4ms=w240-h480-rw',
      'Sporty Life',
      340000,
      false,
    ),
    Author(
      '6',
      'https://play-lh.googleusercontent.com/375NW5yL8owK_hW9igW9sh-YJbda9ZcygpDXuVvK_R7l-yJp-fuhb4qvUw_FE4XW4ms=w240-h480-rw',
      'Business Trends',
      640000,
      true,
    ),
    Author(
      '7',
      'https://hoanghamobile.com/tin-tuc/wp-content/uploads/2023/07/logo-dep-12.jpg',
      'Travel Vibes',
      320000,
      false,
    ),
    Author(
      '8',
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSI9geBuUIxBMywN0xsF2fXoHfyRyB7laeuOQ&s',
      'Science Hub',
      700000,
      true,
    ),
    Author(
      '9',
      'https://play-lh.googleusercontent.com/375NW5yL8owK_hW9igW9sh-YJbda9ZcygpDXuVvK_R7l-yJp-fuhb4qvUw_FE4XW4ms=w240-h480-rw',
      'Fashion Forward',
      560000,
      false,
    ),
    Author(
      '11',
      'https://hoanghamobile.com/tin-tuc/wp-content/uploads/2023/07/logo-dep-12.jpg',
      'Gamer Zone',
      1200000,
      true,
    ),
    Author(
      '12',
      'https://play-lh.googleusercontent.com/375NW5yL8owK_hW9igW9sh-YJbda9ZcygpDXuVvK_R7l-yJp-fuhb4qvUw_FE4XW4ms=w240-h480-rw',
      'Movie Buffs',
      540000,
      false,
    ),
    Author(
      '14',
      'https://play-lh.googleusercontent.com/375NW5yL8owK_hW9igW9sh-YJbda9ZcygpDXuVvK_R7l-yJp-fuhb4qvUw_FE4XW4ms=w240-h480-rw',
      'Crypto Kings',
      124300,
      true,
    ),
    Author(
      '15',
      'https://hoanghamobile.com/tin-tuc/wp-content/uploads/2023/07/logo-dep-12.jpg',
      'AI & Tech',
      100000,
      false,
    ),
  ];
}
