import 'package:json_annotation/json_annotation.dart';

part 'author.g.dart';

@JsonSerializable()
class Author {
  final String authorId;
  final String imagePath;
  final String brandName;
  final int followers;
  bool isFollow;
  Author(
    this.authorId,
    this.imagePath,
    this.brandName,
    this.followers,
    this.isFollow,
  );

  String getBranch() => brandName;

  factory Author.fromJson(Map<String, dynamic> json) => _$AuthorFromJson(json);

  Map<String, dynamic> toJson() => _$AuthorToJson(this);
}
