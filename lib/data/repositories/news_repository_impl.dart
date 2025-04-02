import 'package:injectable/injectable.dart';
import '../../domain/repositories/news_repository.dart';

@Injectable(as: NewsRepository)
class NewsRepositoryImpl extends NewsRepository {
  NewsRepositoryImpl();
}