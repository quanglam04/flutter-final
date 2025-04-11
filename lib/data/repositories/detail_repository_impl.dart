import 'package:injectable/injectable.dart';
import '../../domain/repositories/detail_repository.dart';

@Injectable(as: DetailRepository)
class DetailRepositoryImpl extends DetailRepository {
  DetailRepositoryImpl();
}