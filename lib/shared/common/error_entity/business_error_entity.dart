import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:json_annotation/json_annotation.dart';

import 'error_entity.dart';

part 'business_error_entity.g.dart';

@JsonSerializable()
class BusinessErrorEntity {
  BusinessErrorEntity({
    required this.message,
    required this.code,
    required this.data,
  });

  factory BusinessErrorEntity.fromJson(Map<String, dynamic> json) =>
      _$BusinessErrorEntityFromJson(json);

  int code;
  String message;
  BusinessErrorEntityData data;

  Map<String, dynamic> toJson() => _$BusinessErrorEntityToJson(this);

  @override
  String toString() {
    return jsonEncode(toJson());
  }
}

@JsonSerializable()
class BusinessErrorEntityData extends ErrorEntity {
  BusinessErrorEntityData({
    required this.name,
    required super.message,
    this.arguments,
    this.exceptionType = '',
    this.debug = '',
  });

  factory BusinessErrorEntityData.fromJson(Map<String, dynamic> json) =>
      _$BusinessErrorEntityDataFromJson(json);

  @override
  String get message => arguments?.firstOrNull?.toString() ?? 'Server error';

  final String name;
  final List? arguments;
  @JsonKey(name: 'exception_type')
  final String exceptionType;
  final String debug;

  Map<String, dynamic> toJson() => _$BusinessErrorEntityDataToJson(this);
}

class SessionExpiredErrorEntity extends ErrorEntity {
  SessionExpiredErrorEntity() : super(message: 'error.session_expired'.tr());
}

class AccessDeniedErrorEntity extends ErrorEntity {
  AccessDeniedErrorEntity() : super(message: 'error.access_denied'.tr());
}
