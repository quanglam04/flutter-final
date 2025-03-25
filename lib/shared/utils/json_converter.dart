import 'package:json_annotation/json_annotation.dart';

class MapEntryConverter
    implements JsonConverter<MapEntry<int, String>, List<dynamic>> {
  const MapEntryConverter();

  @override
  MapEntry<int, String> fromJson(List<dynamic> json) {
    final key = json[0] as int;
    final value = json[1] as String;

    return MapEntry(key, value);
  }

  @override
  List<dynamic> toJson(MapEntry<int, String> object) =>
      [object.key, object.value];
}

class MapEntryConverterList
    implements JsonConverter<List<MapEntry<int, String>>, List<dynamic>> {
  const MapEntryConverterList();

  @override
  List<MapEntry<int, String>> fromJson(List<dynamic> json) {
    return json.map(
      (e) {
        final key = e[0] as int;
        final value = e[1] as String;
        return MapEntry(key, value);
      },
    ).toList();
  }

  @override
  List<List> toJson(List<MapEntry<int, String>> object) {
    return object.map((e) => [e.key, e.value]).toList();
  }
}

class DatetimeJsonConverter extends JsonConverter<DateTime, String> {
  const DatetimeJsonConverter();

  @override
  DateTime fromJson(String json) => DateTime.parse(json)
      .add(Duration(hours: DateTime.now().timeZoneOffset.inHours));

  @override
  String toJson(DateTime object) => object.toUtc().toIso8601String();
}
