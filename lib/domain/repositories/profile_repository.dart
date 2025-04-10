import 'package:flutter_clean_architecture/domain/entities/user.dart';

abstract class ProfileRepository {
  Future<CurrentUser?> loadUserFromLocal();
  Future<void> saveUserToLocal(CurrentUser user);
}
