import 'package:flutter_clean_architecture/domain/entities/user.dart';

abstract class ProfileRepository {
  Future<CurrentUser?> loadUserFromLocal();
}
