import 'dart:math';

import 'package:easy_localization/easy_localization.dart';

extension StringToNumberExtension on String {
  int? toInt() => int.tryParse(this);
}

extension IntRandomExtension on int {
  String getRandomString() {
    const _chars =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    final _rnd = Random();
    return String.fromCharCodes(
      Iterable.generate(
        this,
        (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length)),
      ),
    );
  }
}

extension NumberExtension on double {
  String toText({int fractionDigit = 1, String? prefix}) {
    String formattedNumber = toStringAsFixed(fractionDigit);

    if (formattedNumber.contains('.') && formattedNumber.endsWith('0')) {
      formattedNumber = formattedNumber.replaceAll(RegExp(r'0*$'), '');
    }

    if (formattedNumber.endsWith('.')) {
      formattedNumber =
          formattedNumber.substring(0, formattedNumber.length - 1);
    }

    if (prefix == null) {
      return formattedNumber;
    }
    if (this > 1) {
      return '$prefix.other'.tr(args: [formattedNumber]);
    }
    return '$prefix.one'.tr(args: [formattedNumber]);
  }

  String toTextFormat() {
    const locale = 'vi_VN';
    final formatter = NumberFormat.decimalPattern(locale);
    return formatter.format(this).replaceAll('.', ',');
  }

  String toTextDecimalENFormat() {
    const locale = 'en_EN';
    final formatter = NumberFormat.decimalPattern(locale);
    return formatter.format(this);
  }
}

extension DoubleNullableExtention on double? {
  double roundDouble(int fractionDigit) {
    return double.parse(this?.toStringAsFixed(fractionDigit) ?? '0.0');
  }

  double toMillion() {
    return (this ?? 0) / 1000000;
  }
}

extension ListUtils<T> on List<T> {
  num sumBy(num f(T element)) {
    num sum = 0;
    for (final item in this) {
      sum += f(item);
    }
    return sum;
  }
}

extension IntExtension on int {
  String toText({String? prefix}) {
    final String number = toString();
    if (prefix == null) {
      return number;
    }
    if (this > 1) {
      return '$prefix.other'.tr(args: [number]);
    }
    return '$prefix.one'.tr(args: [number]);
  }
}