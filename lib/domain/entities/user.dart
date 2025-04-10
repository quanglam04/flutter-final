import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class CurrentUser {
  CurrentUser(
    this.id,
    this.fullName,
    this.imagePath,
    this.username,
    this.email,
    this.phoneNumber,
    this.bio,
    this.website,
  );

  String id;
  String? imagePath;
  String? fullName;
  String username;
  String email;
  String phoneNumber;
  String? bio;
  String? website;

  // Setters
  void setId(String value) => id = value;
  void setImagePath(String? value) => imagePath = value;
  void setFullName(String? value) => fullName = value;
  void setUsername(String value) => username = value;
  void setEmail(String value) => email = value;
  void setPhoneNumber(String value) => phoneNumber = value;
  void setBio(String? value) => bio = value;
  void setWebsite(String? value) => website = value;

  factory CurrentUser.fromJson(Map<String, dynamic> json) =>
      _$CurrentUserFromJson(json);

  Map<String, dynamic> toJson() => _$CurrentUserToJson(this);
}
