import 'package:flutter_clean_architecture/domain/entities/author.dart';

abstract class AuthorsRepository {
  Future<List<Author>> getListAuthors(String key);

  Future<bool> changeFollowAuthor(String authorName);
}
