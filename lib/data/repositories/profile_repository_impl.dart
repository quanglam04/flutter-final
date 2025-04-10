import 'dart:convert';

import 'package:flutter_clean_architecture/domain/entities/user.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../domain/repositories/profile_repository.dart';

@Injectable(as: ProfileRepository)
class ProfileRepositoryImpl extends ProfileRepository {
  ProfileRepositoryImpl();

  @override
  Future<CurrentUser?> loadUserFromLocal() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonString = prefs.getString('user_data');

    if (jsonString != null) {
      final userMap = jsonDecode(jsonString);
      // Gán vào User hiện tại
      CurrentUser user = CurrentUser(
        userMap['id'] ?? '',
        userMap['fullName'] ?? '',
        userMap['imgPath'] ?? '',
        userMap['username'] ?? '',
        userMap['email'] ?? '',
        userMap['phoneNumber'] ?? '',
        userMap['bio'] ?? '',
        userMap['website'] ?? '',
      );

      return user;
    }
    return null;
  }
}
